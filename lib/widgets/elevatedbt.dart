import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:flutter/material.dart';

class ElevatedBT extends StatelessWidget {
  final String text;
  final Function()? ontap;
  final double width;
  const ElevatedBT(
      {super.key, required this.text, this.ontap, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: ontap,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
