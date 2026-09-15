use std::{
    collections::{HashMap, HashSet},
    sync::{Arc, Mutex},
};

use tauri_plugin_shell::process::CommandChild;

pub struct ProcessRegistry<T = CommandChild> {
    children: Arc<Mutex<HashMap<String, T>>>,
    cancelled: Arc<Mutex<HashSet<String>>>,
}

impl<T> Clone for ProcessRegistry<T> {
    fn clone(&self) -> Self {
        Self {
            children: Arc::clone(&self.children),
            cancelled: Arc::clone(&self.cancelled),
        }
    }
}

impl<T> Default for ProcessRegistry<T> {
    fn default() -> Self {
        Self {
            children: Arc::new(Mutex::new(HashMap::new())),
            cancelled: Arc::new(Mutex::new(HashSet::new())),
        }
    }
}

impl<T> ProcessRegistry<T> {
    pub fn insert(&self, run_id: String, child: T) -> Result<(), String> {
        let mut children = self
            .children
            .lock()
            .map_err(|_| "engine process registry lock is poisoned".to_string())?;
        if children.contains_key(&run_id) {
            return Err(format!("generation run {run_id} is already active"));
        }
        children.insert(run_id, child);
        Ok(())
    }

    pub fn contains(&self, run_id: &str) -> Result<bool, String> {
        let children = self
            .children
            .lock()
            .map_err(|_| "engine process registry lock is poisoned".to_string())?;
        Ok(children.contains_key(run_id))
    }

    pub fn take(&self, run_id: &str) -> Result<Option<T>, String> {
        let mut children = self
            .children
            .lock()
            .map_err(|_| "engine process registry lock is poisoned".to_string())?;
        Ok(children.remove(run_id))
    }

    pub fn remove(&self, run_id: &str) -> Result<(), String> {
        let _ = self.take(run_id)?;
        Ok(())
    }

    pub fn mark_cancelled(&self, run_id: &str) -> Result<(), String> {
        let mut cancelled = self
            .cancelled
            .lock()
            .map_err(|_| "engine cancellation registry lock is poisoned".to_string())?;
        cancelled.insert(run_id.to_string());
        Ok(())
    }

    pub fn take_cancelled(&self, run_id: &str) -> Result<bool, String> {
        let mut cancelled = self
            .cancelled
            .lock()
            .map_err(|_| "engine cancellation registry lock is poisoned".to_string())?;
        Ok(cancelled.remove(run_id))
    }
}

impl ProcessRegistry<CommandChild> {
    pub fn cancel(&self, run_id: &str) -> Result<(), String> {
        let child = self
            .take(run_id)?
            .ok_or_else(|| format!("generation run {run_id} is not active"))?;
        self.mark_cancelled(run_id)?;
        if let Err(error) = child.kill() {
            let _ = self.take_cancelled(run_id);
            return Err(format!("failed to cancel generation run {run_id}: {error}"));
        }
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::ProcessRegistry;

    #[test]
    fn registry_rejects_duplicates_and_supports_take() {
        let registry = ProcessRegistry::<u32>::default();
        registry.insert("run-a".into(), 10).unwrap();
        assert!(registry.contains("run-a").unwrap());
        assert!(registry.insert("run-a".into(), 20).is_err());
        assert_eq!(registry.take("run-a").unwrap(), Some(10));
        assert!(!registry.contains("run-a").unwrap());
    }

    #[test]
    fn remove_is_idempotent_for_finished_runs() {
        let registry = ProcessRegistry::<u32>::default();
        registry.insert("run-b".into(), 1).unwrap();
        registry.remove("run-b").unwrap();
        registry.remove("run-b").unwrap();
        assert!(!registry.contains("run-b").unwrap());
    }

    #[test]
    fn cancellation_marker_is_consumed_once() {
        let registry = ProcessRegistry::<u32>::default();
        registry.mark_cancelled("run-c").unwrap();
        assert!(registry.take_cancelled("run-c").unwrap());
        assert!(!registry.take_cancelled("run-c").unwrap());
    }
}
