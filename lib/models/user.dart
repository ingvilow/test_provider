import 'package:json_annotation/json_annotation.dart';
import 'package:test_provider/models/Address.dart';
import 'package:test_provider/models/Company.dart';

part 'user.g.dart';

@JsonSerializable()
class Users {
  final int id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  Users({
    required this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
