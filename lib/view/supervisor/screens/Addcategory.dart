import 'package:expancetracker/models/addcategory.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/view/admin/auth/logginadmin.dart';
import 'package:expancetracker/widgets/appBar.dart';
import 'package:expancetracker/widgets/containerbutton.dart';
import 'package:expancetracker/widgets/elevatedbt.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/firebasecontroller.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  Future AddSite() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Firebasecontroller>(
          builder: (context, instance, _) {
            return AlertDialog(
              title: const Text('Add Category'),
              content: Container(
                height: HelperWh.H(context) * .20,
                child: Form(
                  child: Column(
                    children: [
                      SizedBox(
                        height: HelperWh.H(context) * .010,
                      ),
                      textformwidget(
                        controller: instance.addcategoryc,
                        hint: 'Category name',
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'requred filed';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: HelperWh.H(context) * .010,
                      ),
                      SizedBox(
                        height: HelperWh.H(context) * .010,
                      ),
                      Containerwidget(
                        text: 'Add Cateogry',
                        ontap: () async {
                          instance.addcategory(
                            CategoryMd(
                              category: instance.addcategoryc.text,
                              userid: auth.currentUser!.uid,
                            ),
                          );
                        },
                        width: 100,
                        height: 50,
                        fontsize: 10,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('close'),
                ),
              ],
            );
          },
        );
      },
    );
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
        title: 'ADD Category',
        icone: Icon(Icons.currency_rupee_sharp),
        onpress: () {},
      ),
      body: SingleChildScrollView(child: Consumer<Firebasecontroller>(
        builder: (context, instance, _) {
          return FutureBuilder(
            future: instance.fetchCategories(),
            builder: (context, snapshot) {
              final single = instance.catgory;

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: HelperWh.W(context) * .020,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: HelperWh.H(context) * .020,
                        ),
                        textformwidget(
                          validation: (value) {},
                        ),
                        SizedBox(
                          height: HelperWh.H(context) * .020,
                        ),
                        single.isEmpty
                            ? Column(
                                children: [
                                  Center(
                                    child: Textwidget(
                                        text: 'No Category available',
                                        style: TextStyle()),
                                  ),
                                ],
                              )
                            : ListView.separated(
                                itemCount: single.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                    // height: HelperWh.H(context) * .050,
                                    decoration: BoxDecoration(
                                      color: colours.grey,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Textwidget(
                                                text: single[index].category,
                                                style: TextStyle()),
                                            Spacer(),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.edit))
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: HelperWh.H(context) * .020,
                                  );
                                },
                              ),
                        SizedBox(
                          height: HelperWh.H(context) * .060,
                        ),
                        ElevatedBT(
                          text: 'ADD Category',
                          width: HelperWh.W(context) * .5,
                          ontap: () async {
                            await AddSite();
                          },
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
      )),
    );
  }
}
