import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/utils/cherry_toast.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/view/admin/auth/logginadmin.dart';
import 'package:expancetracker/view/admin/screens/employees.dart';
import 'package:expancetracker/view/admin/screens/expens.dart';
import 'package:expancetracker/view/admin/screens/feedback.dart';
import 'package:expancetracker/view/admin/screens/hr.dart';
import 'package:expancetracker/view/admin/screens/notification.dart';
import 'package:expancetracker/view/admin/screens/sitesupervisor.dart';
import 'package:expancetracker/view/emloyee/homescreen.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationTab extends StatefulWidget {
  final Function(String) onItemSelected;

  const NavigationTab({Key? key, required this.onItemSelected})
      : super(key: key);

  @override
  State<NavigationTab> createState() => _NavigationTabState();
}

class _NavigationTabState extends State<NavigationTab> {
  int _selectedIndex = 0;
  bool _selectedIndex1 = false;
  int colorSelection = 0;

  void indexChanged(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: HelperWh.W(context) * .200,
      height: HelperWh.H(context) * .950,
      decoration: BoxDecoration(
        color: colours.blue,
        borderRadius: BorderRadius.circular(
          HelperWh.W(context) * .005,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: HelperWh.H(context) * .050,
            ),
            ListTile(
              leading: const Icon(Icons.desktop_mac_outlined),
              title: Text(
                'Dashboard',
                style: TextStyle(
                  color: _selectedIndex == 0 ? Colors.red : Colors.black,
                ),
              ),
              onTap: () {
                print(_selectedIndex);
                indexChanged(0);
                setState(() {
                  _selectedIndex1 = true;
                });
                widget.onItemSelected('Dashboard');
              },
            ),
            buildListTileTitle(
                "Expense",
                2,
                Icons.money,
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Expense(),
                    ))),
            buildListTileTitle(
                "Users",
                3,
                Icons.person,
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Employees(),
                    ))),
            buildListTileTitle(
                "hr",
                4,
                Icons.person_2_outlined,
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Hr(),
                    ))),
            buildListTileTitle(
                "site supervisor",
                5,
                Icons.manage_accounts_rounded,
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => sitesupervisor(),
                    ))),
            // buildListTileTitle(
            //     "sitereport",
            //     5,
            //     Icons.question_mark,
            //     () => Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => sitere(),
            //         ))),
            buildListTileTitle(
                "notofication",
                6,
                Icons.notifications_active,
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notificationadmn(),
                    ))),
            buildListTileTitle(
                "feedback",
                6,
                Icons.feedback,
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Feedbackdr(),
                    ))),
            // Spacer(),
            SizedBox(
              height: HelperWh.H(context) * .20,
            ),
            Consumer<Firebasecontroller>(
              builder: (context, instnace, _) {
                return ListTile(
                  leading: Icon(Icons.logout),
                  title: Textwidget(text: 'Logout', style: TextStyle()),
                  onTap: () {
                    instnace.logout(context).then((value) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogginAdmin(),
                        ),
                        (route) => false,
                      );
                      SuccsToast(context, 'Logout succes');
                    });
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  ListTile buildListTileTitle(
      String Head, int index, IconData icon, Function() ontapo) {
    return ListTile(
      leading: Icon(
        icon,
        size: 16,
      ),
      textColor: Colors.white,
      contentPadding: const EdgeInsets.only(left: 15),
      selected: _selectedIndex == index,
      title: Text(
        '$Head',
        style: TextStyle(
            fontWeight:
                _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
            color: Colors.white,
            fontSize: 12),
      ),
      onTap: ontapo,
      // onTap: () {
      //   // print(_selectedIndex);

      //   // indexChanged(index);
      //   // widget.onItemSelected(
      //   //   '$Head',
      //   // );

      // },
    );
  }

  // ListTile buildListTile(String Field, int Index) {
  //   return ListTile(
  //     selectedColor: _selectedIndex == Index ? Colors.amber : Colors.white,
  //     iconColor: _selectedIndex == Index ? Colors.amber : Colors.white,
  //     selected: _selectedIndex == Index,
  //     title: Text(
  //       '$Field',
  //       style: TextStyle(
  //           color: _selectedIndex == Index ? Color(0xFFD89C3C) : Colors.white,
  //           fontSize: 12),
  //     ),
  //     onTap: () {
  //       print(_selectedIndex);

  //       indexChanged(Index);
  //       widget.onItemSelected("$Field");
  //     },
  //   );
  // }
}
