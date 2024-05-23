import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';

Widget notification(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: HelperWh.H(context) * .040,
      ),
      ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: HelperWh.W(context) * .020,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: HelperWh.W(context) * .010,
                    backgroundColor: colours.greydark,
                  ),
                  SizedBox(
                    width: HelperWh.W(context) * .010,
                  ),
                  Textwidget(
                    text: 'Your salery is creadited to your account',
                    style: TextStyle(),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: HelperWh.H(context) * .020,
            );
          },
          itemCount: 2)
    ],
  );
}
