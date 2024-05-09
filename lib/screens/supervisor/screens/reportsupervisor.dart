import 'package:expancetracker/screens/admin/auth/logginadmin.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/appBar.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';

class ReportSuppervisor extends StatelessWidget {
  const ReportSuppervisor({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> coutry = ['Mumbai', 'Kollam', 'Delhi', 'Hariyana', 'Kashmir'];

    return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            toolbarHeight: HelperWh.H(context) * .130,
            backgroundColor: Color(0xFF808080),
            centerTitle: true,
            // leading:
            //     IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
            title: Text('REPORT'),
            actions: [Icon(Icons.file_copy)],
          ),
          SizedBox(
            height: HelperWh.H(context) * .030,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: HelperWh.W(context) * .030,
            ),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    fillColor: colours.grey,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        HelperWh.W(context) * .010,
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: HelperWh.H(context) * .030,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: HelperWh.W(context) * .030,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Textwidget(
                          text: coutry[index], style: TextStyle());
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: HelperWh.H(context) * .030,
                      );
                    },
                    itemCount: 5,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
