import 'package:flutter/material.dart';

class NewsCardImage extends StatelessWidget {
  const NewsCardImage({
    Key? key,
    required String image,
  })  : _image = image,
        super(key: key);

  final String _image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5),
      width: size.width - 30,
      height: MediaQuery.of(context).size.height * .3,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Image.network(
        _image,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}