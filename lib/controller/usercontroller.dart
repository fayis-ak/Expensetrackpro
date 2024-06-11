import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expancetracker/models/usermodel.dart';
import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/utils/cherry_toast.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/view/supervisor/bottomnavwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Authcontroller with ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  final db = FirebaseFirestore.instance;

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final phonenumber = TextEditingController();
  final name = TextEditingController();

  final formkey = GlobalKey<FormState>();

  clearcontroller() {
    emailcontroller.clear();
    passwordcontroller.clear();
    notifyListeners();
  }

  File? image;

  Future imagegallery() async {
    final pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage == null) return;

    image = File(pickedimage.path);

    imagepicker(image);
    // notifyListeners();
  }

  String? urllink;
  Future<void> imagepicker(imageurl) async {
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    final currenttime = TimeOfDay.now().toString();
    UploadTask uploadTask = FirebaseStorage.instance
        .ref()
        .child('expenceimage/$currenttime')
        .putFile(imageurl, metadata);
    TaskSnapshot snapshot = await uploadTask;

    urllink = await snapshot.ref.getDownloadURL();
    notifyListeners();
  }

  Future Signup(
    String email,
    String password,
    context,
    String name,
    String type,
    String phone,
  ) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((creadential) {
        Provider.of<Firebasecontroller>(context, listen: false).adduser(
            creadential.user!.uid,
            UserModel(
              name: name,
              password: password,
              type: type,
              email: email,
              phone: phone,
              uid: creadential.user!.uid,
              image: '',
            ));
      }).then((value) => {
                SuccsToast(context, 'Succes login'),
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => BottomnavWidget(
                //       indexnum: 0,
                //     ),
                //   ),
                // ),
              });
      clearcontroller();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ErorrToast(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ErorrToast(context, 'The account already exists for that email.');
      } else {
        ErorrToast(context, 'Error: ${e.code}');
      }
    } catch (e) {
      ErorrToast(
          context, 'An unexpected error occurred. Please try again later.');
    }
  }

  Future signin(String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = credential.user;
      if (user != null) {
        String uid = credential.user!.uid;

        final userDoc = await db.collection('users').doc(uid).get();

        if (userDoc.exists) {
          var usertype = userDoc['usertype'];

          navigationusertype(usertype, context);

          SuccsToast(context, 'loggin succes');
        } else {
          ErorrToast(context, 'error user signup');
        }
      }
    } on FirebaseException catch (e) {
      ErorrToast(context, 'error $e');
    }
  }
}
