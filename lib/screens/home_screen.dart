import 'package:calculator/controllers/provider/display_cotroller.dart';
import 'package:calculator/screens/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    DisplayController displayController = Provider.of<DisplayController>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff000000),
                Color.fromARGB(255, 34, 85, 195),
                Color(0xff000000),
              ],
            ),
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  height: 400,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Consumer<DisplayController>(
                      builder: (context, displayController, child) => Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            displayController.displayText,
                            style: const TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          if (displayController.resultDisplay.isNotEmpty)
                            Text(
                              '=${displayController.resultDisplay}',
                              style: const TextStyle(color: Colors.white, fontSize: 40),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: 'AC');
                    },
                    style: elevatedButtonStyle(color: Colors.white),
                    child: Text(
                      'AC',
                      style: homeTextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: elevatedButtonStyle(color: Colors.white),
                    child: Text(
                      '+/-',
                      style: homeTextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '%');
                    },
                    style: elevatedButtonStyle(color: Colors.white),
                    child: Text(
                      '%',
                      style: homeTextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '÷');
                    },
                    style: elevatedButtonStyle(color: Colors.orange),
                    child: Text(
                      '÷',
                      style: homeTextStyle(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '1');
                    },
                    style: elevatedButtonStyle(color: Colors.white),
                    child: Text(
                      '1',
                      style: homeTextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '2');
                    },
                    style: elevatedButtonStyle(color: Colors.white),
                    child: Text(
                      '2',
                      style: homeTextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '3');
                    },
                    style: elevatedButtonStyle(color: Colors.white),
                    child: Text(
                      '3',
                      style: homeTextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '×');
                    },
                    style: elevatedButtonStyle(color: Colors.orange),
                    child: Text(
                      '×',
                      style: homeTextStyle(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '4');
                    },
                    style: elevatedButtonStyle(color: Colors.white),
                    child: Text(
                      '4',
                      style: homeTextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '5');
                    },
                    style: elevatedButtonStyle(color: Colors.white),
                    child: Text(
                      '5',
                      style: homeTextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '6');
                    },
                    style: elevatedButtonStyle(color: Colors.white),
                    child: Text(
                      '6',
                      style: homeTextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '+');
                    },
                    style: elevatedButtonStyle(color: Colors.orange),
                    child: Text(
                      '+',
                      style: homeTextStyle(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '7');
                    },
                    style: elevatedButtonStyle(color: Colors.white),
                    child: Text(
                      '7',
                      style: homeTextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '8');
                    },
                    style: elevatedButtonStyle(color: Colors.white),
                    child: Text(
                      '8',
                      style: homeTextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '9');
                    },
                    style: elevatedButtonStyle(color: Colors.white),
                    child: Text(
                      '9',
                      style: homeTextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '-');
                    },
                    style: elevatedButtonStyle(color: Colors.orange),
                    child: Text(
                      '-',
                      style: homeTextStyle(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '←');
                    },
                    style: elevatedButtonStyle(color: Colors.white),
                    child: const Icon(
                      Icons.backspace_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '0');
                    },
                    style: elevatedButtonStyle(color: Colors.white),
                    child: Text(
                      '0',
                      style: homeTextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '.');
                    },
                    style: elevatedButtonStyle(color: Colors.white),
                    child: Text(
                      '.',
                      style: homeTextStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      displayController.buttonPress(buttonText: '=');
                    },
                    style: elevatedButtonStyle(color: Colors.orange),
                    child: Text(
                      '=',
                      style: homeTextStyle(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
