import 'dart:math';

class CalculatorLogic {
  String displayText = '0';
  double result = 0;
  String operation = '';
  double firstOperand = 0;
  double secondOperand = 0;
  bool shouldClearDisplay = false;
  double memoryValue = 0;
  List<String> history = [];

  void buttonPressed(String buttonText) {
    switch (buttonText) {
      case "C":
        _clearAll();
        break;
      case "CE":
        _clearEntry();
        break;
      case "+":
      case "-":
      case "*":
      case "/":
      case "^":
        _setOperation(buttonText);
        break;
      case "=":
        _calculateResult();
        break;
      case "M+":
        _memoryAdd();
        break;
      case "M-":
        _memorySubtract();
        break;
      case "MR":
        _memoryRecall();
        break;
      case "√":
        _calculateSquareRoot();
        break;
      case "%":
        _calculatePercentage();
        break;
      case "←":
        _backspace();
        break;
      case ".":
        _addDecimalPoint();
        break;
      default:
        if (RegExp(r'^\d+$').hasMatch(buttonText)) {
          _addDigit(buttonText);
        }
        break;
    }
  }

  void _clearAll() {
    displayText = '0';
    result = 0;
    operation = '';
    firstOperand = 0;
    secondOperand = 0;
    shouldClearDisplay = false;
  }

  void _clearEntry() {
    displayText = '0';
    shouldClearDisplay = true;
  }

  void _setOperation(String op) {
    if (operation.isNotEmpty && !shouldClearDisplay) {
      secondOperand = double.parse(displayText);
      _calculateResult();
    }
    firstOperand = double.parse(displayText);
    operation = op;
    shouldClearDisplay = true;
  }

  void _calculateResult() {
    if (operation.isEmpty) return;

    secondOperand = double.parse(displayText);
    switch (operation) {
      case "+":
        result = firstOperand + secondOperand;
        break;
      case "-":
        result = firstOperand - secondOperand;
        break;
      case "*":
        result = firstOperand * secondOperand;
        break;
      case "/":
        if (secondOperand == 0) {
          displayText = "Error";
          return;
        }
        result = firstOperand / secondOperand;
        break;
      case "^":
        result = pow(firstOperand, secondOperand).toDouble();
        break;
      default:
        result = 0;
    }

    displayText = _formatResult(result);
    history.add('$firstOperand $operation $secondOperand = $result');
    operation = '';
    shouldClearDisplay = true;
  }

  void _memoryAdd() {
    memoryValue += double.parse(displayText);
  }

  void _memorySubtract() {
    memoryValue -= double.parse(displayText);
  }

  void _memoryRecall() {
    displayText = _formatResult(memoryValue);
    shouldClearDisplay = true;
  }

  void _calculateSquareRoot() {
    double value = double.parse(displayText);
    if (value >= 0) {
      result = sqrt(value);
      displayText = _formatResult(result);
    } else {
      displayText = "Error";
    }
  }

  void _calculatePercentage() {
    result = double.parse(displayText) / 100;
    displayText = _formatResult(result);
  }

  void _backspace() {
    if (displayText.length > 1) {
      displayText = displayText.substring(0, displayText.length - 1);
    } else {
      displayText = '0';
    }
  }

  void _addDecimalPoint() {
    if (!displayText.contains('.')) {
      displayText += '.';
    }
  }

  void _addDigit(String digit) {
    if (shouldClearDisplay) {
      displayText = digit;
      shouldClearDisplay = false;
    } else {
      if (displayText == '0') {
        displayText = digit;
      } else {
        displayText += digit;
      }
    }
  }

  String _formatResult(double result) {
    if (result == result.roundToDouble()) {
      return result.toInt().toString();
    } else {
      return result.toStringAsFixed(2);
    }
  }
}
