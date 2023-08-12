// _resultCheck() {
//   if (flag < 2) {
//     List<String> expressionParts = runningExpression.split(RegExp(r'(\+|\-|\×|\÷|\%)'));
//     List<String> operations = runningExpression.split(RegExp(r'\d+'));

//     List<num> numsList = expressionParts.map((part) => num.parse(part)).toList();
    
//     // Calculate the result using the list of numbers and operations
//     num result = numsList[0];
//     for (int i = 0; i < operations.length; i++) {
//       if (operations[i] == '+') {
//         result += numsList[i + 1];
//       } else if (operations[i] == '-') {
//         result -= numsList[i + 1];
//       } else if (operations[i] == '×') {
//         result *= numsList[i + 1];
//       } else if (operations[i] == '÷') {
//         if (numsList[i + 1] != 0) {
//           result /= numsList[i + 1];
//         } else {
//           result = double.infinity; // Handle division by zero
//         }
//       } else if (operations[i] == '%') {
//         result = (result / 100) * numsList[i + 1];
//       }
//     }

//     resultDisplay = result.toStringAsFixed(2); // Update the resultDisplay
//     runningExpression = result.toString(); // Update the runningExpression for further calculations
//   }

//   // ... remaining logic ...
// }
