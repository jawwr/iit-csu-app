import 'package:flutter/material.dart';
import 'package:iit_csu_app/services/newsService.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';
import '../../models/news.dart';

final bucketGlobal = PageStorageBucket();

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsService _service = NewsService();
  bool _isLoad = false;
  late List<News> _news = [];

  Future<void> _getNews() async {
    var newsList = await _service.getNews();
    setState(() {
      _news = newsList;
      _isLoad = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueBgColor,
        title: const Center(
          child: Text(
            'Новости',
            style: TextStyle(
              color: darkInfoColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF',
            ),
          ),
        ),
      ),
      body: PageStorage(
        bucket: bucketGlobal,
        child: RefreshIndicator(
          color: Colors.white,
          backgroundColor: blueBgColor,
          onRefresh: _getNews,
          child: _isLoad
              ? ListView.builder(
            key: const PageStorageKey<String>('newsPage'),
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  itemCount: _news.length,
                  itemBuilder: (context, index) => NewsBody(news: _news[index]),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: blueBgColor,
                  ),
                ),
        ),
      ),
    );
  }
}

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
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              color: blueBgColor,
              height: 20,
              width: size.width,
            )
          ],
        ),
      ),
    );
  }
}

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
