import 'dart:developer';

import 'package:expancetracker/view/admin/auth/logginadmin.dart';
import 'package:expancetracker/view/supervisor/screens/editexpense.dart';
import 'package:expancetracker/view/supervisor/screens/report.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/appBar.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';

class Expence extends StatelessWidget {
  const Expence({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarwidget(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        title: 'Expense',
        icone: Icon(Icons.currency_rupee_sharp),
        onpress: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: HelperWh.W(context) * .050,
        ),
        child: Column(
          children: [
            SizedBox(
              height: HelperWh.H(context) * .030,
            ),
            textformwidget(
              validation: (value) {},
            ),
            SizedBox(
              height: HelperWh.H(context) * .030,
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        height: HelperWh.H(context) * .070,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(HelperWh.W(context) * .010),
                          border: Border.all(color: colours.grey),
                        ),
                        child: ListTile(
                            leading: Container(
                              child: Column(
                                children: [
                                  Textwidget(
                                      text: 'Mubai',
                                      style: TextStyle(
                                        fontSize: HelperWh.W(context) * .040,
                                      )),
                                  Textwidget(
                                      text: 'Yesterday',
                                      style: TextStyle(
                                        fontSize: HelperWh.W(context) * .040,
                                      )),
                                ],
                              ),
                            ),
                            title: Text('100000'),
                            trailing: PopupMenuButton(
                              icon: Icon(Icons.settings),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 'Option 3',
                                  child: Icon(Icons.edit),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditExpense(),
                                        ));
                                  },
                                ),
                                PopupMenuItem(
                                  value: 'Option 3',
                                  child: Icon(Icons.delete),
                                  onTap: () {},
                                ),
                                PopupMenuItem(
                                  value: 'Option 3',
                                  child: Icon(Icons.copy),
                                  onTap: () {
                                    log(index.toString());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              JenerateReport(),
                                        ));
                                  },
                                ),
                              ],
                            )),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: HelperWh.H(context) * .030,
                      );
                    },
                    itemCount: 5))
          ],
        ),
      ),
    );
  }
}
