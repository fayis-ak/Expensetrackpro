import 'dart:io';
import 'dart:ui';

import 'package:expancetracker/auth/loggin.dart';
import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/utils/strings.dart';

import 'package:expancetracker/view/supervisor/screens/accoundinformation.dart';
import 'package:expancetracker/view/supervisor/screens/feedback.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/elevatedbt.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileSiteSuper extends StatelessWidget {
  ProfileSiteSuper({super.key});

  int curentindex = 0;

  Widget accountsettig(BuildContext context, Icon icone, Icon trilingicone,
      int curentindex, String titile, String subtitile) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            HelperWh.W(context) * .050,
          ),
          border: Border.all(
            color: colours.grey,
          )),
      child: ListTile(
        onTap: () {
          switch (curentindex) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AccoundInformationSitesuper()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FeedbackScreenSitesuper()),
              );
            case 3:
              _showMyDialog(context);
              break;

            default:
          }
        },
        leading: icone,
        title: Textwidget(
          text: titile,
          style: TextStyle(
            fontSize: HelperWh.W(context) * .050,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Textwidget(
          text: subtitile,
          style: TextStyle(
            fontSize: HelperWh.W(context) * .030,
          ),
        ),
        trailing: trilingicone,
      ),
    );
  }

  Future<void> _showMyDialog(
    BuildContext context,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: AlertDialog(
            // titlePadding:
            //     EdgeInsets.symmetric(horizontal: HelperWh.W(context) * .05),
            backgroundColor: colours.white,
            title: Container(
                // padding: EdgeInsets.all(10),
                // height: HelperWh.H(context) * .080,

                child: Text('Logout event')),
            actions: <Widget>[
              Row(
                children: [
                  Consumer<Firebasecontroller>(
                    builder: (context, instance, _) {
                      return ElevatedBT(
                        width: HelperWh.W(context) * .30,
                        text: 'Yes',
                        ontap: () async {
                          await instance.logout(context).then((value) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogginPage(),
                                ),
                                (route) => false);
                          });
                        },
                      );
                    },
                  ),
                  ElevatedBT(
                    text: 'No',
                    width: HelperWh.W(context) * .30,
                    ontap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final instance = Provider.of<Firebasecontroller>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            toolbarHeight: HelperWh.H(context) * .120,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.center,
                    colors: <Color>[
                      Color(0xFFFFFFFF),
                      Color(0xFF000000),
                      Color(0xFF8F2A1)
                    ]),
              ),
            ),
            centerTitle: true,
            title: Textwidget(
              text: 'MY PROFILE',
              style: TextStyle(
                color: colours.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: Icon(
              //     Icons.person,
              //     size: HelperWh.W(context) * .090,
              //   ),
              // )
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: HelperWh.H(context) * .200,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: HelperWh.W(context) * .060),
                  child: Row(
                    children: [
                      SizedBox(
                        height: HelperWh.H(context) * .030,
                      ),
                      CircleAvatar(
                        backgroundColor: colours.amber,
                        radius: HelperWh.W(context) * .120,
                        backgroundImage: NetworkImage(
                          instance.url.toString(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: HelperWh.W(context) * .030),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Textwidget(
                                text: 'username',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: HelperWh.H(context) * .010,
                            ),
                            Text('+9475837583'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: HelperWh.W(context) * .050,
                  left: HelperWh.W(context) * .230,
                  child: Container(
                    width: HelperWh.W(context) * .060,
                    height: HelperWh.H(context) * .050,
                    decoration: BoxDecoration(
                      color: colours.grey,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        instance.pickimage(auth.currentUser!.uid);
                      },
                      icon: Icon(
                        Icons.edit,
                        size: HelperWh.W(context) * .050,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(),
          SizedBox(
            height: HelperWh.H(context) * .040,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: HelperWh.W(context) * .030,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textwidget(
                    text: 'General',
                    style: TextStyle(
                      fontSize: HelperWh.W(context) * .050,
                    )),
                accountsettig(
                    context,
                    Icon(Icons.arrow_forward_ios),
                    Icon(Icons.arrow_forward_ios),
                    1,
                    'Account information',
                    'Change your Account information'),
                SizedBox(
                  height: HelperWh.H(context) * .040,
                ),
                accountsettig(
                    context,
                    Icon(Icons.star),
                    Icon(Icons.arrow_forward_ios),
                    2,
                    'Feedback',
                    'You will recieive daily updates'),
                SizedBox(
                  height: HelperWh.H(context) * .040,
                ),
                accountsettig(
                    context,
                    Icon(Icons.logout),
                    Icon(Icons.arrow_forward_ios),
                    3,
                    'Logout',
                    'Logout from this account'),
                SizedBox(
                  height: HelperWh.H(context) * .040,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
