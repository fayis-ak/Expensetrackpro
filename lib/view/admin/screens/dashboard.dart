import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/models/addSalery.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget dashbord(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: HelperWh.W(context) * .0100,
      vertical: HelperWh.W(context) * .0100,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: HelperWh.W(context) * .230,
              height: HelperWh.W(context) * .100,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(
                  HelperWh.W(context) * .010,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Textwidget(
                    text: 'Daily Expence',
                    style: TextStyle(
                      color: colours.white,
                      fontSize: HelperWh.W(context) * .020,
                    ),
                  ),
                  Consumer<Firebasecontroller>(
                    builder: (context, helper, child) {
                      return FutureBuilder(
                        future: helper.fetchExpenses(),
                        builder: (context, snapshot) {
                          return Text(
                            'Daily \u{20B9} = ${helper.getDailyExpenses(DateTime.now())}',
                            style: TextStyle(color: Colors.white),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
            Container(
              width: HelperWh.W(context) * .230,
              height: HelperWh.W(context) * .100,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(
                  HelperWh.W(context) * .010,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Textwidget(
                    text: 'Monthly Expence',
                    style: TextStyle(
                      color: colours.white,
                      fontSize: HelperWh.W(context) * .020,
                    ),
                  ),
                  Consumer<Firebasecontroller>(
                    builder: (context, helper, child) {
                      return FutureBuilder(
                        future: helper.fetchExpenses(),
                        builder: (context, snapshot) {
                          return Text(
                            'Montly \u{20B9} = ${helper.getMonthlyExpenses(DateTime.now())}',
                            style: TextStyle(color: Colors.white),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
            Container(
              width: HelperWh.W(context) * .230,
              height: HelperWh.W(context) * .100,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(
                  HelperWh.W(context) * .010,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Textwidget(
                    text: 'Anual Expence',
                    style: TextStyle(
                      color: colours.white,
                      fontSize: HelperWh.W(context) * .020,
                    ),
                  ),
                  Consumer<Firebasecontroller>(
                    builder: (context, helper, child) {
                      return FutureBuilder(
                        future: helper.fetchExpenses(),
                        builder: (context, snapshot) {
                          return Text(
                            'Yearly \u{20B9} = ${helper.getYearlyExpenses(DateTime.now())}',
                            style: TextStyle(color: Colors.white),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: HelperWh.H(context) * .040,
        ),
        Container(
          width: double.infinity,
          height: HelperWh.W(context) * .330,
          color: colours.blue,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Textwidget(
                      text: 'Recent Expence',
                      style: TextStyle(
                        fontSize: HelperWh.W(context) * .030,
                        color: colours.white,
                      ),
                    )
                  ],
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
                        return list.isEmpty
                            ? Center(
                                child: Text(
                                  'no salery',
                                  style: TextStyle(color: Colors.white),
                                ),
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
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: HelperWh.W(context) * .050,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              list[index].name,
                                              style: TextStyle(
                                                color: colours.white,
                                                fontSize:
                                                    HelperWh.W(context) * .010,
                                              ),
                                            ),
                                            Text(
                                              '\u{20B9} ${list[index].salery}',
                                              style: TextStyle(
                                                color: colours.amber,
                                                fontSize:
                                                    HelperWh.W(context) * .010,
                                              ),
                                            ),
                                          ],
                                        ),
                                        StreamBuilder(
                                          stream: snapshot,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // Text(
                                                //   snapshot.data!['usertype'],
                                                //   style: TextStyle(
                                                //       color: Colors.white),
                                                // ),
                                                Text(''),
                                              ],
                                            );
                                          },
                                        )
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
          ),
        ),
      ],
    ),
  );
}
