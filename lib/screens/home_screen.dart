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
                children: ['AC', '00', '%', '÷']
                    .map(
                      (e) => MyButton(
                        buttonText: e,
                        onPressed: () => displayController.buttonPress(buttonText: e),
                      ),
                    )
                    .toList(),
              ),
              Row(
                children: ['7', '8', '9', '×']
                    .map(
                      (e) => MyButton(
                        buttonText: e,
                        onPressed: () => displayController.buttonPress(buttonText: e),
                      ),
                    )
                    .toList(),
              ),
              Row(
                children: ['4', '5', '6', '-']
                    .map(
                      (e) => MyButton(
                        buttonText: e,
                        onPressed: () => displayController.buttonPress(buttonText: e),
                      ),
                    )
                    .toList(),
              ),
              Row(
                children: ['1', '2', '3', '+']
                    .map(
                      (e) => MyButton(
                        buttonText: e,
                        onPressed: () => displayController.buttonPress(buttonText: e),
                      ),
                    )
                    .toList(),
              ),
              Row(
                children: ['⌫', '0', '.', '=']
                    .map(
                      (e) => MyButton(
                        buttonText: e,
                        onPressed: () => displayController.buttonPress(buttonText: e),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
