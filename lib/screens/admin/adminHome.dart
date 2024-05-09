import 'package:expancetracker/screens/admin/drawer.dart';
import 'package:expancetracker/screens/admin/screenselection.dart';
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
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavigationTab(
              onItemSelected: _setSelectednavItem,
            ),
            Expanded(
              flex: 5,
              child: ScreenSelection(selectedNavItem: _selectedItem),
            ),
          ],
        ),
      ),
    );
  }
}
