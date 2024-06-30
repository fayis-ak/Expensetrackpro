import 'package:expancetracker/auth/loggin.dart';
import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/widgets/elevatedbt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreensitesup extends StatelessWidget {
  const SettingsScreensitesup({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> showMyDialog(
      BuildContext context,
    ) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // titlePadding:
            //     EdgeInsets.symmetric(horizontal: HelperWh.W(context) * .05),
            backgroundColor: Colors.white,
            title: Container(
                // padding: EdgeInsets.all(10),
                // height: HelperWh.H(context) * .080,

                child: Text('Are You Sure All delete')),
            actions: <Widget>[
              Row(
                children: [
                  Consumer<Firebasecontroller>(
                    builder: (context, instance, _) {
                      return ElevatedBT(
                        width: HelperWh.W(context) * .30,
                        text: 'Yes',
                        ontap: () async {
                          await instance.deleteallexpense();
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
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("SETTINGS"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(HelperWh.W(context) * .030),
            child: GestureDetector(
              onTap: () {
                showMyDialog(context);
              },
              child: Container(
                width: HelperWh.W(context) / 1,
                height: HelperWh.H(context) * .130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    HelperWh.W(context) * .030,
                  ),
                  color: Colors.grey.shade100,
                  border: Border.all(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ListTile(
                      title: Text('CLAER ALL RECORD'),
                      subtitle:
                          Text('This will clear your all expense entries'),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
