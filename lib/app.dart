import 'package:expancetracker/services/controller.dart';
import 'package:expancetracker/services/firebasecontroller.dart';
import 'package:expancetracker/services/usercontroller.dart';
import 'package:expancetracker/view/admin/adminHome.dart';
import 'package:expancetracker/view/emloyee/homescreen.dart';

import 'package:expancetracker/widgets/layoutbuilder.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Authcontroller()),
        ChangeNotifierProvider(create: (_) => Firebasecontroller()),
        ChangeNotifierProvider(create: (_) => controller()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LayoutBuilderCheck()
          // home: Employees(),
          ),
    );
  }
}
