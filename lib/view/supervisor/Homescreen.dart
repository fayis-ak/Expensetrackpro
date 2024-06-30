import 'dart:developer';

import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/view/supervisor/screens/Addcategory.dart';
import 'package:expancetracker/view/supervisor/screens/Expence.dart';
import 'package:expancetracker/view/supervisor/screens/addexpence.dart';
import 'package:expancetracker/view/supervisor/screens/addsite.dart';
import 'package:expancetracker/view/supervisor/screens/calender.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/view/supervisor/screens/settings.dart';
import 'package:expancetracker/widgets/textformwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

Widget SupervisorHomeScreen(context) {
  final searchController = TextEditingController();

  return SafeArea(
    child: SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    // height: ResponsiveHelper.getHeight(context) * .250,
                    color: Color(0xFF808080).withOpacity(1),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: HelperWh.H(context) * .050,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: HelperWh.H(context) * .110,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'EXPENCSE TRACK',
                                style: TextStyle(
                                  fontSize: HelperWh.W(context) * .050,
                                  color: colours.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // popup menu button
                                  showMenu(
                                    color: Colors.black,
                                    context: context,
                                    position:
                                        RelativeRect.fromLTRB(100, 100, 0, 0),
                                    items: <PopupMenuEntry>[
                                      // PopupMenuItem(
                                      //   child: Row(
                                      //     children: [
                                      //       Row(
                                      //         children: [
                                      //           Icon(
                                      //               Icons
                                      //                   .calendar_month_rounded,
                                      //               color: colours.white),
                                      //           Text(
                                      //             'Calender',
                                      //             style: TextStyle(
                                      //                 color: colours.white),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      //   onTap: () {
                                      //     Navigator.push(
                                      //         context,
                                      //         MaterialPageRoute(
                                      //           builder: (context) =>
                                      //               CalenderScreen(),
                                      //         ));
                                      //   },
                                      //   value: 'data',
                                      // ),
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.currency_rupee_sharp,
                                                    color: colours.white),
                                                Text(
                                                  'Add Expence',
                                                  style: TextStyle(
                                                      color: colours.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        value: 'data',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Addexpence(),
                                              ));
                                        },
                                      ),
                                      // PopupMenuItem(
                                      //   child: Row(
                                      //     children: [
                                      //       Row(
                                      //         children: [
                                      //           Icon(
                                      //               Icons
                                      //                   .calendar_month_rounded,
                                      //               color: colours.white),
                                      //           Text(
                                      //             'Generated Report',
                                      //             style: TextStyle(
                                      //                 color: colours.white),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      //   value: 'data',
                                      // ),
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.meeting_room_sharp,
                                                    color: colours.white),
                                                Text(
                                                  'Add Site',
                                                  style: TextStyle(
                                                      color: colours.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        value: 'data',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => AddSite(),
                                              ));
                                        },
                                      ),
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.grid_view_outlined,
                                                    color: colours.white),
                                                Text(
                                                  'Add Category',
                                                  style: TextStyle(
                                                      color: colours.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        value: 'data',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AddCategory(),
                                              ));
                                        },
                                      ),
                                      // PopupMenuItem(
                                      //   child: Row(
                                      //     children: [
                                      //       Row(
                                      //         children: [
                                      //           Icon(Icons.currency_rupee_sharp,
                                      //               color: colours.white),
                                      //           Text(
                                      //             'Add Payment Mode',
                                      //             style: TextStyle(
                                      //                 color: colours.white),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      //   value: 'data',
                                      // ),
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.settings,
                                                    color: colours.white),
                                                Text(
                                                  'Settings',
                                                  style: TextStyle(
                                                      color: colours.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        value: 'data',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SettingsScreensitesup(),
                                              ));
                                        },
                                      ),
                                    ],
                                  );
                                  print('click popup menu');
                                },
                                child: Icon(
                                  Icons.grid_view_rounded,
                                  color: colours.amber,
                                ),
                              )
                            ],
                          ),
                          Text(
                            'PRO',
                            style: TextStyle(
                              fontSize: HelperWh.W(context) * .050,
                              color: colours.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Textformfieldwidget(
                            controller: searchController,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Plaease enter v';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: HelperWh.H(context) * .100,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: HelperWh.H(context) * .050,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('History'),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Expence(),
                                        ));
                                  },
                                  child: Text(
                                    'See all',
                                    style: TextStyle(
                                      fontSize: HelperWh.W(context) * .050,
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: HelperWh.H(context) * .020,
                          ),
                          Consumer<Firebasecontroller>(
                            builder: (context, instance, _) {
                              return FutureBuilder(
                                future: instance.getExpense(),
                                builder: (context, snapshot) {
                                  final data = instance.expence;

                                  return ListView.separated(
                                    itemCount: data.length,
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      log(data[index].name);
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                data[index].name,
                                                style: TextStyle(
                                                  fontSize:
                                                      HelperWh.W(context) *
                                                          .050,
                                                ),
                                              ),
                                              Text(
                                                '\u{20B9} ${data[index].Amount}',
                                                style: TextStyle(
                                                  color: colours.amber,
                                                  fontSize:
                                                      HelperWh.W(context) *
                                                          .050,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            data[index].date,
                                            style: TextStyle(
                                                color: colours.greydark),
                                          )
                                        ],
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
                      ))
                ],
              ),
            ],
          ),
          Positioned(
            top: HelperWh.H(context) * .300,
            left: HelperWh.W(context) * .11,
            child: Container(
              width: HelperWh.W(context) * .8,
              // height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(HelperWh.W(context) * .030),
                color: Colors.black,
              ),
              child: ExpansionTile(
                // collapsedBackgroundColor: Colors.black,
                title: Text(
                  "Daily Expense",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<Firebasecontroller>(
                      builder: (context, helper, child) {
                        return FutureBuilder(
                          future: helper.fetchExpense(),
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return CircularProgressIndicator();
                              default:
                                if (snapshot.hasError) {
                                  return Text(
                                      'Error fetching total Expense: ${snapshot.error}');
                                } else {
                                  final totalSalary = snapshot.data ?? 0.0;
                                  return Text(
                                    'Total Expence: \$' +
                                        totalSalary.toStringAsFixed(
                                          2,
                                        ),
                                    style: TextStyle(color: Colors.white),
                                  );
                                }
                            }
                          },
                        );
                      },
                    )
                  ],
                ),
                backgroundColor: colours.grey,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Daily Expence'),
                      Consumer<Firebasecontroller>(
                        builder: (context, helper, child) {
                          return FutureBuilder(
                            future: helper.fetchExpenses(),
                            builder: (context, snapshot) {
                              return Text(
                                ' Daily \u{20B9}  ${helper.getDailyExpenses(DateTime.now())}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: HelperWh.W(context) * .050,
                                ),
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Monthly Expence'),
                      Consumer<Firebasecontroller>(
                        builder: (context, helper, child) {
                          return FutureBuilder(
                            future: helper.fetchExpenses(),
                            builder: (context, snapshot) {
                              return Text(
                                ' Monthly \u{20B9}  ${helper.getMonthlyExpenses(DateTime.now())}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: HelperWh.W(context) * .050,
                                ),
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Annal Expence:'),
                      Consumer<Firebasecontroller>(
                        builder: (context, helper, child) {
                          return FutureBuilder(
                            future: helper.fetchExpenses(),
                            builder: (context, snapshot) {
                              return Text(
                                ' Yearly \u{20B9}  ${helper.getYearlyExpenses(DateTime.now())}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: HelperWh.W(context) * .050,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
