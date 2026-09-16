use serde::{Deserialize, Serialize};
use serde_json::Value;

pub const EVENT_PROTOCOL_VERSION: u32 = 1;

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
#[serde(tag = "type", rename_all = "snake_case")]
pub enum EngineEvent {
    Configured {
        protocol_version: u32,
        seed: String,
        number: u64,
        source: Option<String>,
        output_dir: Option<String>,
        classes: Option<Vec<String>>,
        class_counts: Option<Value>,
        expansion: Option<String>,
        magic_effects: Option<String>,
        loot_destinations: Option<Vec<String>>,
        disabled_features: Option<Vec<String>>,
        #[serde(default)]
        source_cache_status: Option<String>,
        #[serde(default)]
        source_cache_elapsed_ms: Option<f64>,
        #[serde(default)]
        source_catalog_rebuilt: Option<bool>,
    },
    Phase {
        protocol_version: u32,
        name: String,
        #[serde(default)]
        detail: String,
        total: Option<u64>,
    },
    Progress {
        protocol_version: u32,
        completed: u64,
        total: u64,
        #[serde(default)]
        current: String,
        class_name: Option<String>,
        class_completed: Option<u64>,
        class_total: Option<u64>,
    },
    Status {
        protocol_version: u32,
        message: String,
    },
    Discovery {
        protocol_version: u32,
        kind: String,
        title: String,
        #[serde(default)]
        detail: String,
    },
    SourceCheck {
        protocol_version: u32,
        label: String,
        path: String,
        ok: bool,
    },
    Validation {
        protocol_version: u32,
        error_count: usize,
        #[serde(default)]
        errors: Vec<String>,
        name_repair_count: usize,
        #[serde(default)]
        name_repairs: Value,
    },
    Complete {
        protocol_version: u32,
        report: Value,
        elapsed: f64,
        output_dir: String,
    },
    Error {
        protocol_version: u32,
        stage: Option<String>,
        message: String,
        details: Option<Value>,
    },
}

impl EngineEvent {
    pub fn is_complete(&self) -> bool {
        matches!(self, Self::Complete { .. })
    }

    pub fn is_error(&self) -> bool {
        matches!(self, Self::Error { .. })
    }
}

pub fn parse_event_line(line: &str) -> Result<EngineEvent, String> {
    let value: Value = serde_json::from_str(line)
        .map_err(|error| format!("invalid engine event JSON: {error}"))?;
    let version = value
        .get("protocol_version")
        .and_then(Value::as_u64)
        .ok_or_else(|| "engine event is missing numeric protocol_version".to_string())?;
    if version != u64::from(EVENT_PROTOCOL_VERSION) {
        return Err(format!(
            "unsupported engine event protocol {version}; expected {EVENT_PROTOCOL_VERSION}"
        ));
    }
    serde_json::from_value(value).map_err(|error| format!("invalid engine event payload: {error}"))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parses_protocol_v1_progress() {
        let event = parse_event_line(
            r#"{"protocol_version":1,"type":"progress","completed":2,"total":10,"current":"Mage","class_name":null,"class_completed":null,"class_total":null}"#,
        )
        .expect("progress event should parse");
        assert!(matches!(
            event,
            EngineEvent::Progress {
                completed: 2,
                total: 10,
                ..
            }
        ));
    }

    #[test]
    fn rejects_incompatible_protocol() {
        let error =
            parse_event_line(r#"{"protocol_version":2,"type":"status","message":"working"}"#)
                .expect_err("protocol v2 must be rejected");
        assert!(error.contains("protocol"));
    }
}
