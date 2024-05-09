import 'package:flutter/material.dart';

class Textwidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  const Textwidget({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style:style ,
    );
  }
}
