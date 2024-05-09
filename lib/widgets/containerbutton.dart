import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Containerwidget extends StatelessWidget {
  final String text;
  final Function() ontap;
  final double width;
  final double height;
  final double fontsize;
  const Containerwidget({
    super.key,
    required this.text,
    required this.ontap,
    required this.width,
    required this.height, required this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: colours.amber,
          borderRadius: BorderRadius.circular(
            HelperWh.W(context) * .020,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: colours.white,
            fontSize:fontsize,
          ),
        ),
      ),
    );
  }
}

class Textreuse extends StatelessWidget {
  final String text;
  const Textreuse({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: colours.greydark, fontSize: HelperWh.W(context) * .050),
    );
  }
}
