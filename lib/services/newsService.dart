import '../models/news.dart';
import 'package:http/http.dart' as http;

class NewsService{

  static late List<News>? news;
  static DateTime? _lastGettingData;

  //TODO сделать нормальное получение с сервера
  Future<List<News>> getNews() async{
    if(_lastGettingData != null &&
        DateTime.now().difference(_lastGettingData!).inMinutes <= 30){
      return news!;
    }
    news = [
      News(id: 302, image: 'https://cdn4.telegram-cdn.org/file/T1ShQQzHXEvTzjaM-g5peHRmfrZxVik2SP_G9K5rgnORZffmAHRm2tmkvO0vzsnYbCxFazYGTBv1RhfqYs7VsuWkS3ZK_W-Pma7QugCHMqy_tjaGx3L0Lp7YVURDYm0rxmYLk7J0dfsPD_IQ3HTRYdNlcR-IHMzCILaH-Q6yO5LPx8Q2Vpql6hdepm7claHsdENLkET5Hb6M4ouOhgfdFxjY2eFKhoZBDpZihg4GGxEfO1RPFWButmeWChTJKCyQshMvgAu3_g-HPaIOxP7A8sYJ9h_NbdUtsaMiOj7ItocpguTcyGIZZGuPfaTeBd0KMGmHQwxsqrou_hoWF88ptg.jpg', text: 'Представь, что ты отправляешь фото денег в Telegram, а бот за тебя подсчитывает их сумму.Считаешь, что сделать такое слишком тяжело?Наши студенты 2 курса в рамках учебной практики доказали, что это возможно. Им удалось создать Telegram-бота, который умеет различать деньги с фотографии. Две недели они общались с заказчиком (преподавателем) и выполняли его требования, а сейчас у них на руках есть проект, который они впоследствии могут развивать и модифицировать 👏🏻👏🏻👏🏻'),
      News(id: 299, image: 'https://cdn4.telegram-cdn.org/file/ctSkUJJmxIGjbJIda0n6-_O5hwIVp-b2Lcztilmvtndc93fivAzX2X-Q-7P1CWrDZzOQZrTe1unMnBZopnF7o__DzB9Z6b3dzHjmVrghyxjpZoO3PR3nw45Nz4sUDZWoiu0Qj9_eadu9DsHdCUYg2sZxYB7SfhKQJjaU4JpZ9kkyCln8iLW5JWt8GVS0MGfMK0GCIYumnVFNFA1zy9hEqJx4n9R8DeMtAlVlLl6JLY9Z9aimFuKiDI9jOexx8r-j5kT5-ZLbziyrf0aAzvXyzH5p1DKYRE8dx8wVs02hmoQfyqL2lF0pamYbskYUbD55EYrjp0tnVjsJrKolXq6X2Q.jpg', text: 'Наши студенты направления Бизнес-информатика проходят сертификацию компании 1С!! Сертификаты "1С:Профессионал" подтверждают, что их владелец может эффективно использовать в своей работе весь спектр возможностей систем управления предприятием и наиболее распространенных программ автоматизации бухгалтерского, управленческого учета и расчета заработной платы. Программирование 1С для наших БИшек не проблема! 💪🏻👌🏻 Поздравляем ребят!!!'),
      News(id: 298, image: 'https://cdn4.telegram-cdn.org/file/d-FFTvO2E7xCU8otP6ky_Xzmd0znCahKDIPpovjgY0LdGLOHGl__Wd97fVIoPWJbTx4Gj6BkVVjoxRz-B5eo-YOwCtsc_ltHCV6W0cCtT_i8DF783DzcV17GfjgKHNS4plIyBivkKsbiQCoTOsslNSzOXW6a3GWtcn5lELRVNkTulHE6dW8IQYKk_wu1HA5jkSjnLO4T3LSwS3zME0cyy0pc3xz5BLrQmYdSn0MgUfWdqntu6UdYe2GXQUCoAgLx3azmlQIexkPEWD6DsqLfnJ8A0iXUwChN9Wyioh0QcPkXLrpG4lPcoVA6deuKOn0e1Ew5UM3VX3JEtmgaQEttrg.jpg', text: 'Наши замечательные ПрИшки успешно защитили дипломы!! Все дипломы сделаны по запросу предприятий нашей области! Все дипломы отмечены членами комиссии и представителями работодателей, которые присутствовали на защите, как интересные с тщательно продуманной реализацией! Удачи вам, ребята, в вашем профессиональном пути!! 💥🥳👍🏻'),
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