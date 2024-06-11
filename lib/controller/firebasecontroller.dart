import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expancetracker/models/addSalery.dart';
import 'package:expancetracker/models/addcategory.dart';
import 'package:expancetracker/models/addexpense.dart';
import 'package:expancetracker/models/adminNotification.dart';
import 'package:expancetracker/models/feedback.dart';
import 'package:expancetracker/models/notification.dart';
import 'package:expancetracker/models/site.dart';
import 'package:expancetracker/models/usermodel.dart';
import 'package:expancetracker/utils/cherry_toast.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/view/supervisor/screens/addexpence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

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

  Future addNotification(NotificationModel notificationModel, uid) async {
    final snapshot =
        db.collection('users').doc(uid).collection('Notification').doc();

    snapshot.set(notificationModel.tojasone());
  }

  Future addAdminNotification(AdminNotification adminNotification) async {
    final snapshot = db.collection('AdminPushNotification').doc();

    snapshot.set(adminNotification.tojsone(snapshot.id));
  }

  // --------------------get =================================

  Stream<QuerySnapshot> getAdminNotification() {
    return db.collection('AdminPushNotification').snapshots();
  }

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

    searchsitel = site;
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

  List<AddExpenseModel> expenceadmin = [];
  Future getexpenseadmin() async {
    final snpshot = await db.collection('Expense').get();

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

  Future deleteallexpense() async {
    final collection = db.collection('Expense');

    final snapshot = await collection.get();

    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  //update===========================================================

  Future updateProfile(name, phonum, uid) async {
    db.collection('users').doc(uid).update({
      'name': name,
      'phonenumber': phonum,
    });
    notifyListeners();
  }

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

  Addsalerymodel? addsalerymodel;
  Future getSalerysingle(uid) async {
    final snapshot =
        await db.collection('Addsalery').where('userid', isEqualTo: uid).get();
    final doc = snapshot.docs.first;

    addsalerymodel = Addsalerymodel.fromjsone(doc.data());
    return addsalerymodel;
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

  Future addSalery(Addsalerymodel addsalerymodel) async {
    final snapshot = db.collection('Addsalery').doc();

    snapshot.set(addsalerymodel.tojsone(snapshot.id));
  }

  Stream<QuerySnapshot> getSalery() {
    return db.collection('Addsalery').snapshots();
  }

  Future<Addsalerymodel?> salerGet(uid) async {
    final snapshot =
        await db.collection('Addsalery').where('userid', isEqualTo: uid).get();

    if (snapshot.docs.isNotEmpty) {
      return Addsalerymodel.fromjsone(
          snapshot.docs.first.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  UserModel? singleuser;
  Future<UserModel?> getSingleUser(uid) async {
    final snapshot = await db.collection('users').doc(uid).get();

    if (snapshot.exists) {
      return UserModel.fromJsone(snapshot as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  List<NotificationModel> notif = [];
  Future getSingleNotification(uid) async {
    final snapshot =
        await db.collection('users').doc(uid).collection('Notification').get();

    notif = snapshot.docs.map((e) {
      return NotificationModel.fromjsone(e.data());
    }).toList();
  }

  File? selectimage;
  String? url;

  Future pickimage(uid) async {
    final pickeimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickeimage == null) return null;

    selectimage = File(pickeimage.path);
    notifyListeners();

    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    final curenttime = time;
    UploadTask uploadTask = FirebaseStorage.instance
        .ref()
        .child('userprofie/$time')
        .putFile(selectimage!, metadata);

    TaskSnapshot snapshot = await uploadTask;

    url = await snapshot.ref.getDownloadURL();

    db.collection('users').doc(uid).update({
      'image': url,
    });
  }

  // search ============================================

  List<Site> searchsitel = [];
  searchsite(String searchkey) {
    searchsitel = List.from(site);

    searchsitel = site
        .where((element) =>
            element.Sitename.toLowerCase().contains(searchkey.toLowerCase()))
        .toList();
    notifyListeners();
  }

  // salery addition
  int _totalSalary = 0;

  int get totalSalary => _totalSalary;

  Future fetchSalerytottal() async {
    int temp = 0;
    QuerySnapshot querySnapshot = await db.collection('Addsalery').get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      int salery = doc['salery'];

      log(salery.toString());

      temp += salery;
    }
    _totalSalary = temp;

    notifyListeners();
  }
}
