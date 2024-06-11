import 'dart:developer';

import 'package:expancetracker/auth/signup.dart';
import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/controller/usercontroller.dart';

import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/cliper.dart';
import 'package:expancetracker/widgets/containerbutton.dart';
import 'package:expancetracker/widgets/textformwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LogginPage extends StatefulWidget {
  const LogginPage({super.key});

  @override
  State<LogginPage> createState() => _LogginPageState();
}

class _LogginPageState extends State<LogginPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: HelperWh.H(context) * 800,
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
              top: HelperWh.W(context) * .300,
              left: HelperWh.W(context) * .100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign in to ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: HelperWh.W(context) * .100),
                  ),
                  Text(
                    'Expence Track Pro',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colours.amber,
                        fontSize: HelperWh.W(context) * .100),
                  ),
                ],
              )),
          Positioned(
              top: HelperWh.W(context) * .700,
              left: HelperWh.W(context) * .100,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: HelperWh.W(context) * .850,
                      // height: HelperWh.H(context) * .500,
                      decoration: BoxDecoration(
                          color: colours.white,
                          borderRadius: BorderRadius.circular(
                              HelperWh.W(context) * .010)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: HelperWh.W(context) * .050,
                          vertical: HelperWh.W(context) * .050,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                  color: colours.greydark,
                                  fontSize: HelperWh.W(context) * .050),
                            ),
                            Textformfieldwidget(
                              maxlines: 1,
                              controller: emailController,
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Plaease enter ';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: HelperWh.H(context) * .030,
                            ),
                            //
                            Text(
                              'Password',
                              style: TextStyle(
                                  color: colours.greydark,
                                  fontSize: HelperWh.W(context) * .050),
                            ),
                            Textformfieldwidget(
                              maxlines: 1,
                              controller: passwordController,
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Plaease enter v';
                                }
                                return null;
                              },
                            ),

                            SizedBox(
                              height: HelperWh.H(context) * .030,
                            ),

                            Consumer<Authcontroller>(
                                builder: (context, instance, _) {
                              return Containerwidget(
                                height: HelperWh.H(context) * .100,
                                width: double.infinity,
                                text: 'Sign in',
                                fontsize: HelperWh.W(context) * .070,
                                ontap: () async {
                                  if (formKey.currentState!.validate()) {
                                    await instance.signin(
                                      emailController.text,
                                      passwordController.text,
                                      context,
                                    );
                                  }
                                },
                              );
                            }),
                            SizedBox(
                              height: HelperWh.H(context) * .020,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                //       GestureDetector(
                                //         onTap: () {
                                //           Navigator.push(
                                //               context,
                                //               MaterialPageRoute(
                                //                 builder: (context) => SignupScreen(),
                                //               ));
                                //         },
                                //         child: Text(
                                //           'Donthave an acoount?',
                                //           style: TextStyle(
                                //               color: colours.greydark,
                                //               fontSize: HelperWh.W(context) * .030),
                                //         ),
                                //       ),
                                // Text(
                                //   'forgot password',
                                //   style: TextStyle(
                                //       color: colours.greydark,
                                //       fontSize: HelperWh.W(context) * .030),
                                // ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
