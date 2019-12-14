import 'package:scoped_model/scoped_model.dart';
import 'dart:async';

class UserModel extends Model {

  bool isLoadging = false;

  void signUp() {}

  void signIn() async {
    isLoadging = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    isLoadging = false;
    notifyListeners();
  }

  void recoverPass() {}

  bool isLogged() {}
}
