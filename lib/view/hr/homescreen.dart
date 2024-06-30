import 'dart:developer';

import 'package:expancetracker/models/addSalery.dart';
import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/view/hr/screens/add_salery.dart';
import 'package:expancetracker/view/hr/screens/calender.dart';
import 'package:expancetracker/view/hr/screens/settings.dart';
import 'package:expancetracker/view/hr/screens/singleuserdet.dart';
import 'package:expancetracker/view/supervisor/screens/addexpence.dart';
import 'package:expancetracker/view/supervisor/screens/calender.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/textformwidget.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

Widget HrHomepage(context) {
  final searchController = TextEditingController();
  List<String> daystatus = [
    'Today',
    'Yeasterday',
    'Feb 28,2024',
    'Feb 25,2024',
    'Feb 22,2024',
    'Today',
    'Yeasterday',
    'Feb 28,2024',
    'Feb 25,2024',
    'Feb 22,2024',
  ];

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
                            height: HelperWh.H(context) * .050,
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
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                    Icons
                                                        .calendar_month_rounded,
                                                    color: colours.white),
                                                Text(
                                                  'Calender',
                                                  style: TextStyle(
                                                      color: colours.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Hrcalenderpage(),
                                              ));
                                        },
                                        value: 'data',
                                      ),
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.currency_rupee_sharp,
                                                    color: colours.white),
                                                Text(
                                                  ' Add Salery',
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
                                                    HrAddSalery(),
                                              ));
                                        },
                                      ),
                                      //   PopupMenuItem(
                                      //     child: Row(
                                      //       children: [
                                      //         Row(
                                      //           children: [
                                      //             Icon(Icons.settings,
                                      //                 color: colours.white),
                                      //             Text(
                                      //               'Settings',
                                      //               style: TextStyle(
                                      //                   color: colours.white),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     value: 'data',
                                      //     onTap: () {
                                      //       Navigator.push(
                                      //           context,
                                      //           MaterialPageRoute(
                                      //             builder: (context) =>
                                      //                 Settings(),
                                      //           ));
                                      //     },
                                      //   ),
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
                    height: HelperWh.H(context) * .040,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: HelperWh.H(context) * .050,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: HelperWh.H(context) * .120,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text('History'),
                          //     Text('See all'),
                          //   ],
                          // ),
                          SizedBox(
                            height: HelperWh.H(context) * .030,
                          ),
                          Consumer<Firebasecontroller>(
                            builder: (context, instance, child) {
                              return StreamBuilder(
                                stream: instance.getSalery(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  List<Addsalerymodel> list = [];

                                  list = snapshot.data!.docs.map((e) {
                                    return Addsalerymodel.fromjsone(
                                        e.data() as Map<String, dynamic>);
                                  }).toList();

                                  // List<Addsalerymodel> salery = [];

                                  // List<Addsalerymodel> filteredList = list
                                  //     .where(
                                  //         (element) => element.salery != null)
                                  //     .toList();

                                  // log('THe lenght ${filteredList.last.toString()}');

                                  if (snapshot.hasData) {
                                    return list.isEmpty
                                        ? Center(
                                            child: Text('No user'),
                                          )
                                        : ListView.separated(
                                            itemCount: list.length,
                                            physics: BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              var user = list[index].userid;

                                              final snapshot = db
                                                  .collection('users')
                                                  .doc(user)
                                                  .snapshots();

                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            SingleuserDetail(
                                                          userModel:
                                                              list[index],
                                                        ),
                                                      ));
                                                },
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              list[index]
                                                                  .userid,
                                                              style: TextStyle(
                                                                fontSize:
                                                                    HelperWh.W(
                                                                            context) *
                                                                        .050,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\u{20B9} ${list[index].salery}',
                                                              style: TextStyle(
                                                                color: colours
                                                                    .amber,
                                                                fontSize:
                                                                    HelperWh.W(
                                                                            context) *
                                                                        .050,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Row(
                                                        //   children: [
                                                        //     StreamBuilder(
                                                        //       stream: snapshot,
                                                        //       builder: (context,
                                                        //           snapshot) {
                                                        //         if (snapshot
                                                        //                 .connectionState ==
                                                        //             ConnectionState
                                                        //                 .waiting) {
                                                        //           return CircularProgressIndicator();
                                                        //         }
                                                        //         final data =
                                                        //             snapshot
                                                        //                 .data;
                                                        //         return Text(data![
                                                        //             'usertype']);
                                                        //       },
                                                        //     ),
                                                        //   ],
                                                        // )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                height:
                                                    HelperWh.H(context) * .020,
                                              );
                                            },
                                          );
                                  }
                                  return Container();
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
              top: HelperWh.H(context) * .250,
              left: HelperWh.W(context) * .11,
              child: Container(
                  width: HelperWh.W(context) * .8,
                  // height: 110,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(HelperWh.W(context) * .030),
                    color: Colors.black,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: HelperWh.H(context) * .030,
                      ),
                      Textwidget(
                        text: 'Salery Expense',
                        style: TextStyle(
                          color: colours.white,
                          fontSize: HelperWh.W(context) * .050,
                        ),
                      ),
                      SizedBox(
                        height: HelperWh.H(context) * .030,
                      ),
                      Consumer<Firebasecontroller>(
                        builder: (context, instance, child) {
                          return FutureBuilder<double>(
                            future: instance.fetchTotalSalary(),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return CircularProgressIndicator();
                                default:
                                  if (snapshot.hasError) {
                                    return Text(
                                        'Error fetching total salary: ${snapshot.error}');
                                  } else {
                                    final totalSalary = snapshot.data ?? 0.0;
                                    return Text(
                                      'Total Salary: \$' +
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
                      ),
                      SizedBox(
                        height: HelperWh.H(context) * .050,
                      ),
                    ],
                  ))),
        ],
      ),
    ),
  );
}
