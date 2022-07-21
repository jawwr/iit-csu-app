import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constant.dart';
import '../../../models/news.dart';
import 'newsCardFooter.dart';
import 'newsCardImage.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({
    Key? key,
    required News news,
  })  : _news = news,
        super(key: key);

  final News _news;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async{
        final url = Uri.parse('https://t.me/iit_csu/${_news.id}');

        if(await canLaunchUrl(url)){
          await launchUrl(url, mode: LaunchMode.externalApplication,);
        }
      },
      child: Container(
        height: _news.hasImage! ? size.height * .55 : size.height * .25,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: lightBgColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: Colors.black.withOpacity(.5),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            _news.hasImage! ? NewsCardImage(image: _news.image) : Container(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5,),
                child: Text(
                  _news.text,
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'SF',
                      fontWeight: FontWeight.w500,
                      color: lightInfoColor),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            NewsCardFooter(size: size),
          ],
        ),
      ),
    );
  }
}

