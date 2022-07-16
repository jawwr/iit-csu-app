import 'dart:convert';

List<News> newsFromJson(String str) => List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  News({
    required this.id,
    required this.image,
    required this.text,
  });

  int id;
  String image;
  String text;
  bool? hasImage;

  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["id"],
    image: json["image"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "text": text,
  };
}
