import 'package:expancetracker/controller/controller.dart';
import 'package:expancetracker/utils/cherry_toast.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/view/admin/adminHome.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/containerbutton.dart';
import 'package:expancetracker/widgets/textformwidget.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LogginAdmin extends StatefulWidget {
  const LogginAdmin({super.key});

  @override
  State<LogginAdmin> createState() => _LogginAdminState();
}

class _LogginAdminState extends State<LogginAdmin> {
  @override
  Widget build(BuildContext context) {
    final emailControlller = TextEditingController();
    final passwordController = TextEditingController();

    final formkey = GlobalKey<FormState>();

    bool _obscuretext = true;

    return Scaffold(
      body: Container(
        color: colours.black,
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: HelperWh.H(context) * .200,
                          ),
                          Textwidget(
                            text: 'EXPENSETRACK ',
                            style: TextStyle(
                                fontSize: HelperWh.W(context) * .050,
                                color: colours.white),
                          ),
                          Textwidget(
                            text: 'PRO ',
                            style: TextStyle(
                              fontSize: HelperWh.W(context) * .050,
                              color: colours.amber,
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(
                          height: HelperWh.H(context) * .200,
                        ),
                        Column(
                          children: [
                            Textwidget(
                                text: 'Sign In now',
                                style: TextStyle(
                                  fontSize: HelperWh.W(context) * .020,
                                  fontWeight: FontWeight.bold,
                                  color: colours.white,
                                )),
                            Textwidget(
                                text: 'Please sign in to continue our app',
                                style: TextStyle(
                                    fontSize: HelperWh.W(context) * .010,
                                    color: colours.white)),
                          ],
                        ),
                        SizedBox(
                          height: HelperWh.H(context) * .050,
                        ),
                        Container(
                          width: HelperWh.W(context) * .280,
                          height: HelperWh.H(context) * .540,
                          decoration: BoxDecoration(
                            color: colours.white,
                            borderRadius: BorderRadius.circular(
                              HelperWh.W(context) * .020,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: HelperWh.W(context) * .020,
                              vertical: HelperWh.H(context) * .020,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Textwidget(text: 'Email', style: TextStyle()),
                                textformwidget(
                                  controller: emailControlller,
                                  validation: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'required';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: HelperWh.H(context) * .030,
                                ),
                                Textwidget(
                                    text: 'Password', style: TextStyle()),
                                Consumer<controller>(
                                  builder: (context, instance, _) {
                                    return TextFormField(
                                      controller: passwordController,
                                      obscureText: instance.obscuretext,
                                      decoration: InputDecoration(
                                        fillColor: colours.grey,
                                        filled: true,
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            instance.toggle();
                                          },
                                          icon: instance.obscuretext
                                              ? Icon(Icons.visibility_off)
                                              : Icon(Icons.visibility),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            HelperWh.W(context) * .010,
                                          ),
                                          // borderSide: BorderSide.none,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'required';
                                        }
                                        return null;
                                      },
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: HelperWh.H(context) * .020,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // TextButton(
                                    //   onPressed: () {},
                                    //   child: Textwidget(
                                    //     text: 'Forgot Password?',
                                    //     style:
                                    //         TextStyle(color: colours.greydark),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                Containerwidget(
                                  height: HelperWh.H(context) * .070,
                                  width: double.infinity,
                                  text: 'Log in',
                                  fontsize: HelperWh.W(context) * .020,
                                  ontap: () async {
                                    if (formkey.currentState!.validate()) {
                                      await auth
                                          .signInWithEmailAndPassword(
                                              email: emailControlller.text,
                                              password: passwordController.text)
                                          .then((value) {
                                        if (value.user!.uid == admin) {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AdminHomeScreen(),
                                              ),
                                              (route) => false);
                                          SuccsToast(context, 'Loggin succes');
                                        } else {
                                          ErorrToast(context, 'error requred');
                                        }
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class textformwidget extends StatelessWidget {
  final IconButton? sufix;
  final FormFieldValidator<String> validation;
  final String? hint;
  final TextEditingController? controller;
  final int? maxlenght;

  const textformwidget({
    super.key,
    this.sufix,
    required this.validation,
    this.hint,
    this.controller,
    this.maxlenght,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: [
        "admin@gmail.com",
      ],
      inputFormatters: [LengthLimitingTextInputFormatter(maxlenght)],
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        fillColor: colours.grey,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            HelperWh.W(context) * .010,
          ),
          // borderSide: BorderSide.none,
        ),
      ),
      validator: validation,
    );
  }
}
