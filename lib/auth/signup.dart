// import 'dart:developer';

// import 'package:expancetracker/auth/loggin.dart';
// import 'package:expancetracker/services/usercontroller.dart';
// import 'package:expancetracker/utils/cherry_toast.dart';
// import 'package:expancetracker/view/emloyee/bottom_nav/bottom_user.dart';
// import 'package:expancetracker/view/emloyee/homescreen.dart';
// import 'package:expancetracker/view/hr/Bottomnavigation/bottomnav.dart';
// import 'package:expancetracker/utils/color.dart';
// import 'package:expancetracker/utils/size.dart';
// import 'package:expancetracker/utils/strings.dart';
// import 'package:expancetracker/view/supervisor/bottomnavwidget.dart';
// import 'package:expancetracker/widgets/cliper.dart';
// import 'package:expancetracker/widgets/containerbutton.dart';
// import 'package:expancetracker/widgets/textformwidget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final formKey = GlobalKey<FormState>();

//   TextEditingController emailController = TextEditingController();

//   TextEditingController passwordController = TextEditingController();
//   TextEditingController phonenumbercontroller = TextEditingController();
//   TextEditingController namecontroller = TextEditingController();

//   String? _selectedUserType;
//   int selectedindex = 0;

//   List<String> usertype = ['sitesupervisor', 'Hr', 'Employee'];

 

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Consumer<Authcontroller>(
//       builder: (context, authcontroller, _) {
//         return SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 1100,
//                 color: colours.amber,
//                 child: Stack(
//                   children: [
//                     Positioned(
//                         top: 0,
//                         child: ClipPath(
//                           clipper: MyCustomClipper(),
//                           child: Container(
//                             width: 600,
//                             height: 500,
//                             color: Colors.black,
//                           ),
//                         )),
//                     Positioned(
//                         top: HelperWh.W(context) * .100,
//                         left: HelperWh.W(context) * .070,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Sign upto',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                   fontSize: HelperWh.W(context) * .100),
//                             ),
//                             Text(
//                               'Expence Track Pro',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: colours.amber,
//                                   fontSize: HelperWh.W(context) * .100),
//                             ),
//                           ],
//                         )),
//                     Positioned(
//                       top: HelperWh.W(context) * .400,
//                       left: HelperWh.W(context) * .100,
//                       child: Form(
//                         key: formKey,
//                         child: SingleChildScrollView(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: HelperWh.W(context) * .850,
//                                 height: HelperWh.H(context) * 850,
//                                 decoration: BoxDecoration(
//                                     color: colours.white,
//                                     borderRadius: BorderRadius.circular(
//                                         HelperWh.W(context) * .010)),
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: HelperWh.W(context) * .050,
//                                     // vertical: HelperWh.W(context) * .050,
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       SizedBox(
//                                         height: HelperWh.H(context) * .030,
//                                       ),
//                                       Textreuse(
//                                         text: 'Name',
//                                       ),
//                                       Textformfieldwidget(
//                                         controller: namecontroller,
//                                         validation: (value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'Plaease enter v';
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                       SizedBox(
//                                         height: HelperWh.H(context) * .030,
//                                       ),
//                                       //
//                                       Textreuse(
//                                         text: 'Email',
//                                       ),
//                                       Textformfieldwidget(
//                                         controller:
//                                             authcontroller.emailcontroller,
//                                         validation: (value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'Plaease enter v';
//                                           }
//                                           return null;
//                                         },
//                                       ),

//                                       SizedBox(
//                                         height: HelperWh.H(context) * .030,
//                                       ),

//                                       Textreuse(
//                                         text: 'Phone',
//                                       ),
//                                       Textformfieldwidget(
//                                         controller: phonenumbercontroller,
//                                         validation: (value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'Plaease enter v';
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                       SizedBox(
//                                         height: HelperWh.H(context) * .030,
//                                       ),
//                                       Textreuse(
//                                         text: 'UserType',
//                                       ),

//                                       DropdownButtonFormField(
//                                         decoration: InputDecoration(
//                                             hintText: 'UserType'),
//                                         items: usertype.map((e) {
//                                           return DropdownMenuItem(
//                                             child: Text(e),
//                                             value: e,
//                                           );
//                                         }).toList(),
//                                         onChanged: (value) {
//                                           log(value.toString());
//                                           setState(() {
//                                             _selectedUserType =
//                                                 value.toString();
//                                           });
//                                         },
//                                       ),

//                                       SizedBox(
//                                         height: HelperWh.H(context) * .030,
//                                       ),
//                                       Textreuse(
//                                         text: 'password',
//                                       ),
//                                       Textformfieldwidget(
//                                         controller:
//                                             authcontroller.passwordcontroller,
//                                         validation: (value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'Plaease enter v';
//                                           }
//                                           return null;
//                                         },
//                                       ),

//                                       SizedBox(
//                                         height: HelperWh.H(context) * .030,
//                                       ),
//                                       Containerwidget(
//                                         height: HelperWh.H(context) * .100,
//                                         width: double.infinity,
//                                         text: 'Sign up',
//                                         fontsize: HelperWh.W(context) * .070,
//                                         ontap: () async {
//                                           if (formKey.currentState!
//                                               .validate()) {
//                                             SuccsToast(
//                                                 context, 'working signup');
//                                             await authcontroller.Signup(
//                                                     authcontroller
//                                                         .emailcontroller.text,
//                                                     authcontroller
//                                                         .passwordcontroller
//                                                         .text,
//                                                     context,
//                                                     namecontroller.text,
//                                                     _selectedUserType
//                                                         .toString())
//                                                 .then((value) => {
//                                                       if (_selectedUserType !=
//                                                           null)
//                                                         {
//                                                           if (_selectedUserType ==
//                                                               'sitesupervisor')
//                                                             {
//                                                               Navigator.push(
//                                                                 context,
//                                                                 MaterialPageRoute(
//                                                                   builder:
//                                                                       (context) =>
//                                                                           BottomnavWidget(
//                                                                     indexnum: 0,
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             }
//                                                           else if (_selectedUserType ==
//                                                               'Hr')
//                                                             {
//                                                               Navigator.push(
//                                                                 context,
//                                                                 MaterialPageRoute(
//                                                                     builder: (context) =>
//                                                                         HrBottomnav(
//                                                                             indexnum:
//                                                                                 0)),
//                                                               )
//                                                             }
//                                                           else if (_selectedUserType ==
//                                                               'Employee')
//                                                             {
//                                                               Navigator.push(
//                                                                 context,
//                                                                 MaterialPageRoute(
//                                                                     builder:
//                                                                         (context) =>
//                                                                             BottomnavWidgetUser(
//                                                                               indexnum: 0,
//                                                                             )),
//                                                               )
//                                                             }
//                                                         }
//                                                       else
//                                                         {
//                                                           ScaffoldMessenger.of(
//                                                                   context)
//                                                               .showSnackBar(SnackBar(
//                                                                   content: Text(
//                                                                       'Please select a type')))
//                                                         }
//                                                     });
//                                           }
//                                         },
//                                       ),
//                                       SizedBox(
//                                         height: HelperWh.H(context) * .020,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             'Have an account?',
//                                             style: TextStyle(
//                                               color: colours.greydark,
//                                               fontSize:
//                                                   HelperWh.W(context) * .030,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: HelperWh.H(context) * .020,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     ));
//   }
// }
