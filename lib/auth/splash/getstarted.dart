import 'package:expancetracker/auth/loggin.dart';
import 'package:expancetracker/auth/signup.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/cliper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: HelperWh.H(context) * 800,
      color: Colors.black,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              child: ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  width: 600,
                  height: 500,
                  color: colours.amber,
                ),
              )),
          Positioned(
              top: HelperWh.W(context) * .400,
              left: HelperWh.W(context) * .100,
              child: Column(
                children: [
                  Text(
                    'Track your expence\njust in one click.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: HelperWh.W(context) * .090),
                  ),
                  SizedBox(
                    height: HelperWh.H(context) * .030,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogginPage(),
                          ));
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: HelperWh.W(context) * .060),
                    ),
                  ),
                ],
              )),
        ],
      ),
    ));
  }
}
