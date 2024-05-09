import 'package:expancetracker/auth/splash/getstarted.dart';
import 'package:expancetracker/screens/hr/Bottomnavigation/bottomnav.dart';
import 'package:expancetracker/screens/supervisor/Homescreen.dart';
import 'package:expancetracker/widgets/bottomnavwidget.dart';
import 'package:flutter/material.dart';

import '../screens/admin/auth/logginadmin.dart';

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
          return BottomnavWidget( indexnum: 0,);

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
