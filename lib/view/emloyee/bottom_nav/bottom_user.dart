import 'package:expancetracker/view/emloyee/accoundscreen.dart';
import 'package:expancetracker/view/emloyee/homescreen.dart';
import 'package:expancetracker/view/emloyee/screens/notification.dart';
import 'package:expancetracker/view/supervisor/Homescreen.dart';
import 'package:expancetracker/view/supervisor/screens/calender.dart';
import 'package:flutter/material.dart';

class BottomnavWidgetUser extends StatefulWidget {
  int indexnum = 0;
  BottomnavWidgetUser({super.key, required this.indexnum});

  @override
  State<BottomnavWidgetUser> createState() => _BottomnavWidgetUserState();
}

class _BottomnavWidgetUserState extends State<BottomnavWidgetUser> {
  @override
  Widget build(BuildContext context) {
    final _pages = [
      EmployeeHomepage(),
      notificationScreen(),
      AccoundScreen(),
    ];

    return Scaffold(
      body: _pages[widget.indexnum],
      bottomNavigationBar: mynav(
        index: widget.indexnum,
        onTap: (index) {
          setState(() {
            widget.indexnum = index;
          });
        },
      ),
    );
  }
}

Widget mynav({int? index, void Function(int)? onTap, selectedColor}) {
  return BottomNavigationBar(
    showSelectedLabels: true,
    currentIndex: index!,
    selectedItemColor: Colors.amber,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: true,
    onTap: onTap,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: ' '),
      // BottomNavigationBarItem(
      //     icon: Icon(Icons.picture_as_pdf_outlined), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: ''),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: ' ',
      ),
    ],
  );
}
