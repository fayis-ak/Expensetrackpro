import 'package:expancetracker/auth/splash/getstarted.dart';
import 'package:expancetracker/utils/strings.dart';
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
          return LogginAdmin();
        } else {
          //site supervisor
          return auth.currentUser!.uid == null
              ? GetStarted()
              : BottomnavWidget(indexnum: 0);

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
