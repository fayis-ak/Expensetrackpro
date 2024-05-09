import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:flutter/material.dart';

class Textformfieldwidget extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validation;
  final int? maxlines;
  final sufixicone;
  final String? hint;

  const Textformfieldwidget({
    super.key,
    required this.controller,
    required this.validation,
    this.maxlines,
    this.sufixicone,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      controller: controller,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.ltr,
        hintText: hint,
        hintStyle: TextStyle(color: colours.greydark),
        suffixIcon: sufixicone,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(HelperWh.W(context) * .020),
          borderSide: BorderSide.none,
        ),
        fillColor: colours.grey,
        filled: true,
      ),
      validator: validation,
    );
  }
}
