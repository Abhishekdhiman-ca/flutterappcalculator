import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for keyboard input
import '../utils/calculator_logic.dart';
import '../widgets/calculator_button.dart';
import '../widgets/history_dialog.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  CalculatorLogic calculatorLogic = CalculatorLogic();

  void buttonPressed(String buttonText) {
    setState(() {
      calculatorLogic.buttonPressed(buttonText);
    });
  }

  void onKey(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      String key = event.logicalKey.keyLabel;

      // Mapping keyboard keys to calculator buttons
      switch (key) {
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        case '+':
        case '-':
        case '*':
        case '/':
        case '.':
        case '(':
        case ')':
          buttonPressed(key);
          break;
        case '=':
        case 'Enter':
          buttonPressed('=');
          break;
        case 'Backspace':
          buttonPressed('←');
          break;
        case 'C':
        case 'Escape':
          buttonPressed('C');
          break;
        default:
          break;
      }
    }
  }

  void showHistory() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return HistoryDialog(history: calculatorLogic.history);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.history),
            onPressed: showHistory,
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKey: onKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey[300]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 300),
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  child: Text(calculatorLogic.displayText),
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    buildButtonRow(['(', ')', 'CE', 'C']),
                    buildButtonRow(['7', '8', '9', '/']),
                    buildButtonRow(['4', '5', '6', '*']),
                    buildButtonRow(['1', '2', '3', '-']),
                    buildButtonRow(['0', '.', '=', '+']),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> buttonTexts) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttonTexts.map((buttonText) {
          bool isOperator = buttonText == '+' ||
              buttonText == '-' ||
              buttonText == '*' ||
              buttonText == '/' ||
              buttonText == '=' ||
              buttonText == 'C' ||
              buttonText == 'CE';

          return AspectRatio(
            aspectRatio: 1, // Ensures the button is square
            child: CalculatorButton(
              text: buttonText,
              onPressed: () => buttonPressed(buttonText),
              textColor: isOperator ? Colors.black : Colors.black,
              backgroundColor: buttonText == 'CE' ? Colors.green :
              buttonText == 'C' ? Colors.green :
              isOperator ? Colors.grey : Colors.grey[300]!,
            ),
          );
        }).toList(),
      ),
    );
  }
}
