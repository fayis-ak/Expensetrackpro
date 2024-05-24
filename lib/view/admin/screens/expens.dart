import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expancetracker/services/firebasecontroller.dart';
import 'package:expancetracker/services/usercontroller.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/view/admin/auth/logginadmin.dart';
import 'package:expancetracker/widgets/containerbutton.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

String? _selectedUserType;
int index = 0;

class _ExpenseState extends State<Expense> {
  @override
  Widget build(BuildContext context) {
    final instance = Provider.of<Firebasecontroller>(context);
    return Scaffold(
        body: FutureBuilder(
      future: instance.getExpense(),
      builder: (context, snapshot) {
        final exp = instance.expence;
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: HelperWh.W(context) * .030,
              ),
              width: double.infinity,
              height: HelperWh.H(context) * .200,
              color: Colors.black,
            ),
            Expanded(
              child: instance.expence.isEmpty
                  ? Center(
                      child: Textwidget(
                        text: 'No   employee add ',
                        style: TextStyle(),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      child: DataTable(
                          columnSpacing: HelperWh.W(context) * .150,
                          columns: [
                            DataColumn(
                              label: Text('image'),
                            ),
                            DataColumn(
                              label: Text('name'),
                            ),
                            DataColumn(
                              label: Text('Date'),
                            ),
                            DataColumn(
                              label: Text('id'),
                            ),
                            DataColumn(
                              label: Text('Salery'),
                            ),
                          ],
                          rows: instance.expence.map((user) {
                            return DataRow(cells: <DataCell>[
                              DataCell(Text('${index + 1}')),
                              DataCell(Text(user.name)),
                              DataCell(Text(user.Amount)),
                              DataCell(Text(user.category)),
                              DataCell(Text('100')),
                            ]);
                          }).toList()),
                    ),
            )
          ],
        );
      },
    ));
  }
}
