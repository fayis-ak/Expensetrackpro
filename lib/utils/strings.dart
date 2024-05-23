import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expancetracker/utils/cherry_toast.dart';
import 'package:expancetracker/view/emloyee/bottom_nav/bottom_user.dart';
import 'package:expancetracker/view/hr/Bottomnavigation/bottomnav.dart';
import 'package:expancetracker/view/supervisor/bottomnavwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const admin = 'BSzyzbQd7qQdJm2lmFm1Gh9Aw4w2';

final db = FirebaseFirestore.instance;

final auth = FirebaseAuth.instance;

void navigationusertype(String usertype, BuildContext context) {
  log('the stich case working $usertype');
  switch (usertype) {
    case 'Hr':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HrBottomnav(indexnum: 0),
          ));

    case 'Employee':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomnavWidgetUser(indexnum: 0),
          ));

    case 'sitesupervisor':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomnavWidget(indexnum: 0),
          ));
      break;
    default:
      ErorrToast(context, 'error type');
      break;
  }
}
