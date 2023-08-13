import 'dart:developer';
import 'package:flutter/material.dart';

class DisplayController extends ChangeNotifier {
  String displayText = '0';
  String resultDisplay = '', result = '';
  List<String> operations = [], digits = [];

  buttonPress({required String buttonText}) {
    switch (buttonText) {
      case 'AC':
        displayText = '0';
        operations = [];
        digits = [];
        resultDisplay = '';
        result = '';

        break;
      case '+':
        _operationCheck();
        displayText += buttonText;
        break;
      case '-':
        _operationCheck();
        displayText += buttonText;
        break;
      case '×':
        _operationCheck();
        displayText += buttonText;
        break;
      case '÷':
        _operationCheck();
        displayText += buttonText;
        break;
      case '%':
        _operationCheck();
        displayText += buttonText;
        break;
      case '←':
        if (displayText.isNotEmpty && displayText != '0') {
          displayText = displayText.substring(0, displayText.length - 1);
          if (displayText.isEmpty) {
            displayText = '0';
            resultDisplay = '';
          }
          //to seperate operators from numbers
          operations = displayText.trim().split(RegExp(r'\d+(\.)?'));
          // Remove any empty strings
          operations.removeWhere((part) => part.isEmpty);

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
      case '.':
        if (operations.isNotEmpty && displayText[displayText.length - 1] == operations.last) {
          displayText += '0$buttonText';
        } else if (!digits.last.contains('.')) {
          displayText += buttonText;
        }
        break;

      case '=':
        _resultCheck2();
        break;
      default:
        log('default');
        break;
    }
    //to seperate operators from numbers
    operations = displayText.trim().split(RegExp(r'\d+(\.)?'));

    //to Remove any empty strings
    operations.removeWhere((part) => part.isEmpty || part == '.');
    log(operations.toString());

    //to seperate numbers from operators
    digits = displayText.split(RegExp(r'(\+|\-|\×|\÷|\%)'));
    // Remove any empty strings
    digits.removeWhere((part) => part.isEmpty);

    //to remove leading zero
    if (displayText.length == 2 &&
        displayText[0] == '0' &&
        displayText[1] != '.' &&
        operations.isEmpty) {
      displayText = displayText.substring(1, displayText.length);
    }
    //to find the result
    if (operations.isNotEmpty && displayText[displayText.length - 1] != operations.last) {
      _resultCheck2();
    }
    //To show zero and operator in the display like 0+ 0-
    if (operations.isEmpty && displayText != '0') resultDisplay = displayText;

    notifyListeners();
  }

  //to avoid multiple operations
  _operationCheck() {
    if (operations.isNotEmpty && displayText[displayText.length - 1] == operations.last) {
      displayText = displayText.substring(0, displayText.length - 1);
    }
  }

  _resultCheck2() {
    if (operations.isNotEmpty) {
      // Convert the strings to numbers
      List<num> numsList = digits.map((part) => num.parse(part)).toList();

      if (displayText[displayText.length - 1] == operations[operations.length - 1]) {
        operations.removeLast();
      }

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
            result = double.infinity; // division by zero
          }
        } else if (operations[i] == '%') {
          result = (result / 100) * numsList[i + 1];
        }
      }

      // Update the resultDisplay
      if (result is int) {
        if (result.toString().length > 10) {
          resultDisplay = result.toStringAsPrecision(9);
        } else {
          resultDisplay = result.toString();
        }
      } else {
        if (result.toString().length > 10) {
          resultDisplay = result.toStringAsFixed(4);
        } else {
          resultDisplay = result.toString();
        }
      }
    }
  }
}
