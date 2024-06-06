import 'package:expancetracker/services/firebasecontroller.dart';
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
              child: instance.usermodel.isEmpty
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
                          rows: instance.usermodel.map((user) {
                            return DataRow(cells: <DataCell>[
                              DataCell(CircleAvatar()),
                              DataCell(Text(user.name)),
                              DataCell(Text(user.type)),
                              DataCell(Text(user.email)),
                              DataCell(Text('100')),
                            ]);
                          }).toList()),
                    ),
            )
          ],
        );
      },
    ));
    ;
  }
}
