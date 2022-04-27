import 'package:json_annotation/json_annotation.dart';

part 'Geo.g.dart';

@JsonSerializable()
class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  String? lat;
  String? lng;

  factory Geo.fromJson(Map<String, String> json) => _$GeoFromJson(json);

  Map<String, Object?> toJson() => _$GeoToJson(this);
}
