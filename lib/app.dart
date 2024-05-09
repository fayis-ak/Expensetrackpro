import 'package:expancetracker/screens/emloyee/bottom_nav/bottom_user.dart';
import 'package:expancetracker/screens/emloyee/homescreen.dart';
import 'package:expancetracker/screens/hr/Bottomnavigation/bottomnav.dart';
import 'package:expancetracker/screens/supervisor/Homescreen.dart';
import 'package:expancetracker/screens/supervisor/screens/calender.dart';
import 'package:expancetracker/widgets/bottomnavwidget.dart';
import 'package:expancetracker/widgets/layoutbuilder.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        //supervisor home
        // home: BottomnavWidget(
        //   indexnum: 0,
        // ),

        //employee
        // home: BottomnavWidgetUser(
        //   indexnum: 0,
        // ),

        // hr
        home: LayoutBuilderCheck());
  }
}
