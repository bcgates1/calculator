import 'package:flutter/material.dart';

class ButtonController extends ChangeNotifier {
  bool clicked = false;
  buttonPress() {
    clicked = !clicked;
    notifyListeners();
  }
}
