import 'package:calculator/controllers/provider/display_cotroller.dart';
import 'package:calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (BuildContext context) => DisplayController(),
        child: const Homepage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
