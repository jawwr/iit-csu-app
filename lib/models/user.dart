import 'dart:convert';

import 'mark.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.login,
    required this.password,
    required this.groupName,
    this.marks,
  });
  User.user();

  late int id;
  late String name;
  late String surname;
  late String login;
  late String password;
  late String groupName;
  late List<Mark>? marks;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    surname: json["surname"],
    login: json["email"],
    password: json["password"],
    groupName: json["groupName"],
    marks: List<Mark>.from(json["marks"].map((x) => Mark.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "surname": surname,
    "email": login,
    "password": password,
    "groupName": groupName,
    "marks": List<dynamic>.from(marks!.map((x) => x.toJson())),
  };
}