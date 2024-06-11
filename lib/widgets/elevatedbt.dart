import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:flutter/material.dart';

class ElevatedBT extends StatelessWidget {
  final String text;
  final Function()? ontap;
  final double width;
  final double? height;

  const ElevatedBT(
      {super.key, required this.text, this.ontap, required this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height:height ,
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
