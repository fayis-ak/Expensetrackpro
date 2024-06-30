import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expancetracker/models/addexpense.dart';
import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/controller/usercontroller.dart';
import 'package:expancetracker/utils/cherry_toast.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/view/supervisor/bottomnavwidget.dart';
import 'package:expancetracker/widgets/appBar.dart';
import 'package:expancetracker/widgets/containerbutton.dart';
import 'package:expancetracker/widgets/textformwidget.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
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

  DateTime? date;

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

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat('hh:mm a'); // Use the format you want
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    final addexinstance = Provider.of<Firebasecontroller>(context);
    final imghelper = Provider.of<Authcontroller>(context);

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
        child: Consumer<Firebasecontroller>(
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
                              Text('Select Time'),
                              if (_selectedTime != null)
                                Text(
                                  formatTimeOfDay(_selectedTime!),
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
                        inputType: TextInputType.number,
                        controller: amountController,
                        validation: (value) {},
                      ),
                      SizedBox(
                        height: HelperWh.H(context) * .030,
                      ),
                      Text('Image'),
                      // Consumer<Authcontroller>(
                      //   builder: (context, instance, child) {
                      //     return Container(
                      //       width: double.infinity,
                      //       height: HelperWh.H(context) * .080,
                      //       decoration: BoxDecoration(
                      //           color: colours.grey,
                      //           image: DecorationImage(
                      //               image: FileImage(
                      //                   File(instance.image.toString())))),
                      //       padding: EdgeInsets.symmetric(
                      //           horizontal: HelperWh.W(context) * .020),
                      //     );
                      //   },
                      // ),
                      Consumer<Authcontroller>(
                        builder: (context, helper, child) {
                          return ElevatedButton(
                              onPressed: () {
                                helper.imagegallery();
                              },
                              child: Textwidget(
                                  text: 'Add image', style: TextStyle()));
                        },
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
                                log(imghelper.urllink.toString());

                                final timeformat = _selectedTime != null
                                    ? formatTimeOfDay(_selectedTime!)
                                    : '';

                                if (imghelper.urllink != null) {
                                  addexinstance
                                      .addExpense(
                                    AddExpenseModel(
                                      name: nameController.text,
                                      site: selectedsite.toString(),
                                      category: selectedcategory.toString(),
                                      datatime: timeformat,
                                      paymentmode: selectedpayment.toString(),
                                      Amount: amountController.text,
                                      Image: imghelper.urllink,
                                      note: noteController.text,
                                      uid: auth.currentUser!.uid,
                                      date: DateTime.now().toString(),
                                    ),
                                  )
                                      .then((value) {
                                    SuccsToast(context, 'add expense sucess');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BottomnavWidget(
                                            indexnum: 0,
                                          ),
                                        ));

                                    imghelper.urllink = null;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Please Add Image')));
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('ok')));
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
        ),
      ),
    );
  }

  clearcontrol() {
    nameController.clear();
    selectedsite = '';
    selectedcategory = '';
  }
}
