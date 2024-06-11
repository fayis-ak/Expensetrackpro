import 'package:expancetracker/models/addSalery.dart';
import 'package:expancetracker/models/usermodel.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleuserDetail extends StatelessWidget {
  Addsalerymodel userModel;
  SingleuserDetail({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: HelperWh.W(context) * .050,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder(
                      future:
                          db.collection('users').doc(userModel.userid).get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }

                        
                        // snapshot.data;
                        return Container(
                          width: HelperWh.H(context) * .180,
                          height: HelperWh.H(context) * .20,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  image:
                                      NetworkImage(snapshot.data!['image']))),
                        );
                      },
                    ),
                    SizedBox(
                      width: HelperWh.W(context) * .020,
                    ),
                    Column(
                      children: [
                        Text('USERNAME :${userModel.name}'),
                        SizedBox(
                          height: HelperWh.H(context) * .010,
                        ),
                        Text('USER SALERY${userModel.salery}'),
                        SizedBox(
                          height: HelperWh.H(context) * .010,
                        ),
                        Text('USER INCETIBVE${userModel.incetive}'),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
