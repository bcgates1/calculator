import 'package:calculator/controllers/provider/display_cotroller.dart';
import 'package:calculator/screens/widgets/widgets.dart';
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
                Color.fromARGB(255, 33, 150, 243),
                // Color.fromARGB(255, 156, 39, 176),
                // Color.fromARGB(255, 0, 150, 136),
                // Color.fromARGB(255, 76, 175, 80),
                // Color.fromARGB(255, 255, 87, 34),
                // Color.fromARGB(255, 233, 30, 99),
                Color.fromARGB(255, 3, 169, 244),
                Color.fromARGB(255, 206, 147, 216)
              ],
            ),
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.5,
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    buttonText: 'AC',
                    onPressed: () => displayController.buttonPress(buttonText: 'AC'),
                  ),
                  MyButton(
                    buttonText: '00',
                    onPressed: () => displayController.buttonPress(buttonText: '00'),
                  ),
                  MyButton(
                    buttonText: '%',
                    onPressed: () => displayController.buttonPress(buttonText: '%'),
                  ),
                  MyButton(
                    buttonText: '÷',
                    onPressed: () => displayController.buttonPress(buttonText: '÷'),
                    orange: true,
                  ),
                ],
              ),
              Row(
                children: [
                  MyButton(
                    buttonText: '7',
                    onPressed: () => displayController.buttonPress(buttonText: '7'),
                  ),
                  MyButton(
                    buttonText: '8',
                    onPressed: () => displayController.buttonPress(buttonText: '8'),
                  ),
                  MyButton(
                    buttonText: '9',
                    onPressed: () => displayController.buttonPress(buttonText: '9'),
                  ),
                  MyButton(
                    buttonText: '×',
                    onPressed: () => displayController.buttonPress(buttonText: '×'),
                    orange: true,
                  )
                ],
              ),
              Row(
                children: [
                  MyButton(
                    buttonText: '4',
                    onPressed: () => displayController.buttonPress(buttonText: '4'),
                  ),
                  MyButton(
                    buttonText: '5',
                    onPressed: () => displayController.buttonPress(buttonText: '5'),
                  ),
                  MyButton(
                    buttonText: '6',
                    onPressed: () => displayController.buttonPress(buttonText: '6'),
                  ),
                  MyButton(
                    buttonText: '-',
                    onPressed: () => displayController.buttonPress(buttonText: '-'),
                    orange: true,
                  )
                ],
              ),
              Row(
                children: [
                  MyButton(
                    buttonText: '1',
                    onPressed: () => displayController.buttonPress(buttonText: '1'),
                  ),
                  MyButton(
                    buttonText: '2',
                    onPressed: () => displayController.buttonPress(buttonText: '2'),
                  ),
                  MyButton(
                    buttonText: '3',
                    onPressed: () => displayController.buttonPress(buttonText: '3'),
                  ),
                  MyButton(
                    buttonText: '+',
                    onPressed: () => displayController.buttonPress(buttonText: '+'),
                    orange: true,
                  )
                ],
              ),
              Row(
                children: [
                  MyButton(
                    buttonText: '⌫',
                    onPressed: () => displayController.buttonPress(buttonText: '←'),
                  ),
                  MyButton(
                    buttonText: '0',
                    onPressed: () => displayController.buttonPress(buttonText: '0'),
                  ),
                  MyButton(
                    buttonText: '.',
                    onPressed: () => displayController.buttonPress(buttonText: '.'),
                  ),
                  MyButton(
                    buttonText: '=',
                    onPressed: () => displayController.buttonPress(buttonText: '='),
                    orange: true,
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
