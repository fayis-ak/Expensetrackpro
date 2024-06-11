import 'dart:developer';

import 'package:expancetracker/models/feedback.dart';
import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/utils/cherry_toast.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Widget Feedbackdr() {
//   return
// }

class Feedbackdr extends StatelessWidget {
  const Feedbackdr({super.key});

  @override
  Widget build(BuildContext context) {
    final instance = Provider.of<Firebasecontroller>(context);

    return Scaffold(
      body: StreamBuilder(
        stream: instance.getFeedback(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<FeedBackModel> list = [];

          list = snapshot.data!.docs.map((e) {
            return FeedBackModel.fromjsone(e.data() as Map<String, dynamic>);
          }).toList();

          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: HelperWh.W(context) * .030,
                  ),
                  width: double.infinity,
                  height: HelperWh.H(context) * .200,
                  color: Colors.black,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.horizontal_split_outlined),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: list.isEmpty
                      ? Center(
                          child: Textwidget(
                            text: 'no feed back',
                            style: TextStyle(),
                          ),
                        )
                      : Container(
                          width: double.infinity,
                          child: ListView.separated(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              final count = list[index].exeperinece;
                              log(count.toString());
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                ),
                                width: 100,
                                // height: 60,
                                child: Column(
                                  children: [
                                    Text('NAME: ${list[index].name}'),
                                    SizedBox(
                                      height: HelperWh.H(context) * .010,
                                    ),
                                    Text(
                                        'SUGGEST FEED BACK: ${list[index].suggest}'),
                                    SizedBox(
                                      height: HelperWh.H(context) * .010,
                                    ),
                                    Text(
                                        'SUGGEST FEED BACK: ${list[index].exeperinece}'),
                                    // emojicount(count, context),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: HelperWh.H(context) * .020,
                              );
                            },
                          )),
                )
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}

emojicount(count, BuildContext context) {
  switch (count) {
    case '1':
      Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ],
      );
    case '2':
      Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ],
      );

    case '3':
      Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ],
      );
    case '4':
      Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ],
      );
      break;
    default:
      ErorrToast(context, 'error type');
      break;
  }
}
