import 'package:calculator/controllers/provider/button_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.orange = false,
  });
  final String buttonText;
  final Function onPressed;
  final bool orange;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ButtonController(),
      child: Consumer<ButtonController>(
        builder: (context, value, child) => Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: value.clicked ? 50 : 60,
            width: value.clicked ? 50 : 60,
            child: ElevatedButton(
                onPressed: () {
                  value.buttonPress();

                  Future.delayed(const Duration(milliseconds: 200), () {
                    value.buttonPress();
                  });
                  onPressed();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: orange ? Colors.orange : Colors.white,
                  // minimumSize: Size(value.clicked ? 50 : 60, value.clicked ? 50 : 60),
                  elevation: 20,
                  shape: const CircleBorder(),
                  // animationDuration: const Duration(seconds: 5),
                ),
                child: AnimatedDefaultTextStyle(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: value.clicked ? 25 : 30,
                  ),
                  duration: const Duration(milliseconds: 100),
                  child: Text(
                    buttonText,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
