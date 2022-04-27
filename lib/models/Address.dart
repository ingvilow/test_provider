import 'Geo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Address.g.dart';

@JsonSerializable()
class Address {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    required this.geo,
  });

  String? street;
  String? suite;
  String? city;
  String? zipcode;
  late Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, Object?> toJson() => _$AddressToJson(this);
}
