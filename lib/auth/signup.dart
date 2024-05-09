import 'package:expancetracker/auth/loggin.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/cliper.dart';
import 'package:expancetracker/widgets/containerbutton.dart';
import 'package:expancetracker/widgets/textformwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 900,
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
                  top: HelperWh.W(context) * .100,
                  left: HelperWh.W(context) * .100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign upto',
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
                top: HelperWh.W(context) * .400,
                left: HelperWh.W(context) * .100,
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: HelperWh.W(context) * .850,
                        // height: HelperWh.H(context) / 1,
                        decoration: BoxDecoration(
                            color: colours.white,
                            borderRadius: BorderRadius.circular(
                                HelperWh.W(context) * .010)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: HelperWh.W(context) * .050,
                            // vertical: HelperWh.W(context) * .050,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: HelperWh.H(context) * .030,
                              ),
                              Textreuse(
                                text: 'Name',
                              ),
                              Textformfieldwidget(
                                controller: namecontroller,
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
                              //
                              Textreuse(
                                text: 'Email',
                              ),
                              Textformfieldwidget(
                                controller: emailController,
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

                              Textreuse(
                                text: 'Phone',
                              ),
                              Textformfieldwidget(
                                controller: phonenumbercontroller,
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
                              Textreuse(
                                text: 'UserType',
                              ),
                              Container(
                                color: colours.grey,
                                child: ExpansionTile(
                                  title: Text("User Type "),
                                  backgroundColor: colours.grey,
                                  children: [
                                    Card(
                                      color: colours.white,
                                      elevation: 4,
                                      child: Container(
                                        width: double.infinity,
                                        height: HelperWh.H(context) * .050,
                                        // color: Colors.red,
                                        child: Text('Site Supervisor'),
                                      ),
                                    ),
                                    Card(
                                      color: colours.white,
                                      elevation: 4,
                                      child: Container(
                                        width: double.infinity,
                                        height: HelperWh.H(context) * .050,
                                        // color: Colors.red,
                                        child: Text('HR'),
                                      ),
                                    ),
                                    Card(
                                      color: colours.white,
                                      elevation: 4,
                                      child: Container(
                                        width: double.infinity,
                                        height: HelperWh.H(context) * .050,
                                        // color: Colors.red,
                                        child: Text('Employee'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: HelperWh.H(context) * .030,
                              ),
                              Textreuse(
                                text: 'password',
                              ),
                              Textformfieldwidget(
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
                              Containerwidget(
                                height: HelperWh.H(context) * .100,
                                width: double.infinity,
                                text: 'Sign up',
                                fontsize: HelperWh.W(context) * .070,
                                ontap: () {
                                  if (formKey.currentState!.validate()) {}
                                },
                              ),
                              SizedBox(
                                height: HelperWh.H(context) * .020,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Have an account?',
                                    style: TextStyle(
                                      color: colours.greydark,
                                      fontSize: HelperWh.W(context) * .030,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
