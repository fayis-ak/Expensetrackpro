import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expancetracker/utils/cherry_toast.dart';
import 'package:expancetracker/view/emloyee/bottom_nav/bottom_user.dart';
import 'package:expancetracker/view/hr/Bottomnavigation/bottomnav.dart';
import 'package:expancetracker/view/supervisor/bottomnavwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const admin = '9abyerdrMcgjwDGKaKFnKQTmv2k1';

final db = FirebaseFirestore.instance;

final auth = FirebaseAuth.instance;

void navigationusertype(String usertype, BuildContext context) {
  log('the stich case working $usertype');
  switch (usertype) {
    case 'Hr':
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HrBottomnav(indexnum: 0),
        ),
        (route) => false,
      );

    case 'Employee':
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => BottomnavWidgetUser(indexnum: 0),
          ),
          (route) => false);

    case 'sitesupervisor':
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => BottomnavWidget(indexnum: 0),
        ),
        (route) => false,
      );
      break;
    default:
      ErorrToast(context, 'error type');
      break;
  }
}


String time = DateFormat('h:mm a').format(DateTime.now());
String date = DateFormat("dd/m/yyyy").format(DateTime.now());