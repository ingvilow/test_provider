import 'package:json_annotation/json_annotation.dart';

part 'Company.g.dart';

@JsonSerializable()
class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory Company.fromJson(Map<String, String> json) => _$CompanyFromJson(json);

  Map<String, Object?> toJson() => _$CompanyToJson(this);
}
