import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  String? username;

  void setUsername(String name) {
    username = name;
    notifyListeners();
  }
}
