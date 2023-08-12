import 'package:flutter/material.dart';

elevatedButtonStyle({required Color? color}) {
  return ElevatedButton.styleFrom(
    foregroundColor: Colors.blue,
    backgroundColor: color,
    minimumSize: const Size(60, 60),
    elevation: 20,
    shape: const CircleBorder(),
    // animationDuration: const Duration(seconds: 5),
  );
}

TextStyle? homeTextStyle() {
  return const TextStyle(color: Colors.black, fontSize: 20);
}


