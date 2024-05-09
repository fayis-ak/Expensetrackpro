import 'package:flutter/material.dart';

class Appbarwidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function() onpress;
  final Icon icone;
  final Widget? leading;
  const Appbarwidget({super.key, required this.title, required this.onpress, required this.icone,   this.leading});

  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      toolbarHeight: 100,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: <Color>[Color(0xFF8F92A1), Color(0xFFEFF0F5)]),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      actions: [IconButton(onPressed: onpress, icon: icone)],
    );
  }
}
