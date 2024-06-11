import 'dart:developer';

import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/models/notification.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class notificationScreen extends StatelessWidget {
  const notificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = auth.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF808080),
        title: Text('REMINDERS'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: HelperWh.H(context) * .040,
          ),
          Consumer<Firebasecontroller>(
            builder: (context, helper, child) {
              return FutureBuilder(
                future: helper.getSingleNotification(uid),
                builder: (context, snapshot) {
                  log('Data noti ${snapshot.data.toString()}');
                  final data = helper.notif;

                  return data.isEmpty
                      ? Center(
                          child: Text('NO NOTIFICATION '),
                        )
                      : ListView.separated(
                          itemCount: data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: HelperWh.W(context) * .020,
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: HelperWh.W(context) * .010,
                                    backgroundColor: colours.greydark,
                                  ),
                                  SizedBox(
                                    width: HelperWh.W(context) * .010,
                                  ),
                                  Textwidget(
                                    text: data[index].msg,
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: HelperWh.H(context) * .020,
                            );
                          },
                        );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
