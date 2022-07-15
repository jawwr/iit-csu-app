import 'package:flutter/material.dart';
import 'package:iit_csu_app/services/newsService.dart';

import '../../constant.dart';
import '../../models/news.dart';
import 'components/newsCardBody.dart';

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