import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/models/adminNotification.dart';
import 'package:expancetracker/utils/cherry_toast.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/elevatedbt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Notificationadmn extends StatelessWidget {
  final form = GlobalKey<FormState>();
  final notititle = TextEditingController();
  final notisubtitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: form,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: HelperWh.H(context) * .150,
                    ),
                    SizedBox(
                      width: HelperWh.W(context) / 2,
                      child: TextFormField(
                        controller: notititle,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: 'Notification Title',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: HelperWh.H(context) * .050,
                    ),
                    SizedBox(
                      width: HelperWh.W(context) / 2,
                      child: TextFormField(
                        controller: notisubtitle,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: 'Notification SubTitile',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: HelperWh.H(context) * .080,
                    ),
                    Consumer<Firebasecontroller>(
                      builder: (context, helper, child) {
                        return ElevatedBT(
                          text: 'Push Notification',
                          width: HelperWh.W(context) * .4,
                          height: HelperWh.H(context) * .070,
                          ontap: () {
                            if (form.currentState!.validate()) {
                              helper
                                  .addAdminNotification(
                                AdminNotification(
                                  NotiTitile: notititle.text,
                                  NotiSubtitle: notisubtitle.text,
                                ),
                              )
                                  .then((value) {
                                SuccsToast(context, 'Add Notification succes');
                                clear();
                              });
                            }
                          },
                        );
                      },
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  clear() {
    notititle.clear();
    notisubtitle.clear();
  }
}
