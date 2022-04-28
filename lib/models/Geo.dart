import 'package:json_annotation/json_annotation.dart';

part 'Geo.g.dart';

@JsonSerializable()
class Geo {
  String? lat;
  String? lng;

  Geo({
    this.lat,
    this.lng,
  });

  factory Geo.fromJson(Map<String, String> json) => _$GeoFromJson(json);

  Map<String, Object?> toJson() => _$GeoToJson(this);
}
