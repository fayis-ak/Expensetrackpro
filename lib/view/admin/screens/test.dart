// Container(
//         width: HelperWh.W(context) * .200,
//         height: HelperWh.H(context) * .950,
//         decoration: BoxDecoration(
//           color: colours.blue,
//           borderRadius: BorderRadius.circular(
//             HelperWh.W(context) * .005,
//           ),
//         ),
//         child: Column(
//           children: [
//             ListTile(
//               iconColor: colours.white,
//               textColor: colours.white,
//               leading: Icon(Icons.graphic_eq),
//               title: Textwidget(
//                   text: 'DashBoard',
//                   style: TextStyle(
//                       color: _selectedIndex == 0 ? Colors.red : Colors.amber)),
//               onTap: () {
//                 IndexChanged(0);
//                 setState(() {
//                   _selectedIndex1 = true;
//                 });
//                 widget.onItemSelected('DashBoard');
//               },
//             ),
//             buildlisttile(1, 'expense'),
//             buildlisttile(2, 'employee'),
//             buildlisttile(3, 'hr'),
//             buildlisttile(4, 'sitesuper'),
//             buildlisttile(5, 'report'),
//             buildlisttile(6, 'notification'),
//             buildlisttile(7, 'feedback'),
//             Spacer(),
//             ListTile(
//               iconColor: colours.white,
//               textColor: colours.white,
//               leading: Icon(Icons.logout),
//               title: Textwidget(text: 'Logout', style: TextStyle()),
//             ),
//           ],
//         ),
//       ),
   