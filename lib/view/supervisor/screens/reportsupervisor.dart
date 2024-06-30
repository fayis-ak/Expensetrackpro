import 'package:expancetracker/models/addexpense.dart';
import 'package:expancetracker/controller/firebasecontroller.dart';
import 'package:expancetracker/view/admin/auth/logginadmin.dart';
import 'package:expancetracker/view/supervisor/screens/addexpence.dart';
import 'package:expancetracker/view/supervisor/screens/reportone.dart';
import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:expancetracker/widgets/appBar.dart';
import 'package:expancetracker/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportSuppervisor extends StatelessWidget {
  const ReportSuppervisor({super.key});

  @override
  Widget build(BuildContext context) {
    final helper = Provider.of<Firebasecontroller>(context, listen: false);
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
                // TextFormField(
                //   decoration: InputDecoration(
                //     suffixIcon: Icon(Icons.search),
                //     fillColor: colours.grey,
                //     filled: true,
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(
                //         HelperWh.W(context) * .010,
                //       ),
                //       borderSide: BorderSide.none,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: HelperWh.H(context) * .030,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: HelperWh.W(context) * .030,
                    ),
                    child: StreamBuilder(
                      stream: helper.getExpensejeberate(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        List<AddExpenseModel> list = [];

                        list = snapshot.data!.docs.map((e) {
                          return AddExpenseModel.fromJsone(
                              e.data() as Map<String, dynamic>);
                        }).toList();

                        if (snapshot.hasData) {
                          return list.isEmpty
                              ? Center(
                                  child: Textwidget(
                                      text: 'no dta', style: TextStyle()),
                                )
                              : ListView.separated(
                                  itemCount: list.length,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ReportoneCategory(
                                                addExpenseModel: list[index],
                                              ),
                                            ));
                                      },
                                      child: Textwidget(
                                        text: list[index].name,
                                        style: TextStyle(),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: HelperWh.H(context) * .030,
                                    );
                                  },
                                );
                        }
                        return Container();
                      },
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
