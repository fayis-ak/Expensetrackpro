import 'package:expancetracker/view/supervisor/screens/addexpence.dart';
import 'package:flutter/cupertino.dart';

class AddExpense {
  String? id;
  String name;
  String site;
  String category;
  String datatime;
  String paymentmode;
  String Amount;
  String Image;
  String note;
  String uid;

  AddExpense({
    this.id,
    required this.name,
    required this.site,
    required this.category,
    required this.datatime,
    required this.paymentmode,
    required this.Amount,
    required this.Image,
    required this.note,
    required this.uid,
  });
  Map<String, dynamic> toJson(uiddoc) => {
        'id': uiddoc,
        'Name': name,
        'site': site,
        'category': category,
        'Datetime': datatime,
        'paymentmoode': paymentmode,
        'image': Image,
        'note': note,
        'uid': uid,
        'amout': Amount
      };

  factory AddExpense.fromJsone(Map<String, dynamic> json) {
    return AddExpense(
      id: json['id'],
      name: json['Name'],
      site: json['site'],
      category: json['category'],
      datatime: json['Datetime'],
      paymentmode: json['paymentmoode'],
      Amount: json['amout'],
      Image: json['image'],
      note: json['note'],
      uid: json['uid'],
    );
  }
}
