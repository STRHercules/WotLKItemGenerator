use serde_json::json;

use crate::storage::models::{
    AppSettings, LibraryQuery, RunConfiguration, RunStatusUpdate, SourceFingerprint,
};

#[test]
fn storage_dtos_serialize_with_camel_case_keys() {
    let config = RunConfiguration {
        seed: "1234567890".into(),
        output_dir: "C:/Packs/generated-1234567890".into(),
        engine_version: "0.1.0".into(),
        protocol_version: 1,
        expansion: "Wrath".into(),
        item_count: 10_000,
        classes: vec!["Paladin".into()],
        config: json!({"magicEffects": "All"}),
    };
    let value = serde_json::to_value(config).unwrap();
    assert_eq!(value["outputDir"], "C:/Packs/generated-1234567890");
    assert_eq!(value["engineVersion"], "0.1.0");
    assert_eq!(value["protocolVersion"], 1);
    assert_eq!(value["itemCount"], 10_000);
    assert!(value.get("output_dir").is_none());
}

#[test]
fn query_and_status_contracts_keep_stable_frontend_names() {
    let query = LibraryQuery {
        class_name: Some("Paladin".into()),
        item_level_min: Some(200),
        minimum_socket_count: Some(2),
        ..Default::default()
    };
    let value = serde_json::to_value(query).unwrap();
    assert_eq!(value["className"], "Paladin");
    assert_eq!(value["itemLevelMin"], 200);
    assert_eq!(value["minimumSocketCount"], 2);

    let update = RunStatusUpdate {
        status: "complete".into(),
        finished_at: Some("2026-09-15T21:30:00Z".into()),
        elapsed_ms: Some(2500),
        validation_error_count: Some(0),
        summary: Some(json!({"itemCount": 10_000})),
        index_status: Some("indexed".into()),
        index_error: None,
    };
    let value = serde_json::to_value(update).unwrap();
    assert_eq!(value["finishedAt"], "2026-09-15T21:30:00Z");
    assert_eq!(value["elapsedMs"], 2500);
    assert_eq!(value["validationErrorCount"], 0);
}

#[test]
fn settings_and_source_contracts_are_json_round_trippable() {
    let mut settings = AppSettings::default();
    settings.default_expansion = "Wrath".into();
    let raw = serde_json::to_string(&settings).unwrap();
    let decoded: AppSettings = serde_json::from_str(&raw).unwrap();
    assert_eq!(decoded.default_expansion, "Wrath");

    let source = SourceFingerprint {
        logical_name: "Item.dbc".into(),
        path: "C:/Data/Item.dbc".into(),
        sha256: "abc".into(),
        size: 42,
        modified_at: None,
    };
    let value = serde_json::to_value(source).unwrap();
    assert_eq!(value["logicalName"], "Item.dbc");
    assert_eq!(value["modifiedAt"], serde_json::Value::Null);
}
