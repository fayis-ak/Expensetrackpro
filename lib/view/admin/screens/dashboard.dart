import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';

Widget dashbord(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: HelperWh.W(context) * .0100,
      vertical: HelperWh.W(context) * .0100,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: HelperWh.W(context) * .230,
              height: HelperWh.W(context) * .100,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(
                  HelperWh.W(context) * .010,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Textwidget(
                    text: 'Daily Expence',
                    style: TextStyle(
                      color: colours.white,
                      fontSize: HelperWh.W(context) * .020,
                    ),
                  ),
                  Textwidget(
                    text: '4,156',
                    style: TextStyle(
                      color: colours.white,
                      fontSize: HelperWh.W(context) * .020,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: HelperWh.W(context) * .230,
              height: HelperWh.W(context) * .100,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(
                  HelperWh.W(context) * .010,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Textwidget(
                    text: 'Monthly Expence',
                    style: TextStyle(
                      color: colours.white,
                      fontSize: HelperWh.W(context) * .020,
                    ),
                  ),
                  Textwidget(
                    text: '4,156',
                    style: TextStyle(
                      color: colours.white,
                      fontSize: HelperWh.W(context) * .020,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: HelperWh.W(context) * .230,
              height: HelperWh.W(context) * .100,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(
                  HelperWh.W(context) * .010,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Textwidget(
                    text: 'Anual Expence',
                    style: TextStyle(
                      color: colours.white,
                      fontSize: HelperWh.W(context) * .020,
                    ),
                  ),
                  Textwidget(
                    text: '4,156',
                    style: TextStyle(
                      color: colours.white,
                      fontSize: HelperWh.W(context) * .020,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: HelperWh.H(context) * .040,
        ),
        Container(
          width: double.infinity,
          height: HelperWh.W(context) * .330,
          color: colours.blue,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Textwidget(
                      text: 'Recent Expence',
                      style: TextStyle(
                        fontSize: HelperWh.W(context) * .030,
                        color: colours.white,
                      ),
                    )
                  ],
                ),
                ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: HelperWh.W(context) * .050,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ 
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'arjun',
                                  style: TextStyle(
                                    color: colours.white,
                                    fontSize: HelperWh.W(context) * .010,
                                  ),
                                ),
                                Text(
                                  '\u{20B9} 8500.00',
                                  style: TextStyle(
                                    color: colours.amber,
                                    fontSize: HelperWh.W(context) * .010,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: HelperWh.H(context) * .020,
                      );
                    },
                    itemCount: 25)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
