import 'dart:async';

import 'package:expancetracker/auth/splash/getstarted.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/cliper.dart';
import 'package:flutter/material.dart';

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({super.key});

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => GetStarted(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: 800,
      color: colours.amber,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              child: ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  width: 600,
                  height: 500,
                  color: Colors.black,
                ),
              )),
          Positioned(
              top: HelperWh.W(context) * .600,
              left: HelperWh.W(context) * .180,
              child: Text(
                'EXPENSE TRACK\n         PRO',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: HelperWh.W(context) * .100),
              ))
        ],
      ),
    ));
  }
}
