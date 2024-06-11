import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/models/adminNotification.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminNotificationScreen extends StatelessWidget {
  const AdminNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Consumer<Firebasecontroller>(
            builder: (context, helper, child) {
              return StreamBuilder(
                stream: helper.getAdminNotification(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<AdminNotification> list = [];

                  list = snapshot.data!.docs.map((e) {
                    return AdminNotification.fromjsone(
                        e.data() as Map<String, dynamic>);
                  }).toList();

                  return list.isEmpty
                      ? Center(
                          child: Text('NO ACTIVE NOTIFICATION'),
                        )
                      : ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: HelperWh.W(context) * .040,
                          ),
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Material(
                                      elevation: 4,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: HelperWh.W(context) * .9,
                                        // height: HelperWh.H(context) * .060,
                                        child: Column(
                                          children: [
                                            Text(
                                              list[index].NotiTitile,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    HelperWh.W(context) * .040,
                                              ),
                                            ),
                                            Text(list[index].NotiSubtitle),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: HelperWh.H(context) * .050,
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
