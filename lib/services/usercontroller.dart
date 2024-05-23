import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expancetracker/models/usermodel.dart';
import 'package:expancetracker/services/firebasecontroller.dart';
import 'package:expancetracker/utils/cherry_toast.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/view/supervisor/bottomnavwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authcontroller with ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  final db = FirebaseFirestore.instance;

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  clearcontroller() {
    emailcontroller.clear();
    passwordcontroller.clear();
    notifyListeners();
  }

  Future Signup(
    String email,
    String password,
    context,
    String? name,
    String type,
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
              name: email,
              password: password,
              type: type,
              email: email,
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

      if (credential.user != null) {
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