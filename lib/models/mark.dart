import 'dart:convert';

List<Mark> markFromJson(String str) => List<Mark>.from(json.decode(str).map((x) => Mark.fromJson(x)));

String markToJson(List<Mark> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mark {
  Mark({
    required this.userId,
    required this.lessonName,
    required this.mark,
  });

  int userId;
  String lessonName;
  String mark;

  factory Mark.fromJson(Map<String, dynamic> json) => Mark(
    userId: json["userId"],
    lessonName: json["lessonName"],
    mark: json["mark"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "lessonName": lessonName,
    "mark": mark,
  };
}