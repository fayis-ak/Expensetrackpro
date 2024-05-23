import 'package:expancetracker/view/admin/drawer.dart';
import 'package:expancetracker/view/admin/screens/dashboard.dart';
import 'package:expancetracker/view/admin/screenselection.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  String _selectedItem = "Dashboard";

  void _setSelectednavItem(String item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: NavigationTab(
                onItemSelected: _setSelectednavItem,
              ),
            ),
            Expanded(
              flex: 5,
              child: dashbord(context),
            ),
          ],
        ),
      ),
    );
  }
}
