import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

SuccsToast(BuildContext context, msg) {
  return CherryToast.success(
          title: Text(msg, style: TextStyle(color: Colors.black)))
      .show(context);
}

WarningToast(BuildContext context, msg) {
  return CherryToast.warning(
    description: Text("All information may be deleted after this action",
        style: TextStyle(color: Colors.black)),
    action: Text("Backup data", style: TextStyle(color: Colors.black)),
    actionHandler: () {
      print("Hello World!!");
    },
  ).show(context);
}

ErorrToast(BuildContext context, msg) {
  return CherryToast.error(
          description: Text("Invalid account information",
              style: TextStyle(color: Colors.black)),
          animationDuration: Duration(milliseconds: 1000),
          autoDismiss: true)
      .show(context);
}
