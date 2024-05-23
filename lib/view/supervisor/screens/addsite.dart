import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expancetracker/models/site.dart';
import 'package:expancetracker/services/firebasecontroller.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/view/admin/auth/logginadmin.dart';
import 'package:expancetracker/widgets/appBar.dart';
import 'package:expancetracker/widgets/containerbutton.dart';
import 'package:expancetracker/widgets/elevatedbt.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddSite extends StatefulWidget {
  const AddSite({super.key});

  @override
  State<AddSite> createState() => _AddSiteState();
}

class _AddSiteState extends State<AddSite> {
  Future AddSite() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Firebasecontroller>(
          builder: (context, instance, _) {
            return AlertDialog(
              title: const Text('Add Site'),
              content: Container(
                height: HelperWh.H(context) * .20,
                child: Form(
                  child: Column(
                    children: [
                      SizedBox(
                        height: HelperWh.H(context) * .010,
                      ),
                      textformwidget(
                        controller: instance.sitecontroller,
                        hint: 'site name',
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'requred filed';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: HelperWh.H(context) * .010,
                      ),
                      SizedBox(
                        height: HelperWh.H(context) * .010,
                      ),
                      Containerwidget(
                        text: 'Add Site',
                        ontap: () async {
                          await instance
                              .addSite(
                            Site(
                              Sitename: instance.sitecontroller.text,
                              userid: auth.currentUser!.uid,
                            ),
                          )
                              .then((value) {
                            Navigator.pop(context);
                            instance.clearcontroler();
                          });
                          setState(() {});
                        },
                        width: 100,
                        height: 50,
                        fontsize: 10,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('close'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarwidget(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        title: 'ADD SITE',
        icone: Icon(Icons.currency_rupee_sharp),
        onpress: () {},
      ),
      body: SingleChildScrollView(child: Consumer<Firebasecontroller>(
        builder: (context, instance, _) {
          return FutureBuilder(
            future: instance.allSitesview(),
            builder: (context, snapshot) {
              final single = instance.site;

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: HelperWh.W(context) * .020,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: HelperWh.H(context) * .020,
                        ),
                        textformwidget(
                          validation: (value) {},
                        ),
                        SizedBox(
                          height: HelperWh.H(context) * .020,
                        ),
                        single.isEmpty
                            ? Column(
                                children: [
                                  Text(auth.currentUser!.uid),
                                  Center(
                                    child: Textwidget(
                                        text: 'No sites available',
                                        style: TextStyle()),
                                  ),
                                ],
                              )
                            : ListView.separated(
                                itemCount: single.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                    // height: HelperWh.H(context) * .050,
                                    decoration: BoxDecoration(
                                      color: colours.grey,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Textwidget(
                                                text: single[index].Sitename,
                                                style: TextStyle()),
                                            Spacer(),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.edit))
                                          ],
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
                              ),
                        SizedBox(
                          height: HelperWh.H(context) * .060,
                        ),
                        ElevatedBT(
                          text: 'ADD SITE',
                          width: HelperWh.W(context) * .5,
                          ontap: () async {
                            await AddSite();
                          },
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
      )),
    );
  }
}
