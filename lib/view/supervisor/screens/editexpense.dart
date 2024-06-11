import 'dart:ui';

import 'package:expancetracker/models/addexpense.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/widgets/appBar.dart';
import 'package:expancetracker/widgets/containerbutton.dart';
import 'package:expancetracker/widgets/textformwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditExpense extends StatefulWidget {
  AddExpenseModel addExpenseModel;
  EditExpense({super.key, required this.addExpenseModel});

  @override
  State<EditExpense> createState() => _EditExpenseState();
}

class _EditExpenseState extends State<EditExpense> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

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
    nameController = TextEditingController(text: widget.addExpenseModel.name);

    TextEditingController amountController =
        TextEditingController(text: widget.addExpenseModel.Amount);

    TextEditingController noteController =
        TextEditingController(text: widget.addExpenseModel.note);

    TextEditingController timeController =
        TextEditingController(text: widget.addExpenseModel.date);
    return Scaffold(
      appBar: Appbarwidget(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        title: 'EditExpence',
        icone: Icon(Icons.currency_rupee_sharp),
        onpress: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  Container(
                    width: double.infinity,
                    height: HelperWh.H(context) * .080,
                    color: colours.grey,
                    padding: EdgeInsets.symmetric(
                        horizontal: HelperWh.W(context) * .020),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Mubai'),
                        IconButton(
                            onPressed: () async {
                              // await _showMyDialog(
                              //   context,
                              // );
                            },
                            icon: Icon(Icons.keyboard_arrow_down))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: HelperWh.H(context) * .030,
                  ),
                  Text('Select Category'),
                  Container(
                    width: double.infinity,
                    height: HelperWh.H(context) * .080,
                    color: colours.grey,
                    padding: EdgeInsets.symmetric(
                        horizontal: HelperWh.W(context) * .020),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Matrial Purchase'),
                        IconButton(
                            onPressed: () async {},
                            icon: Icon(Icons.keyboard_arrow_down))
                      ],
                    ),
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
                            Text(_selectedTime!.format(context).toString()),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cash'),
                        IconButton(
                          onPressed: () async {
                            _showMyDialogsec(
                              context,
                            );
                          },
                          icon: Icon(Icons.keyboard_arrow_down),
                        ),
                      ],
                    ),
                  ),
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
                    height: HelperWh.H(context) * .30,
                    padding: EdgeInsets.symmetric(
                        horizontal: HelperWh.W(context) * .020),
                    decoration: BoxDecoration(
                      color: colours.grey,
                      image: DecorationImage(
                          image: NetworkImage(
                        widget.addExpenseModel.Image.toString(),
                      )),
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
                            db
                                .collection('Expense')
                                .doc(widget.addExpenseModel.id)
                                .update({
                              'Name': nameController.text,
                              'amout': amountController.text,
                              'note': noteController.text,
                            });
                          },
                          child: Text('Edit',
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
        ),
      ),
    );
  }
}
