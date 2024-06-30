import 'dart:async';
import 'dart:developer';

import 'package:expancetracker/models/addSalery.dart';
import 'package:expancetracker/models/usermodel.dart';
import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/view/emloyee/widget/appbar.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class EmployeeHomepage extends StatefulWidget {
  const EmployeeHomepage({super.key});

  @override
  State<EmployeeHomepage> createState() => _EmployeeHomepageState();
}

class _EmployeeHomepageState extends State<EmployeeHomepage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Firebasecontroller>(context, listen: false);
    final curentuser = auth.currentUser;

    return Column(
      children: [
        UserAppbar(),
        FutureBuilder(
          future: provider.getSalerysingle(auth.currentUser!.email),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('No Salery add wait'),
              );
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return Center(
                child: Text('No data available'),
              );
            }

            // log(snapshot.data.toString());

            // final salery = snapshot.data;

            final Addsalerymodel addsalerymodel =
                snapshot.data as Addsalerymodel;
            log(snapshot.data.toString());
            if (snapshot.hasData) {
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  addsalerymodel.name.isEmpty
                                      ? Text('procecing')
                                      : Textwidget(
                                          text: addsalerymodel.name,
                                          style: TextStyle(
                                            color: colours.white,
                                            fontSize:
                                                HelperWh.W(context) * .050,
                                          ),
                                        ),
                                  addsalerymodel.data.isEmpty
                                      ? Text('proce')
                                      : Textwidget(
                                          text: addsalerymodel.data,
                                          style: TextStyle(
                                            color: colours.white,
                                            fontSize:
                                                HelperWh.W(context) * .050,
                                          ),
                                        )
                                ],
                              )),
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
                                  addsalerymodel.salery.isEmpty
                                      ? Text('proce')
                                      : Textwidget(
                                          text:
                                              '\u{20B9} ${addsalerymodel.salery}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: colours.white,
                                              fontSize:
                                                  HelperWh.W(context) * .080),
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
                                  addsalerymodel.incetive.isEmpty
                                      ? Text('proce')
                                      : Textwidget(
                                          text:
                                              '\u{20B9}   ${addsalerymodel.incetive}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: colours.white,
                                              fontSize:
                                                  HelperWh.W(context) * .080),
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
            return Container();
          },
        )
      ],
    );
  }
}
