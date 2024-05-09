import 'package:expancetracker/screens/emloyee/widget/appbar.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';

class EmployeeHomepage extends StatelessWidget {
  const EmployeeHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      
        UserAppbar(),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal:HelperWh.W(context) * .070,
                vertical:  HelperWh.H(context) * .110,
              ),
              child: Container(
                width: double.infinity,
                // height: ResponsiveHelper.getHeight(context) * .300,
                decoration: BoxDecoration(
                    color: colours.black,
                    borderRadius: BorderRadius.circular(
                        HelperWh.W(context) * .020)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Textwidget(
                        text: 'Hi Arjun',
                        style: TextStyle(
                          color: colours.white,
                          fontSize: HelperWh.W(context) * .050,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Textwidget(
                              text: 'Salery',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: colours.white,
                                fontSize:
                                    HelperWh.W(context) * .050,
                              ),
                            ),
                            Textwidget(
                              text: '\u{20B9} 40,000',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colours.white,
                                  fontSize:HelperWh.W(context) *
                                      .080),
                            ),

                            //

                            SizedBox(
                              height:
                                   HelperWh.H(context) * .050,
                            ),

                            Textwidget(
                              text: 'Incentive',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: colours.white,
                                fontSize:
                                    HelperWh.W(context) * .050,
                              ),
                            ),
                            Textwidget(
                              text: '\u{20B9} 2000',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colours.white,
                                  fontSize: HelperWh.W(context) *
                                      .080),
                            ),
                            SizedBox(
                              height:
                                  HelperWh.H(context) * .050,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
