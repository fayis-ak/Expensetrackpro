import 'dart:developer';

import 'package:expancetracker/controller/controller.dart';
import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/models/feedback.dart';
import 'package:expancetracker/utils/cherry_toast.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/view/emloyee/accoundscreen.dart';
import 'package:expancetracker/widgets/elevatedbt.dart';
import 'package:expancetracker/widgets/textformwidget.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:provider/provider.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controoler = Provider.of<Firebasecontroller>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF808080),
        title: Textwidget(
          text: 'Feedback',
          style: TextStyle(color: colours.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.rate_review_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: HelperWh.W(context) * .050,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: HelperWh.H(context) * .030,
                  ),
                  Textwidget(
                    text: 'Name',
                    style: TextStyle(
                      color: colours.greydark,
                      fontSize: HelperWh.W(context) * .050,
                    ),
                  ),
                  SizedBox(
                    height: HelperWh.H(context) * .030,
                  ),
                  Textformfieldwidget(
                    controller: nameController,
                    validation: (value) {},
                  ),

                  //

                  SizedBox(
                    height: HelperWh.H(context) * .030,
                  ),
                  Textwidget(
                    text: 'Email',
                    style: TextStyle(
                      color: colours.greydark,
                      fontSize: HelperWh.W(context) * .050,
                    ),
                  ),
                  SizedBox(
                    height: HelperWh.H(context) * .030,
                  ),
                  Textformfieldwidget(
                    controller: emailController,
                    validation: (value) {},
                  ),
                  SizedBox(
                    height: HelperWh.H(context) * .030,
                  ),
                  Textwidget(
                    text: 'How was your experience?',
                    style: TextStyle(
                      color: colours.greydark,
                      fontSize: HelperWh.W(context) * .050,
                    ),
                  ),

                  Consumer<Firebasecontroller>(
                    builder: (context, helper, child) {
                      return EmojiFeedback(
                        animDuration: const Duration(milliseconds: 300),
                        curve: Curves.bounceIn,
                        inactiveElementScale: .5,
                        showLabel: false,
                        onChanged: (value) {
                          helper.newEmoji(value);
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: HelperWh.H(context) * .010,
                  ),

                  Textwidget(
                    text: 'Choose your experience',
                    style: TextStyle(
                      color: colours.greydark,
                      fontSize: HelperWh.W(context) * .050,
                    ),
                  ),
                  SizedBox(
                    height: HelperWh.H(context) * .030,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(
                          HelperWh.W(context) * .015,
                        )),
                    child: Textformfieldwidget(
                      controller: feedbackController,
                      hint: 'Suggest anything we can improve',
                      maxlines: 3,
                      validation: (value) {},
                    ),
                  ),
                  SizedBox(
                    height: HelperWh.H(context) * .030,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedBT(
                        ontap: () {
                          controoler
                              .addFeedback(
                            FeedBackModel(
                              name: nameController.text,
                              email: emailController.text,
                              exeperinece: controoler.newemoji!.toInt(),
                              suggest: feedbackController.text,
                              uid: auth.currentUser!.uid,
                            ),
                          )
                              .then((value) {
                            clear();
                            SuccsToast(context, 'Add feeb back thanku');
                            controoler.newemoji = null;
                          });
                        },
                        text: 'Send Feedback',
                        width: HelperWh.W(context) * .60,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: HelperWh.H(context) * .080,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  clear() {
    nameController.clear();
    emailController.clear();
    feedbackController.clear();
  }
}
