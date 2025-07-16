import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  double _result = 0;

  void _calculate(String operator) {
    double num1 = double.tryParse(_num1Controller.text) ?? 0;
    double num2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      switch (operator) {
        case '+':
          _result = num1 + num2;
          break;
        case '-':
          _result = num1 - num2;
          break;
        case '*':
          _result = num1 * num2;
          break;
        case '/':
          _result = num2 != 0 ? num1 / num2 : double.infinity;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              decoration: InputDecoration(labelText: 'Enter first number'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _num2Controller,
              decoration: InputDecoration(labelText: 'Enter second number'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                    onPressed: () => _calculate('+'), child: Text('+')),
                ElevatedButton(
                    onPressed: () => _calculate('-'), child: Text('-')),
                ElevatedButton(
                    onPressed: () => _calculate('*'), child: Text('*')),
                ElevatedButton(
                    onPressed: () => _calculate('/'), child: Text('/')),
              ],
            ),
            SizedBox(height: 20),
            Text('Result: $_result',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
