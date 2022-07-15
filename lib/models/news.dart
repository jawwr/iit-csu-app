class News {
  int id;
  String image, text;
  bool? hasImage;

  News({
    required this.id,
    required this.image,
    required this.text,
    this.hasImage
  });
}
