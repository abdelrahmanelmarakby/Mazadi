import 'dart:convert';

Zone zoneFromJson(String str) => Zone.fromJson(json.decode(str));

String zoneToJson(Zone data) => json.encode(data.toJson());

class Zone {
  Zone({
    this.zones,
  });

  List<ZoneElement> zones;

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        zones: List<ZoneElement>.from(
            json["zones"].map((x) => ZoneElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "zones": List<dynamic>.from(zones.map((x) => x.toJson())),
      };
}

class ZoneElement {
  ZoneElement({
    this.zoneId,
    this.countryId,
    this.name,
    this.code,
    this.status,
  });

  String zoneId;
  String countryId;
  String name;
  String code;
  String status;

  factory ZoneElement.fromJson(Map<String, dynamic> json) => ZoneElement(
        zoneId: json["zone_id"],
        countryId: json["country_id"],
        name: json["name"],
        code: json["code"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "zone_id": zoneId,
        "country_id": countryId,
        "name": name,
        "code": code,
        "status": status,
      };
}
