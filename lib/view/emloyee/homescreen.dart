import 'dart:developer';

import 'package:expancetracker/models/addSalery.dart';
import 'package:expancetracker/models/usermodel.dart';
import 'package:expancetracker/services/firebasecontroller.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/view/emloyee/widget/appbar.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeHomepage extends StatefulWidget {
  const EmployeeHomepage({super.key});

  @override
  State<EmployeeHomepage> createState() => _EmployeeHomepageState();
}

class _EmployeeHomepageState extends State<EmployeeHomepage> {
  late Future<Addsalerymodel?> d;
  @override
  void initState() {
    super.initState();
    d = Provider.of<Firebasecontroller>(context, listen: false)
        .salerGet(auth.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAppbar(),
        FutureBuilder<Addsalerymodel?>(
          future: d,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            // log(snapshot.data.toString());
            // log(auth.currentUser!.uid);

            String nameText = 'No Name';
            String salaryText = 'No Salary';

            final user = snapshot.data!;
            if (user != null) {
              nameText = user.name ?? 'noname';
              salaryText = user.salery ?? 'nos';
            }
            if (snapshot.hasData && snapshot.data != null) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: HelperWh.W(context) * .070,
                      vertical: HelperWh.H(context) * .110,
                    ),
                    child: Container(
                      width: double.infinity,
                      // height: ResponsiveHelper.getHeight(context) * .300,
                      decoration: BoxDecoration(
                          color: colours.black,
                          borderRadius: BorderRadius.circular(
                              HelperWh.W(context) * .020)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Textwidget(
                              text: nameText,
                              style: TextStyle(
                                color: colours.white,
                                fontSize: HelperWh.W(context) * .050,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Textwidget(
                                    text: 'Salery',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: colours.white,
                                      fontSize: HelperWh.W(context) * .050,
                                    ),
                                  ),
                                  Textwidget(
                                    text: '\u{20B9} ${salaryText}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: colours.white,
                                        fontSize: HelperWh.W(context) * .080),
                                  ),

                                  //

                                  SizedBox(
                                    height: HelperWh.H(context) * .050,
                                  ),

                                  Textwidget(
                                    text: 'Incentive',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: colours.white,
                                      fontSize: HelperWh.W(context) * .050,
                                    ),
                                  ),
                                  Textwidget(
                                    text: '\u{20B9}  ${user.incetive ?? 'no'}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: colours.white,
                                        fontSize: HelperWh.W(context) * .080),
                                  ),
                                  SizedBox(
                                    height: HelperWh.H(context) * .050,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
            return Center(
              child: Text('Your salery proceing'),
            );
          },
        )
      ],
    );
  }
}
