import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color fillColor;
  final Color textColor;
  final Function callback;
  const CalcButton({
    Key? key,
    this.fillColor = Colors.blue,
    this.text = 'input text',
    this.textColor = Colors.white,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: SizedBox(
        width: 65,
        height: 65,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            primary: fillColor,
          ),
          onPressed: () {
            callback(text);
          },
          child: Text(text, style: TextStyle(color: textColor, fontSize: 24)),
        ),
      ),
    );
  }
}
