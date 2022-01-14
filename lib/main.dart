// ignore_for_file: prefer_const_constructors

import 'package:calculator/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String _history = "";
  String _expression = "";

  void numClicked(String text) {
    setState(() {
      _expression += text;
    });
  }

  void clearAll(String text) {
    setState(() {
      _history = "";
      _expression = "";
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void signal(String text) {
    setState(() {
      _expression = "-(" + _expression + ")";
    });
  }

  void evalute(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        title: 'Calculator',
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  _history,
                  style: const TextStyle(fontSize: 24, color: Colors.grey),
                ),
                alignment: Alignment(1, 1),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  _expression,
                  style: const TextStyle(fontSize: 48),
                ),
                alignment: Alignment(1, 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: 'AC',
                    fillColor: Colors.grey,
                    callback: clearAll,
                  ),
                  CalcButton(
                    text: 'C',
                    fillColor: Colors.grey,
                    callback: clear,
                  ),
                  CalcButton(
                    text: '%',
                    fillColor: Colors.grey,
                    callback: numClicked,
                  ),
                  CalcButton(
                      text: '/',
                      fillColor: Colors.orange,
                      callback: numClicked),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '7',
                    callback: numClicked,
                  ),
                  CalcButton(
                    text: '8',
                    callback: numClicked,
                  ),
                  CalcButton(
                    text: '9',
                    callback: numClicked,
                  ),
                  CalcButton(
                      text: 'x',
                      fillColor: Colors.orange,
                      callback: numClicked),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '4',
                    callback: numClicked,
                  ),
                  CalcButton(
                    text: '5',
                    callback: numClicked,
                  ),
                  CalcButton(
                    text: '6',
                    callback: numClicked,
                  ),
                  CalcButton(
                      text: '-',
                      fillColor: Colors.orange,
                      callback: numClicked),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '1',
                    callback: numClicked,
                  ),
                  CalcButton(
                    text: '2',
                    callback: numClicked,
                  ),
                  CalcButton(
                    text: '3',
                    callback: numClicked,
                  ),
                  CalcButton(
                    text: '+',
                    fillColor: Colors.orange,
                    callback: numClicked,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '0',
                    callback: numClicked,
                  ),
                  CalcButton(
                    text: '.',
                    callback: numClicked,
                  ),
                  CalcButton(
                    text: '+/-',
                    callback: signal,
                  ),
                  CalcButton(
                    text: '=',
                    fillColor: Colors.orange,
                    callback: evalute,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
