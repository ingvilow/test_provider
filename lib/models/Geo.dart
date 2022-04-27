class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  String? lat;
  String? lng;

  factory Geo.fromJson(Map<String, String> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, Object?> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
