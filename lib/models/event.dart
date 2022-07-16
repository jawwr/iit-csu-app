import 'dart:convert';

List<Event> eventFromJson(String str) => List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  Event({
    required this.eventName,
    required this.dateEnd,
    required this.lessonName,
    required this.id,
  });

  String eventName;
  DateTime dateEnd;
  String lessonName;
  int id;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    eventName: json["eventName"],
    dateEnd: DateTime.parse(json["dateEnd"]),
    lessonName: json["lessonName"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "eventName": eventName,
    "date": dateEnd.toIso8601String(),
    "lessonName": lessonName,
    "id": id,
  };
}