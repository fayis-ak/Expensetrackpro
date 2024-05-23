import 'package:expancetracker/view/supervisor/Homescreen.dart';
import 'package:expancetracker/view/supervisor/screens/addexpence.dart';
import 'package:expancetracker/view/supervisor/screens/calender.dart';
import 'package:expancetracker/view/supervisor/profile.dart';
import 'package:expancetracker/view/supervisor/screens/reportsupervisor.dart';
import 'package:flutter/material.dart';

class BottomnavWidget extends StatefulWidget {
  int indexnum = 0;
  BottomnavWidget({super.key, required this.indexnum});

  @override
  State<BottomnavWidget> createState() => _BottomnavWidgetState();
}

class _BottomnavWidgetState extends State<BottomnavWidget> {
  @override
  Widget build(BuildContext context) {
    final _pages = [
      SupervisorHomeScreen(context),
      ReportSuppervisor(),
      Addexpence(),
      ProfileSiteSuper(),
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
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(
          icon: Icon(Icons.picture_as_pdf_outlined), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
    ],
  );
}
