import '../models/user.dart';

class UserService{
  static User? _user;

  Future<User> getUser() async{
    if(_user != null) {
      return _user!;
    }
    _user = User(id: 1, name: 'Имя', surname: 'Фамилия', groupName: 'ПрИ-102', email: 'email@mail.com', password: '1234');
    return _user!;
  }
}