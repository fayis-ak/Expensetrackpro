import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/elevatedbt.dart';
import 'package:expancetracker/widgets/textformwidget.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';

class FeedbackScreenSitesuper extends StatelessWidget {
  FeedbackScreenSitesuper({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

                  EmojiFeedback(
                    animDuration: const Duration(milliseconds: 300),
                    curve: Curves.bounceIn,
                    inactiveElementScale: .5,
                    showLabel: false,
                    onChanged: (value) {
                      print(value);
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
            )
          ],
        ),
      ),
    );
  }
}
