import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/utils/strings.dart';
import 'package:expancetracker/widgets/elevatedbt.dart';
import 'package:expancetracker/widgets/textformwidget.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HrAccoundInformation extends StatelessWidget {
  HrAccoundInformation({super.key});

  final editNameController = TextEditingController();
  final EditEmailController = TextEditingController();
  final PhoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF808080),
        title: Text('Accound information HR'),
      ),
      // appBar: ,
      body: SingleChildScrollView(
        child: Consumer<Firebasecontroller>(
          builder: (context, instance, child) {
            return FutureBuilder(
              future: instance.getuser(auth.currentUser!.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final editNameController =
                    TextEditingController(text: instance.userModel!.name);
                final EditEmailController =
                    TextEditingController(text: instance.userModel!.email);
                final PhoneNumberController =
                    TextEditingController(text: instance.userModel!.phone);

                return Column(
                  children: [
                    SizedBox(
                      height: HelperWh.H(context) * .030,
                    ),
                    Container(
                      // color: Colors.red,
                      width: double.infinity,
                      height: HelperWh.H(context) * .200,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: HelperWh.W(context) * .060),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: HelperWh.H(context) * .030,
                                ),
                                CircleAvatar(
                                  backgroundColor: colours.amber,
                                  radius: HelperWh.W(context) * .120,
                                  backgroundImage: NetworkImage(
                                    instance.userModel!.image.isEmpty
                                        ? 'instance.url.toString()'
                                        : instance.userModel!.image,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: HelperWh.W(context) * .010,
                            left: HelperWh.W(context) * .56,
                            child: Container(
                              width: HelperWh.W(context) * .060,
                              height: HelperWh.H(context) * .050,
                              decoration: BoxDecoration(
                                color: colours.grey,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  instance.pickimage(auth.currentUser!.uid);
                                },
                                icon: Icon(
                                  Icons.edit,
                                  size: HelperWh.W(context) * .050,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: HelperWh.W(context) * .030,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textwidget(
                            text: 'Name',
                            style: TextStyle(
                              fontSize: HelperWh.W(context) * .050,
                              color: colours.greydark,
                            ),
                          ),
                          SizedBox(
                            height: HelperWh.H(context) * .010,
                          ),
                          Textformfieldwidget(
                            controller: editNameController,
                            sufixicone: Icon(
                              Icons.edit,
                              color: colours.greydark,
                            ),
                            validation: (value) {},
                          ),
                          SizedBox(
                            height: HelperWh.H(context) * .020,
                          ),
                          Textwidget(
                            text: 'Email',
                            style: TextStyle(
                              fontSize: HelperWh.W(context) * .050,
                              color: colours.greydark,
                            ),
                          ),
                          SizedBox(
                            height: HelperWh.H(context) * .020,
                          ),
                          Textformfieldwidget(
                            controller: EditEmailController,
                            sufixicone: Icon(
                              Icons.edit,
                              color: colours.greydark,
                            ),
                            validation: (value) {},
                          ),
                          SizedBox(
                            height: HelperWh.H(context) * .030,
                          ),
                          Textwidget(
                            text: 'Phone',
                            style: TextStyle(
                              fontSize: HelperWh.W(context) * .050,
                              color: colours.greydark,
                            ),
                          ),
                          SizedBox(
                            height: HelperWh.H(context) * .030,
                          ),
                          Textformfieldwidget(
                            controller: PhoneNumberController,
                            sufixicone: Icon(
                              Icons.edit,
                              color: colours.greydark,
                            ),
                            validation: (value) {},
                          ),
                          SizedBox(
                            height: HelperWh.H(context) * .030,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedBT(
                                ontap: () {
                                  instance.updateProfile(
                                    editNameController.text,
                                    PhoneNumberController.text,
                                    auth.currentUser!.uid,
                                  );
                                },
                                width: HelperWh.W(context) * .60,
                                text: 'Save',
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
