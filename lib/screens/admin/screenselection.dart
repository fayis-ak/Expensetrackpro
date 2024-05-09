import 'dart:developer';

import 'package:expancetracker/screens/admin/screens/dashboard.dart';
import 'package:expancetracker/screens/admin/screens/employees.dart';
import 'package:expancetracker/screens/admin/screens/expens.dart';
import 'package:expancetracker/screens/admin/screens/hr.dart';
import 'package:expancetracker/screens/admin/screens/report.dart';
import 'package:expancetracker/screens/admin/screens/sitesupervisor.dart';
import 'package:expancetracker/screens/hr/notification.dart';
import 'package:flutter/material.dart';

import 'screens/feedback.dart';

class ScreenSelection extends StatelessWidget {
  final String selectedNavItem;

  const ScreenSelection({super.key, required this.selectedNavItem});

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (selectedNavItem == 'Dashboard') {
      content = dashbord();
    } else if (selectedNavItem == 'Expense') {
      content = Expense();
    } else if (selectedNavItem == 'employee') {
      content = Employees();
    } else if (selectedNavItem == 'hr') {
      content = Hr();
    } else if (selectedNavItem == 'sitereport') {
      content = sitesupervisor();
    } else if (selectedNavItem == 'notofication') {
      content = notification(context);
    } else if (selectedNavItem == 'feedback') {
      content = Feedbackdr();
    } else {
      content = Hr();
    }

    return content;
  }
}
