import 'package:expancetracker/view/supervisor/bottomnavwidget.dart';
import 'package:flutter/material.dart';

class Hrcalenderpage extends StatefulWidget {
  const Hrcalenderpage({super.key});

  @override
  State<Hrcalenderpage> createState() => _HrcalenderpageState();
}

class _HrcalenderpageState extends State<Hrcalenderpage> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDtae = DateTime.now();

    Future clockopen() async {
      final DateTime? dateTime = await showDatePicker(
          barrierColor: Colors.white12,
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime(3000),
          initialDate: selectedDtae);

      if (dateTime != null) {
        setState(() {
          selectedDtae = dateTime;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CALENDER'),
        actions: [
          IconButton(
              onPressed: () async {
                await clockopen();
              },
              icon: Icon(Icons.calendar_month_rounded))
        ],
      ),
      body: Column(
        children: [
          Text('calender'),
          Text(
              '${selectedDtae.day} - ${selectedDtae.month} -${selectedDtae.year} -  ')
        ],
      ),
      // bottomNavigationBar: mynav(
      //   index: 0,
      // ),
    );
  }
}
