import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expancetracker/models/addcategory.dart';
import 'package:expancetracker/models/addexpense.dart';
import 'package:expancetracker/models/feedback.dart';
import 'package:expancetracker/models/site.dart';
import 'package:expancetracker/models/usermodel.dart';
import 'package:expancetracker/utils/cherry_toast.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/view/supervisor/screens/addexpence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Firebasecontroller with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  final sitecontroller = TextEditingController();
  final addcategoryc = TextEditingController();

  final expensename = TextEditingController();
  final expamount = TextEditingController();
  final expsnote = TextEditingController();

  clearcontroler() {
    sitecontroller.clear();
  }

  String? selected;

  storedatadrop(value) {
    // selected = !value;
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

  Future addcategory(CategoryMd category) async {
    DocumentReference snapshot = db.collection('Category').doc();

    snapshot.set(category.toJson(snapshot.id));
  }

  Future addExpense(AddExpenseModel addexpence) async {
    final snapshot = db.collection('Expense').doc();

    snapshot.set(addexpence.toJson(snapshot.id));
  }

  // read

  List<UserModel> usermodel = [];
  Future empoleesdetail(String typeuser) async {
    final snapshot = await db
        .collection('users')
        .where('usertype', isEqualTo: typeuser)
        .get();

    // log('emplyee lenght  ${snapshot.docs.length.toString()}');

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

  List<CategoryMd> catgory = [];
  Future fetchCategories() async {
    final snapshot = await db
        .collection('Category')
        .where('userid', isEqualTo: auth.currentUser!.uid)
        .get();

    catgory = snapshot.docs.map((e) {
      return CategoryMd.fromJsone(e.data());
    }).toList();
  }

  List<AddExpenseModel> expence = [];
  Future getExpense() async {
    final snpshot = await db
        .collection('Expense')
        .where('uid', isEqualTo: auth.currentUser!.uid)
        .get();

    log('this expense');

    expence = snpshot.docs.map((e) {
      return AddExpenseModel.fromJsone(e.data());
    }).toList();

    // snpshot.listen((snapshotg) {
    //   log('da  ${snapshotg.docs.length}');
    //   expence = snapshotg.docs.map((mapdoc) {
    //     return AddExpense.fromJsone(mapdoc.data() as Map<String, dynamic>);
    //   }).toList();
    // });
  }

  // List<AddExpense> expence = [];

  // Future<void> getExpense() async {
  //   try {
  //     // Obtain a stream of query snapshots from Firestore
  //     Stream<QuerySnapshot> snapshotStream = db
  //         .collection('Expense')
  //         .where('uid', isEqualTo: auth.currentUser!.uid)
  //         .snapshots();

  //     log('Listening for expense updates...');

  //     // Listen to the stream and update the expense list accordingly
  //     snapshotStream.listen((QuerySnapshot snapshot) {
  //       log('Number of documents: ${snapshot.docs.length}');
  //       expence = snapshot.docs.map((DocumentSnapshot doc) {
  //         return AddExpense.fromJsone(doc.data() as Map<String, dynamic>);
  //       }).toList();

  //       log('Expense list updated. Number of expenses: ${expence.length}');
  //     });
  //   } catch (e) {
  //     log('Error fetching expenses: $e');
  //   }
  // }

  // Future

  //delete

  //update

  // get expense

  Stream<QuerySnapshot> getExpensejeberate() {
    return db.collection('Expense').snapshots();
  }

  UserModel? userModel;
  Future getuser(uid) async {
    final lsnapshot = await db.collection('users').doc(uid).get();
    if (lsnapshot.exists) {
      userModel = UserModel.fromJsone(lsnapshot.data()!);
    }
  }

  Future addFeedback(FeedBackModel feedbackmodel) async {
    final snapshot = db.collection('feedback').doc();

    snapshot.set(feedbackmodel.tojsone(snapshot.id));
  }

  int? newemoji;
  newEmoji(int value) {
    newemoji = value;
    notifyListeners();
  }

  Stream<QuerySnapshot> getFeedback() {
    return db.collection('feedback').snapshots();
  }
}
