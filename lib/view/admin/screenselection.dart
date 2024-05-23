// import 'dart:developer';

// import 'package:expancetracker/view/admin/screens/dashboard.dart';
// import 'package:expancetracker/view/admin/screens/employees.dart';
// import 'package:expancetracker/view/admin/screens/expens.dart';
// import 'package:expancetracker/view/admin/screens/hr.dart';
// import 'package:expancetracker/view/admin/screens/report.dart';
// import 'package:expancetracker/view/admin/screens/sitesupervisor.dart';
// import 'package:expancetracker/view/hr/notification.dart';
// import 'package:flutter/material.dart';

// import 'screens/feedback.dart';

// class ScreenSelection extends StatelessWidget {
//   final String selectedNavItem;

//   const ScreenSelection({super.key, required this.selectedNavItem});

//   @override
//   Widget build(BuildContext context) {
//     Widget content;
//     if (selectedNavItem == 'Dashboard') { 
//       content = dashbord(context);
//     } else if (selectedNavItem == 'Expense') {
//       content = Expense();
//     } else if (selectedNavItem == 'employee') {
//       content = Employees();
//     } else if (selectedNavItem == 'hr') {
//       content = Hr();
//     } else if (selectedNavItem == 'sitereport') {
//       content = sitesupervisor();
//     } else if (selectedNavItem == 'notofication') {
//       content = notification(context);
//     } else if (selectedNavItem == 'feedback') {
//       content = Feedbackdr();
//     } else {
//       content = Hr();
//     }

//     return content;
//   }
// }
