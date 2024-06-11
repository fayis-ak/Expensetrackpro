import 'package:expancetracker/auth/splash/getstarted.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/view/admin/adminHome.dart';
import 'package:expancetracker/view/admin/screens/sitesupervisor.dart';
import 'package:expancetracker/view/hr/Bottomnavigation/bottomnav.dart';
import 'package:expancetracker/view/supervisor/Homescreen.dart';
import 'package:expancetracker/view/supervisor/bottomnavwidget.dart';
import 'package:flutter/material.dart';

import '../view/admin/auth/logginadmin.dart';

class LayoutBuilderCheck extends StatelessWidget {
  const LayoutBuilderCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return
              //  AdminHomeScreen();
              LogginAdmin();
        } else {
          //site supervisor
          return
              // GetStarted();

              GetStarted();

          // return HrBottomnav(
          //   indexnum: 0,
          // );
          //employee user
          //  GetStarted();
        }
      },
    );
  }
}
