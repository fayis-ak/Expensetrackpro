import 'package:expancetracker/models/addexpense.dart';
import 'package:expancetracker/utils/cherry_toast.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/appBar.dart';
import 'package:expancetracker/widgets/containerbutton.dart';
import 'package:expancetracker/widgets/elevatedbt.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';

class JenerateReport extends StatelessWidget {
  AddExpenseModel addExpenseModel;
  JenerateReport({super.key, required this.addExpenseModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarwidget(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        title: 'AddExpence',
        icone: Icon(Icons.currency_rupee_sharp),
        onpress: () {},
      ),
      body: Column(
        children: [
          SizedBox(
            height: HelperWh.H(context) * .050,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: HelperWh.W(context) * .050,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Textwidget(
                        text: 'Name',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    Spacer(),
                    Textwidget(text: addExpenseModel.name, style: TextStyle()),
                  ],
                ),
                SizedBox(
                  height: HelperWh.H(context) * .050,
                ),
                Row(
                  children: [
                    Textwidget(
                        text: 'Site:',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    Spacer(),
                    Textwidget(text: addExpenseModel.site, style: TextStyle()),
                  ],
                ),
                SizedBox(
                  height: HelperWh.H(context) * .050,
                ),
                Row(
                  children: [
                    Textwidget(
                        text: 'Cetegory:',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    Spacer(),
                    Textwidget(
                        text: addExpenseModel.category, style: TextStyle()),
                  ],
                ),
                SizedBox(
                  height: HelperWh.H(context) * .050,
                ),
                Row(
                  children: [
                    Textwidget(
                        text: 'Time:',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    Spacer(),
                    Textwidget(
                        text: addExpenseModel.datatime, style: TextStyle()),
                  ],
                ),
                SizedBox(
                  height: HelperWh.H(context) * .050,
                ),
                Row(
                  children: [
                    Textwidget(
                        text: 'Payment Mode:',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    Spacer(),
                    Textwidget(
                        text: addExpenseModel.paymentmode, style: TextStyle()),
                  ],
                ),
                SizedBox(
                  height: HelperWh.H(context) * .050,
                ),
                Row(
                  children: [
                    Textwidget(
                        text: 'Note:',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    Spacer(),
                    Textwidget(text: addExpenseModel.note, style: TextStyle()),
                  ],
                ),
                SizedBox(
                  height: HelperWh.H(context) * .080,
                ),
                ElevatedBT(
                  ontap: () {
                    SuccsToast(context, 'THe JENERATING EXCEl SUCCES');
                  },
                  text: 'Generate',
                  width: HelperWh.W(context) * .60,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
