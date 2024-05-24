import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expancetracker/models/addexpense.dart';
import 'package:expancetracker/services/firebasecontroller.dart';
import 'package:expancetracker/utils/cherry_toast.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/widgets/appBar.dart';
import 'package:expancetracker/widgets/containerbutton.dart';
import 'package:expancetracker/widgets/textformwidget.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Addexpence extends StatefulWidget {
  Addexpence({super.key});

  @override
  State<Addexpence> createState() => _AddexpenceState();
}

class _AddexpenceState extends State<Addexpence> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController amountController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  TextEditingController timeController = TextEditingController();

  List site = [
    ' Mubai',
    'Delhi',
    'Hariyana',
    'Kashmir',
    'Kollam',
    'kannur',
  ];

  List<String> payment = [
    ' cash',
    'Credit card',
    'Debit Card',
    'Net banking',
    'Cheque',
  ];

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
            titlePadding:
                EdgeInsets.symmetric(horizontal: HelperWh.W(context) * .05),
            backgroundColor: colours.white,
            title: Container(
              // padding: EdgeInsets.all(10),
              height: HelperWh.H(context) * .050,
              decoration: BoxDecoration(
                  color: colours.grey,
                  borderRadius: BorderRadius.circular(
                    HelperWh.W(context) * .010,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text('Select Site'),
                  SizedBox(
                    width: HelperWh.W(context) * .20,
                  )
                ],
              ),
            ),
            content: Container(
                height: HelperWh.H(context) * .200,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: HelperWh.H(context) * .060,
                        color: Color(0xFFEFF0F5),
                        child: Column(
                          children: [
                            SizedBox(
                              width: HelperWh.W(context) * .030,
                            ),
                            Text(
                              'site.,',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: HelperWh.H(context) * .060,
                        color: Color(0xFFEFF0F5),
                        child: Column(
                          children: [
                            SizedBox(
                              width: HelperWh.W(context) * .030,
                            ),
                            Text(
                              'site.,',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: HelperWh.H(context) * .060,
                        color: Color(0xFFEFF0F5),
                        child: Column(
                          children: [
                            SizedBox(
                              width: HelperWh.W(context) * .030,
                            ),
                            Text(
                              'site.,',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: HelperWh.H(context) * .060,
                        color: Color(0xFFEFF0F5),
                        child: Column(
                          children: [
                            SizedBox(
                              width: HelperWh.W(context) * .030,
                            ),
                            Text(
                              'site.,',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Conform',
                      style: TextStyle(color: colours.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showMyDialogsec(
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
            titlePadding:
                EdgeInsets.symmetric(horizontal: HelperWh.W(context) * .05),
            backgroundColor: colours.white,
            title: Container(
              // padding: EdgeInsets.all(10),
              height: HelperWh.H(context) * .050,
              decoration: BoxDecoration(
                  color: colours.grey,
                  borderRadius: BorderRadius.circular(
                    HelperWh.W(context) * .010,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text('Select Site'),
                  SizedBox(
                    width: HelperWh.W(context) * .20,
                  )
                ],
              ),
            ),
            content: Container(
                height: HelperWh.H(context) * .200,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: HelperWh.H(context) * .060,
                        color: Color(0xFFEFF0F5),
                        child: Column(
                          children: [
                            SizedBox(
                              width: HelperWh.W(context) * .030,
                            ),
                            Text(
                              'site.,',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: HelperWh.H(context) * .060,
                        color: Color(0xFFEFF0F5),
                        child: Column(
                          children: [
                            SizedBox(
                              width: HelperWh.W(context) * .030,
                            ),
                            Text(
                              'site.,',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: HelperWh.H(context) * .060,
                        color: Color(0xFFEFF0F5),
                        child: Column(
                          children: [
                            SizedBox(
                              width: HelperWh.W(context) * .030,
                            ),
                            Text(
                              'site.,',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: HelperWh.H(context) * .060,
                        color: Color(0xFFEFF0F5),
                        child: Column(
                          children: [
                            SizedBox(
                              width: HelperWh.W(context) * .030,
                            ),
                            Text(
                              'site.,',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Conform',
                      style: TextStyle(color: colours.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  TimeOfDay? _selectedTime;
  String? selectedsite;
  String? selectedcategory;

  String? selectedpayment;

  Future<void> timePicker(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final addexinstance = Provider.of<Firebasecontroller>(context);
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
        body: SingleChildScrollView(child: Consumer<Firebasecontroller>(
          builder: (context, insatnce, child) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: HelperWh.W(context) * .050,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name'),
                      Textformfieldwidget(
                        controller: nameController,
                        validation: (value) {},
                      ),
                      SizedBox(
                        height: HelperWh.H(context) * .030,
                      ),
                      Text('Select Site'),
                      Consumer<Firebasecontroller>(
                        builder: (context, instance, _) {
                          return FutureBuilder(
                              future: insatnce.allSitesview(),
                              builder: (context, snapshot) {
                                final datak = instance.site;
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: colours.grey,
                                    borderRadius: BorderRadius.circular(
                                      HelperWh.W(context) * .010,
                                    ),
                                  ),
                                  child: DropdownButtonFormField(
                                    value: selectedsite,
                                    hint: Text('Select site'),
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    items: datak.map((e) {
                                      return DropdownMenuItem<String>(
                                        value: e.Sitename,
                                        child: Text(e.Sitename),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedsite = value as String;
                                      });
                                    },
                                  ),
                                );
                              });
                        },
                      ),
                      SizedBox(
                        height: HelperWh.H(context) * .030,
                      ),
                      Text('Select Category'),
                      Consumer<Firebasecontroller>(
                        builder: (context, instance, _) {
                          return FutureBuilder(
                              future: instance.fetchCategories(),
                              builder: (context, snapshot) {
                                final datak = insatnce.catgory;
                                return Container(
                                    width: double.infinity,
                                    height: HelperWh.H(context) * .080,
                                    color: colours.grey,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: HelperWh.W(context) * .020),
                                    child: DropdownButtonFormField(
                                      hint: Text('Select category'),
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      items: datak.map((e) {
                                        return DropdownMenuItem<String>(
                                          value: e.category,
                                          child: Text(e.category),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedcategory = value as String;
                                        });
                                        log('this category select ${selectedcategory}');
                                      },
                                    ));
                              });
                        },
                      ),
                      SizedBox(
                        height: HelperWh.H(context) * .030,
                      ),
                      Text('Date&Time'),
                      GestureDetector(
                        onTap: () async {
                          timePicker(context);
                        },
                        child: Container(
                          width: double.infinity,
                          height: HelperWh.H(context) * .080,
                          color: colours.grey,
                          padding: EdgeInsets.symmetric(
                              horizontal: HelperWh.W(context) * .020),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('14/2/2024'),
                              if (_selectedTime != null)
                                Text(
                                  _selectedTime!.format(context).toString(),
                                ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: HelperWh.H(context) * .030,
                      ),
                      Text('Payment Mode'),
                      Container(
                          width: double.infinity,
                          height: HelperWh.H(context) * .080,
                          color: colours.grey,
                          padding: EdgeInsets.symmetric(
                              horizontal: HelperWh.W(context) * .020),
                          child: DropdownButtonFormField(
                            icon: Icon(Icons.keyboard_arrow_down),
                            hint: Textwidget(
                                text: 'Select payment type',
                                style: TextStyle()),
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            items: payment.map((e) {
                              return DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (value) {
                              selectedpayment = value as String;
                            },
                          )),
                      SizedBox(
                        height: HelperWh.H(context) * .030,
                      ),
                      Text('Amount'),
                      Textformfieldwidget(
                        controller: amountController,
                        validation: (value) {},
                      ),
                      SizedBox(
                        height: HelperWh.H(context) * .030,
                      ),
                      Text('Image'),
                      Container(
                        width: double.infinity,
                        height: HelperWh.H(context) * .080,
                        color: colours.grey,
                        padding: EdgeInsets.symmetric(
                            horizontal: HelperWh.W(context) * .020),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [],
                        ),
                      ),
                      SizedBox(
                        height: HelperWh.H(context) * .030,
                      ),
                      Text('Note'),
                      Textformfieldwidget(
                        maxlines: 3,
                        controller: noteController,
                        validation: (value) {},
                      ),
                      SizedBox(
                        height: HelperWh.H(context) * .050,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: HelperWh.W(context) * .60,
                            child: ElevatedButton(
                              onPressed: () {
                                addexinstance
                                    .addExpense(
                                  AddExpense(
                                    name: nameController.text,
                                    site: selectedsite.toString(),
                                    category: selectedcategory.toString(),
                                    datatime: _selectedTime.toString(),
                                    paymentmode: selectedpayment.toString(),
                                    Amount: amountController.text,
                                    Image: '',
                                    note: noteController.text,
                                    uid: auth.currentUser!.uid,
                                  ),
                                )
                                    .then((value) {
                                  SuccsToast(context, 'add expense sucess');
                                });
                              },
                              child: Text('Add',
                                  style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colours.black,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: HelperWh.H(context) * .050,
                ),
              ],
            );
          },
        )));
  }
}
