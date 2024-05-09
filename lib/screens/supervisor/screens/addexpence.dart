import 'dart:ui';

import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/appBar.dart';
import 'package:expancetracker/widgets/containerbutton.dart';
import 'package:expancetracker/widgets/textformwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  List<String> site = [
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

  Future<void> _showMyDialog(BuildContext context, Widget content) async {
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
            titlePadding: EdgeInsets.symmetric(
                horizontal:  HelperWh.W(context) * .05),
            backgroundColor: colours.white,
            title: Container(
              // padding: EdgeInsets.all(10),
              height:  HelperWh.H(context) * .080,
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
                    width:  HelperWh.W(context) * .20,
                  )
                ],
              ),
            ),
            content: content,
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

  Widget buildView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: HelperWh.H(context) * .300,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: HelperWh.H(context) * .060,
            color: Color(0xFFEFF0F5),
            child: Row(
              children: [
                SizedBox(
                  width: HelperWh.W(context) * .030,
                ),
                Text(
                  site[index],
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20,
          );
        },
        itemCount: site.length,
      ),
    );
  }

  Widget cashbuildview(BuildContext context) {
    return Container(
      width: double.infinity,
      height: HelperWh.H(context) * .300,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: HelperWh.H(context) * .060,
            color: Color(0xFFEFF0F5),
            child: Row(
              children: [
                SizedBox(
                  width: HelperWh.W(context) * .030,
                ),
                Text(
                  payment[index],
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20,
          );
        },
        itemCount: payment.length,
      ),
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
                              _showMyDialog(context, buildView(context));
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
                            _showMyDialog(context, cashbuildview(context));
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
                          onPressed: () {},
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
        ),
      ),
    );
  }
}