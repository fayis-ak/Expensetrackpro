import 'package:flutter/cupertino.dart';

class controller with ChangeNotifier {
  bool obscuretext = false;

  void toggle() {
    obscuretext = !obscuretext;
    notifyListeners();
  }
  
}
