import 'package:expancetracker/view/hr/homescreen.dart';
import 'package:expancetracker/view/hr/notification.dart';
import 'package:expancetracker/view/hr/profile.dart';
import 'package:flutter/material.dart';

class HrBottomnav extends StatefulWidget {
  int indexnum = 0;
  HrBottomnav({super.key, required this.indexnum});

  @override
  State<HrBottomnav> createState() => _HrBottomnavState();
}

class _HrBottomnavState extends State<HrBottomnav> {
  @override
  Widget build(BuildContext context) {
    final _pages = [
      HrHomepage(context),
      notification(context),
      profilepageHr(),
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
      // BottomNavigationBarItem(
      //     icon: Icon(Icons.picture_as_pdf_outlined), label: ''),
      BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none_outlined), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
    ],
  );
}
