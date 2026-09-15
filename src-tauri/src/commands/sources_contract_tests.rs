use crate::commands::sources::{OPTIONAL_SOURCES, REQUIRED_SOURCES};

#[test]
fn desktop_source_contract_matches_generator_interactive_requirements() {
    assert_eq!(REQUIRED_SOURCES.len(), 16);
    assert!(REQUIRED_SOURCES.iter().any(|source| source.filename == "Item.dbc"));
    assert!(REQUIRED_SOURCES.iter().any(|source| source.filename == "item_template.sql"));
    assert!(OPTIONAL_SOURCES.iter().any(|source| source.filename == "Item.custom.dbc"));
    assert!(OPTIONAL_SOURCES.iter().any(|source| source.filename == "gameobject_loot_template.sql"));
}
