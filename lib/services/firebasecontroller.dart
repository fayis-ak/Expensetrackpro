import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expancetracker/models/site.dart';
import 'package:expancetracker/models/usermodel.dart';
import 'package:expancetracker/utils/cherry_toast.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Firebasecontroller with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  final sitecontroller = TextEditingController();

  clearcontroler() {
    sitecontroller.clear();
  }

  // create
  Future adduser(String uid, UserModel userModel) async {
    db.collection('users').doc(uid).set(userModel.toJson(uid));
  }

  Future<void> logout(BuildContext context) async {
    try {
      await _auth.signOut();
      SuccsToast(context, 'Logut succes');
    } catch (e) {
      SuccsToast(context, 'error$e');
    }
  }

  Future addSite(Site site) async {
    final snapshot = await db.collection('site').doc();

    snapshot.set(site.toJson(snapshot.id));
  }

  // read

  List<UserModel> usermodel = [];
  Future empoleesdetail(String typeuser) async {
    final snapshot = await db
        .collection('users')
        .where('usertype', isEqualTo: typeuser)
        .get();
    log('emplyee lenght  ${snapshot.docs.length.toString()}');

    usermodel = snapshot.docs.map((e) {
      return UserModel.fromJsone(e.data());
    }).toList();

    // notifyListeners();
  }

  List<Site> site = [];
  Future allSitesview() async {
    final snapshot = await db
        .collection('site')
        .where('userid', isEqualTo: auth.currentUser!.uid)
        .get();

    // log(' item cout sites${snapshot.docs.length.toString()}');

    site = snapshot.docs.map((e) {
      return Site.fromJsone(e.data());
    }).toList();
    // notifyListeners();
  }


  // Future 

  //delete

  //update
}
