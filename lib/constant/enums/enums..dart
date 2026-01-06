import 'package:json_annotation/json_annotation.dart';

enum ProjectStatus {
  @JsonValue(1) active,
  @JsonValue(2) onHold,
  @JsonValue(3) complete,
}

enum UnitStatus {
  @JsonValue(1) available,
  @JsonValue(2) sold,
  @JsonValue(3) reserved,
  @JsonValue(4) rented,
}

enum UnitType {
  @JsonValue(1) apartment,
  @JsonValue(2) villa,
  @JsonValue(3) townhouse,
  @JsonValue(4) studio,
}
