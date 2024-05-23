import 'package:expancetracker/utils/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF808080).withOpacity(1),
        title: Text('settings'),
        toolbarHeight: HelperWh.H(context) * .150,
        actions: [
          Icon(Icons.settings),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  HelperWh.W(context) * .010,
                ),
                color: Color(0xFFEFF0F5),
              ),
              child: ExpansionTile(
                title: Text('Clear All Salery Records'),
                subtitle: Text(
                  'This will clear your all salery expanses',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: HelperWh.H(context) * .020,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  HelperWh.W(context) * .010,
                ),
                color: Color(0xFFEFF0F5),
              ),
              child: ExpansionTile(
                title: Text('Date Format'),
                subtitle: Text(
                  'dd/MM/yyyy',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                children: [
                  Container(
                    width: double.infinity,
                    height: HelperWh.H(context) * .080,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'dd/MM/yyyy',
                        prefixStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: HelperWh.H(context) * .010,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: HelperWh.H(context) * .020,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  HelperWh.W(context) * .010,
                ),
                color: Color(0xFFEFF0F5),
              ),
              child: ExpansionTile(
                title: Text('Time Format'),
                childrenPadding: EdgeInsets.all(
                  HelperWh.W(context) * .040,
                ),
                children: [
                  Container(
                    width: double.infinity,
                    height: HelperWh.H(context) * .080,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '02:30 PM',
                          suffixIcon: Text('hh:mm:a'),
                          suffixIconConstraints: BoxConstraints.loose(
                            Size.infinite,
                          ),
                          prefixStyle: TextStyle(
                            color: Colors.black,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: HelperWh.H(context) * .010,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
