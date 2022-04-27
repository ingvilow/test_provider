import 'Geo.dart';

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

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
      );

  Map<String, Object?> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
      };
}
