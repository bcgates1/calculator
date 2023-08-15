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
          _operationsAdd();
          _digitsAdd();

          _resultCheck2(operationsList: operations);
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
      case '00':
        if (operations.isNotEmpty) {
          if (displayText[displayText.length - 1] != operations.last) {
            displayText += buttonText;
          }
        } else if (resultDisplay.isNotEmpty) {
          displayText += buttonText;
        }

      case '.':
        if (operations.isNotEmpty && displayText[displayText.length - 1] == operations.last) {
          displayText += '0$buttonText';
        } else if (!digits.last.contains('.')) {
          displayText += buttonText;
        }
        break;

      case '=':
        _resultCheck2(operationsList: operations);
        break;
      default:
        log('default');
        break;
    }
    _operationsAdd();
    _digitsAdd();

    //to remove leading zero
    if (displayText.length == 2 &&
        displayText[0] == '0' &&
        displayText[1] != '.' &&
        operations.isEmpty) {
      displayText = displayText.substring(1, displayText.length);
    }
    //to find the result
    if (operations.isNotEmpty && displayText[displayText.length - 1] != operations.last) {
      _resultCheck2(operationsList: operations);
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

  _operationsAdd() {
    //to seperate operators from numbers
    operations = displayText.trim().split(RegExp(r'\d+(\.)?'));

    //to Remove any empty strings
    operations.removeWhere((part) => part.isEmpty || part == '.');
  }

  _digitsAdd() {
    //to seperate numbers from operators
    digits = displayText.split(RegExp(r'(\+|\-|\×|\÷|\%)'));
    // Remove any empty strings
    digits.removeWhere((part) => part.isEmpty);
  }

  _resultCheck2({required List operationsList}) {
    //to have seperate OPlist from main OPlist bcz deleting from list cause main list to be changed so .toList used
    //and operation become empty when only division and multiplication comes so that satisfies condition for resultDisplay = displayText
    // to avoid that this is used
    List operationsList = operations.toList();

    if (operationsList.isNotEmpty) {
      // Convert the strings to numbers
      List<num> numsList = digits.map((part) => num.parse(part)).toList();

      //to remove operator if it is the last element in case of backspace calling result
      if (displayText[displayText.length - 1] == operationsList[operationsList.length - 1]) {
        operationsList.removeLast();
      }

      // Calculate the result using the list of numbers and operations
      num result = numsList[0];
      bool check = false;
      int temp = 0;
      //if division or multiplication is there then we can't take numList[0]
      //so result value will be added in if(check)
      if (operationsList.contains('×') || operationsList.contains('÷')) {
        result = 0;
      }
      for (int i = 0; i < operationsList.length; i++) {
        if (operationsList.contains('÷')) {
          temp = i;
          i = operationsList.indexOf('÷');
          check = true;

          if (numsList[i + 1] != 0) {
            numsList[i] /= numsList[i + 1];

            numsList.removeAt(i + 1);
          } else {
            result = double.infinity; // division by zero
          }
        } else if (!check && operationsList.contains('×')) {
          temp = i;
          i = operationsList.indexOf('×');
          check = true;

          numsList[i] *= numsList[i + 1];
          numsList.removeAt(i + 1);
        }

        if (operationsList[i] == '+') {
          result += numsList[i + 1];
        } else if (operationsList[i] == '-') {
          result -= numsList[i + 1];
        } else if (operationsList[i] == '%') {
          result = (result / 100) * numsList[i + 1];
        }
        if (check) {
          operationsList.removeAt(i);
          i = temp - 1;
          check = false;
          result = numsList[0];
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
          resultDisplay = result.toStringAsFixed(6);
        } else if (result.truncate() == result) {
          resultDisplay = result.round().toString();
        } else {
          resultDisplay = result.toString();
        }
      }
    }
  }
}
