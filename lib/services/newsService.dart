import '../models/news.dart';
import 'package:http/http.dart' as http;

class NewsService{

  static late List<News>? news;
  static DateTime? _lastGettingData;

  //TODO сделать нормальное получение с сервера
  Future<List<News>> getNews() async{
    if(_lastGettingData != null &&
        DateTime.now().difference(_lastGettingData!).inMinutes <= 2){
      return news!;
    }
    news = [
      News(id: 302, image: 'https://cdn4.telegram-cdn.org/file/JibktWwI5F3OkCuCYJyusnUUiHHhLEP6Eut3AQYS2_z60l-2SobICyU-zEsEgkD4Ag4l5N4so5_48n9hyXkQtaRMwTbRiYF6dG3JciXpl-lx7cc0dZc8Kkp0zXqDc4I3z7ihB7aJps8c2uKXgLNhwOtws7uwBbXE8JJ695FMH42nfb9R71Gg8P_nyfhD6_UbtFKkPgjJ5W2l2gGU6ZMPYfxj_NmQDogZuoj9vKxL8Qnn3ymRQl8t9uhtt0L_Db29JOaxGi4yzu7AAJv4WgglYit92bCJf9qnNPALLvzr2qzcfSNBKH5uLS9SN_gJP3nENfEizLFcpOxUIj3t38Sh-w.jpg', text: 'Представь, что ты отправляешь фото денег в Telegram, а бот за тебя подсчитывает их сумму.Считаешь, что сделать такое слишком тяжело?Наши студенты 2 курса в рамках учебной практики доказали, что это возможно. Им удалось создать Telegram-бота, который умеет различать деньги с фотографии. Две недели они общались с заказчиком (преподавателем) и выполняли его требования, а сейчас у них на руках есть проект, который они впоследствии могут развивать и модифицировать 👏🏻👏🏻👏🏻'),
      News(id: 299, image: 'https://cdn4.telegram-cdn.org/file/ctSkUJJmxIGjbJIda0n6-_O5hwIVp-b2Lcztilmvtndc93fivAzX2X-Q-7P1CWrDZzOQZrTe1unMnBZopnF7o__DzB9Z6b3dzHjmVrghyxjpZoO3PR3nw45Nz4sUDZWoiu0Qj9_eadu9DsHdCUYg2sZxYB7SfhKQJjaU4JpZ9kkyCln8iLW5JWt8GVS0MGfMK0GCIYumnVFNFA1zy9hEqJx4n9R8DeMtAlVlLl6JLY9Z9aimFuKiDI9jOexx8r-j5kT5-ZLbziyrf0aAzvXyzH5p1DKYRE8dx8wVs02hmoQfyqL2lF0pamYbskYUbD55EYrjp0tnVjsJrKolXq6X2Q.jpg', text: 'Наши студенты направления Бизнес-информатика проходят сертификацию компании 1С!! Сертификаты "1С:Профессионал" подтверждают, что их владелец может эффективно использовать в своей работе весь спектр возможностей систем управления предприятием и наиболее распространенных программ автоматизации бухгалтерского, управленческого учета и расчета заработной платы. Программирование 1С для наших БИшек не проблема! 💪🏻👌🏻 Поздравляем ребят!!!'),
      News(id: 298, image: 'https://cdn4.telegram-cdn.org/file/I6vbOpLHuUEwFb56HcV3kRsMQTjdGqO5pHNyi1fqtpizOpZ4WEPJue3-xZ-UsO8FWSJxSMhNsd-izhQTRUp0VEeYXA6FBcPD1HpMOFFe_XhNctUPe04suTsWJMANDmjjDmYm3sWhgAT0H8mEi6d-hmXYfFt3NiNaiJJI_cTwOwikMFVpEzygRFaik66SO8RkfZSFPjbMTaPKdcYZ8oSZZS4QbH1fJkzDrYhQW1BCMCtmRLsYgmjEREPVhk-1SsjkQ_RwPMJw-JNJgE7OMYQQKETCH0sz6Zjwyb3TvaXs2aVRHqiScWV3PVVFiGbCOkHaXSqVGFE-WXNx1ZZmivelgw.jpg', text: 'Наши замечательные ПрИшки успешно защитили дипломы!! Все дипломы сделаны по запросу предприятий нашей области! Все дипломы отмечены членами комиссии и представителями работодателей, которые присутствовали на защите, как интересные с тщательно продуманной реализацией! Удачи вам, ребята, в вашем профессиональном пути!! 💥🥳👍🏻'),
    ];
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
    var client = http.Client();
    var response = await client.get(Uri.parse(image));
    if(response.statusCode != 200){
      return false;
    }
    return true;
  }
}