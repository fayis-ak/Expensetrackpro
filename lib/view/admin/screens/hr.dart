import 'dart:developer';

import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/controller/usercontroller.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/view/admin/auth/logginadmin.dart';
import 'package:expancetracker/widgets/containerbutton.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Hr extends StatefulWidget {
  const Hr({super.key});

  @override
  State<Hr> createState() => _HrState();
}

class _HrState extends State<Hr> {
  List<String> usertype = ['sitesupervisor', 'Hr', 'Employee'];
  String? _selectedUserType;
  // Future addemploye() async {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Consumer<Authcontroller>(
  //         builder: (context, instance, _) {
  //           return AlertDialog(
  //             title: const Text('Add Employe '),
  //             content: Container(
  //               height: HelperWh.H(context) * .40,
  //               child: Form(
  //                 key: instance.formkey,
  //                 child: Column(
  //                   children: [
  //                     textformwidget(
  //                       controller: instance.emailcontroller,
  //                       hint: 'User email ',
  //                       validation: (value) {
  //                         if (value == null || value.isEmpty) {
  //                           return 'requred filed';
  //                         }
  //                         return null;
  //                       },
  //                     ),
  //                     SizedBox(
  //                       height: HelperWh.H(context) * .010,
  //                     ),
  //                     textformwidget(
  //                       controller: instance.passwordcontroller,
  //                       hint: 'ser password',
  //                       validation: (value) {
  //                         if (value == null || value.isEmpty) {
  //                           return 'requred filed';
  //                         }
  //                         return null;
  //                       },
  //                     ),
  //                     SizedBox(
  //                       height: HelperWh.H(context) * .010,
  //                     ),
  //                     DropdownButtonFormField(
  //                       validator: (value) {
  //                         if (value == null || value.isEmpty) {
  //                           return 'requred filed';
  //                         }
  //                         return null;
  //                       },
  //                       decoration: InputDecoration(hintText: 'UserType'),
  //                       items: usertype.map((e) {
  //                         return DropdownMenuItem(
  //                           child: Text(e),
  //                           value: e,
  //                         );
  //                       }).toList(),
  //                       onChanged: (value) {
  //                         setState(() {
  //                           _selectedUserType = value.toString();
  //                         });
  //                       },
  //                     ),
  //                     SizedBox(
  //                       height: HelperWh.H(context) * .010,
  //                     ),
  //                     Containerwidget(
  //                       text: 'Add employe',
  //                       ontap: () async {
  //                         if (instance.formkey.currentState!.validate()) {
  //                           // await instance.Signup(
  //                           //   instance.emailcontroller.text,
  //                           //   instance.passwordcontroller.text,
  //                           //   context,
  //                           //   '',
  //                           //   _selectedUserType.toString(),
  //                           // );
  //                         }
  //                       },
  //                       width: 100,
  //                       height: 50,
  //                       fontsize: 10,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             actions: [
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: const Text('close'),
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final instance = Provider.of<Firebasecontroller>(context);
    return Scaffold(
        body: FutureBuilder(
      future: instance.empoleesdetail('Hr'),
      builder: (context, snapshot) {
        log('fututre builder  ${snapshot.data.toString()}');

        log(instance.usermodel.length.toString());

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
                  // Spacer(),
                  // GestureDetector(
                  //   onTap: () async {
                  //     // await addemploye();
                  //   },
                  //   child: Container(
                  //     child: Row(
                  //       children: [
                  //         Textwidget(
                  //           text: 'Add hr',
                  //           style: TextStyle(color: colours.white),
                  //         ),
                  //         SizedBox(
                  //           width: HelperWh.W(context) * .01,
                  //         ),
                  //         Icon(
                  //           Icons.add,
                  //           color: colours.white,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
              child: instance.usermodel.isEmpty
                  ? Center(
                      child: Textwidget(
                        text: 'No hr  add ',
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
                              DataCell(CircleAvatar(
                                backgroundImage: NetworkImage(user.image),
                              )),
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
  }
}
