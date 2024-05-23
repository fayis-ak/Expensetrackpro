import 'package:expancetracker/view/supervisor/bottomnavwidget.dart';
import 'package:flutter/material.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDtae = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CALENDER'),
        actions: [
          IconButton(
              onPressed: () async {
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
