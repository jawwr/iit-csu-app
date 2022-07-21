import 'dart:convert';

import '../models/news.dart';
import 'package:http/http.dart' as http;

class NewsService{
  
  final _client = http.Client();
  static late List<News>? news;
  static DateTime? _lastGettingData;
  


  Future<List<News>> getNews() async{
    if(_lastGettingData != null &&
        DateTime.now().difference(_lastGettingData!).inMinutes <= 2){
      return news!;
    }
    final response = await _client.get(Uri.parse('http://10.0.2.2:8081/api/news'));//TODO поменять ссылку на наш api
    if(response.statusCode == 200){
      Iterable l = json.decode(utf8.decode(response.bodyBytes));
      news = List<News>.from(l.map((model) => News.fromJson(model)));
      _lastGettingData = DateTime.now();
    }else{
      throw Exception('Нет соединения');
    }
    for(var news in news!){
      news.hasImage = await _checkImageExist(news.image);
    }
    _lastGettingData = DateTime.now();
    return news!;
  }
  Future<bool> _checkImageExist(String image) async{
    if(image == ''){
      return false;
    }
    var response = await _client.get(Uri.parse(image));
    if(response.statusCode != 200){
      return false;
    }
    return true;
  }
}