import 'dart:convert';

import 'mark.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.name,
    required this.surname,
    required this.groupName,
    this.marks,
  });
  User.user();

  late String name;
  late String surname;
  late String groupName;
  late List<Mark>? marks;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    surname: json["surname"],
    groupName: json["groupName"],
    // marks: List<Mark>.from(json["marks"].map((x) => Mark.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "surname": surname,
    "groupName": groupName,
    "marks": List<dynamic>.from(marks!.map((x) => x.toJson())),
  };
}