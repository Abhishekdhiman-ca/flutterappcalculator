import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color backgroundColor;

  CalculatorButton({
    required this.text,
    required this.onPressed,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.only(right: 12.0, bottom: 12.0),
                child: Text(
                  '1234567890',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: <Widget>[
                  CalculatorButton(text: 'M+', onPressed: () {}, backgroundColor: Colors.grey[800]!, textColor: Colors.white),
                  CalculatorButton(text: 'M-', onPressed: () {}, backgroundColor: Colors.grey[800]!, textColor: Colors.white),
                  CalculatorButton(text: 'MRC', onPressed: () {}, backgroundColor: Colors.grey[800]!, textColor: Colors.white),
                  CalculatorButton(text: 'GT', onPressed: () {}, backgroundColor: Colors.grey[800]!, textColor: Colors.white),
                  CalculatorButton(text: '7', onPressed: () {}, backgroundColor: Colors.grey[700]!, textColor: Colors.white),
                  CalculatorButton(text: '8', onPressed: () {}, backgroundColor: Colors.grey[700]!, textColor: Colors.white),
                  CalculatorButton(text: '9', onPressed: () {}, backgroundColor: Colors.grey[700]!, textColor: Colors.white),
                  CalculatorButton(text: '/', onPressed: () {}, backgroundColor: Colors.orange, textColor: Colors.white),
                  CalculatorButton(text: '4', onPressed: () {}, backgroundColor: Colors.grey[700]!, textColor: Colors.white),
                  CalculatorButton(text: '5', onPressed: () {}, backgroundColor: Colors.grey[700]!, textColor: Colors.white),
                  CalculatorButton(text: '6', onPressed: () {}, backgroundColor: Colors.grey[700]!, textColor: Colors.white),
                  CalculatorButton(text: '*', onPressed: () {}, backgroundColor: Colors.orange, textColor: Colors.white),
                  CalculatorButton(text: '1', onPressed: () {}, backgroundColor: Colors.grey[700]!, textColor: Colors.white),
                  CalculatorButton(text: '2', onPressed: () {}, backgroundColor: Colors.grey[700]!, textColor: Colors.white),
                  CalculatorButton(text: '3', onPressed: () {}, backgroundColor: Colors.grey[700]!, textColor: Colors.white),
                  CalculatorButton(text: '-', onPressed: () {}, backgroundColor: Colors.orange, textColor: Colors.white),
                  CalculatorButton(text: '0', onPressed: () {}, backgroundColor: Colors.grey[700]!, textColor: Colors.white),
                  CalculatorButton(text: '00', onPressed: () {}, backgroundColor: Colors.grey[700]!, textColor: Colors.white),
                  CalculatorButton(text: '.', onPressed: () {}, backgroundColor: Colors.grey[700]!, textColor: Colors.white),
                  CalculatorButton(text: '+', onPressed: () {}, backgroundColor: Colors.orange, textColor: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CalculatorScreen(),
  ));
}
