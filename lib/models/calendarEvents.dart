import 'dart:convert';

import 'package:iit_csu_app/models/event.dart';

CalendarEvents calendarEventsFromJson(String str) => CalendarEvents.fromJson(json.decode(str));

String calendarEventsToJson(CalendarEvents data) => json.encode(data.toJson());

class CalendarEvents {
  CalendarEvents({
    required this.groupName,
    required this.events,
  });

  String groupName;
  List<Event> events;

  factory CalendarEvents.fromJson(Map<String, dynamic> json) => CalendarEvents(
    groupName: json["groupName"],
    events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "groupName": groupName,
    "events": List<dynamic>.from(events.map((x) => x.toJson())),
  };
}