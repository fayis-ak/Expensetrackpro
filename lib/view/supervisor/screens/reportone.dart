import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/appBar.dart';
import 'package:expancetracker/widgets/elevatedbt.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';

class ReportoneCategory extends StatelessWidget {
  const ReportoneCategory({
    super.key,
  });

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
                    Textwidget(text: 'Mumbai', style: TextStyle()),
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
                    Textwidget(text: 'Mumbai', style: TextStyle()),
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
                    Textwidget(text: 'Material Purchase', style: TextStyle()),
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
                    Textwidget(text: '12:35 PM', style: TextStyle()),
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
                    Textwidget(text: 'Cash', style: TextStyle()),
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
                    Textwidget(text: 'Mumbai Site Expense', style: TextStyle()),
                  ],
                ),
                SizedBox(
                  height: HelperWh.H(context) * .040,
                ),
                ElevatedBT(
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
