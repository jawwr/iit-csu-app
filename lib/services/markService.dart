import 'package:iit_csu_app/models/mark.dart';
import 'package:iit_csu_app/services/userService.dart';

class MarkService{
  final UserService _service = UserService();

  //TODO сделать нормально
  Future<List<Mark>> getAllMarks() async{
    final List<Mark> list = [
      Mark('Программирование', '60'),
      Mark('Математический анализ', '100'),
      Mark('Базы данных', '50'),
      Mark('Информатика', '74'),
      Mark('Прикладная и оздоровительная физическая культура', '-'),
      Mark('Дискретная математика', '-'),
      Mark('Линейная алгебра', '12'),
    ];
    return list;
  }

}