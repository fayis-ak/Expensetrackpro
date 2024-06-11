import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserAppbar extends StatelessWidget implements PreferredSizeWidget {
  UserAppbar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: HelperWh.H(context) * .200,
      flexibleSpace: Container(
        height: HelperWh.H(context) * .200,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              // begin: Alignment.topLeft,
              // end: Alignment.center,
              colors: <Color>[
                Color(0xFF808080),
                Color(0xFF808080),
                Color(0xFF808080),
                Color(0xFF808080)
              ]),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: HelperWh.W(context) * .050),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Textwidget(
                text: 'EXPENCE TRACK',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: HelperWh.W(context) * .040,
                ),
              ),
              Textwidget(
                text: 'PRO',
                style: TextStyle(
                  color: colours.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: HelperWh.W(context) * .040,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
