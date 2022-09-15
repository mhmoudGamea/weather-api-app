import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  double? size;
  FontWeight? bold;
  double? letterSpacing;
  MyText({Key? key, required this.text, this.size, this.bold, this.letterSpacing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ??= 19,
        fontFamily: 'Cairo',
        letterSpacing: letterSpacing ??= 1.3,
        fontWeight: bold ??= FontWeight.w700,
      ),
    );
  }
}
