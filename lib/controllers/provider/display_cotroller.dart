import 'dart:developer';
import 'package:flutter/material.dart';

class DisplayController extends ChangeNotifier {
  String displayText = '0';
  num a = 0, b = 0;
  String operation = '', resultDisplay = '', result = '';
  int flag = 0;

  buttonPress({required String buttonText}) {
    switch (buttonText) {
      case 'AC':
        displayText = '0';
        a = 0;
        b = 0;
        operation = '';
        resultDisplay = '';
        result = '';
        flag = 0;
        break;
      case '+':
        _operationCheck();
        displayText += buttonText;
        operation = '+';
        break;
      case '-':
        _operationCheck();
        displayText += buttonText;
        operation = '-';
        break;
      case '×':
        _operationCheck();
        displayText += buttonText;
        operation = '×';
        break;
      case '÷':
        _operationCheck();
        displayText += buttonText;
        operation = '÷';
        break;
      case '%':
        _operationCheck();
        displayText += buttonText;
        operation = '%';
        break;
      case '←':
        if (displayText.isNotEmpty && displayText != '0') {
          displayText = displayText.substring(0, displayText.length - 1);
          if (displayText.isEmpty) {
            displayText = '0';
          }
          // _resultCheck();
          _resultCheck2();
        }
        break;
      case '1':
        displayText += buttonText;
        break;
      case '2':
        displayText += buttonText;
        break;
      case '3':
        displayText += buttonText;
        break;
      case '4':
        displayText += buttonText;
        break;
      case '5':
        displayText += buttonText;
        break;
      case '6':
        displayText += buttonText;
        break;
      case '7':
        displayText += buttonText;
        break;
      case '8':
        displayText += buttonText;
        break;
      case '9':
        displayText += buttonText;
        break;
      case '0':
        displayText += buttonText;
        break;

      case '=':
        _resultCheck();
        break;
      default:
        log('default');
        break;
    }
    //To show zero and operator in the display like 0+ 0-
    if (displayText.length == 2 && displayText[0] == '0' && operation.isEmpty) {
      displayText = displayText.substring(1, displayText.length);
    }

    // if (displayText[displayText.length - 1] != operation && flag == 1) {
    //   _resultCheck();
    //   result = '';
    // }
    // if (flag > 1 && displayText[displayText.length - 1] != operation) {
    //   _resultCheck();
    // }
    // if (displayText[displayText.length - 1] == operation) {
    //   flag++;
    //   result = resultDisplay;
    // }

    if (displayText[displayText.length - 1] != operation && operation.isNotEmpty) _resultCheck2();

    if (operation.isEmpty && displayText != '0') resultDisplay = displayText;

    notifyListeners();
  }

  _resultCheck() {
    if (flag < 2) {
      List numsList = displayText.split(operation);

      a = num.parse(numsList[0]);
      b = num.parse(numsList[1]);
      resultDisplay = (_calculation(a: a, b: b, operation: operation)).toString();
      result = resultDisplay;
    } else {
      List numsList = displayText.split(operation);
      a = num.parse(result);

      b = num.parse(numsList[numsList.length - 1] == '' ? '0' : numsList[numsList.length - 1]);
      resultDisplay = (_calculation(a: a, b: b, operation: operation)).toString();
    }

    if (resultDisplay.length > 12) {
      resultDisplay = resultDisplay.substring(0, 12);
    }
  }

  _calculation({required num a, required num b, required String operation}) {
    switch (operation) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '×':
        return a * b;
      case '÷':
        if (b == 0) {
          return 'Error';
        }
        return a / b;
      case '%':
        return (a / 100) * b;
      default:
        return 'Error';
    }
  }

  _operationCheck() {
    if (operation.isNotEmpty && displayText[displayText.length - 1] == operation) {
      displayText = displayText.substring(0, displayText.length - 1);
    }
  }

  _resultCheck2() {
    // if (flag < 2) {
    List<String> digits = displayText.split(RegExp(r'(\+|\-|\×|\÷|\%)'));
    List<String> operations = displayText.trim().split(RegExp(r'\d+'));
    // Remove any empty strings from the expressionParts list
    operations.removeWhere((part) => part.isEmpty);

    List<num> numsList = digits.map((part) => num.parse(part)).toList();

    // Calculate the result using the list of numbers and operations
    num result = numsList[0];
    for (int i = 0; i < operations.length; i++) {
      if (operations[i] == '+') {
        result += numsList[i + 1];
      } else if (operations[i] == '-') {
        result -= numsList[i + 1];
      } else if (operations[i] == '×') {
        result *= numsList[i + 1];
      } else if (operations[i] == '÷') {
        if (numsList[i + 1] != 0) {
          result /= numsList[i + 1];
        } else {
          result = double.infinity; // Handle division by zero
        }
      } else if (operations[i] == '%') {
        result = (result / 100) * numsList[i + 1];
      }
    }

    resultDisplay = result.toStringAsFixed(2); // Update the resultDisplay
    // displayText = result.toString(); // Update the runningExpression for further calculations
  }

  // ... remaining logic ...
  // }
}
