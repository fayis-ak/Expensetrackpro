import 'package:expancetracker/models/addexpense.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/appBar.dart';
import 'package:expancetracker/widgets/elevatedbt.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';

class ReportoneCategory extends StatelessWidget {
  AddExpenseModel addExpenseModel;
  ReportoneCategory({
    super.key,
    required this.addExpenseModel,
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
                  height: HelperWh.H(context) * .040,
                ),
                ElevatedBT(
                  ontap: () async {
                    // await OpenFile.open("application/vnd.ms-excel");
                    await openExcelFile();
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

  Future<void> openExcelFile() async {
    final filePath = 'path/to/your/excel/file.xlsx';
    await OpenFile.open(filePath);
  }
}
