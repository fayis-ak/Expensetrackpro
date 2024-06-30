import 'package:expancetracker/utils/color.dart';
import 'package:expancetracker/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Textformfieldwidget extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validation;
  final int? maxlines;
  final sufixicone;
  final String? hint;
  final int? maxlenght;
  final TextInputType? inputType;
  final bool? readonly;

  const Textformfieldwidget({
    super.key,
    required this.controller,
    required this.validation,
    this.maxlines,
    this.sufixicone,
    this.hint,
    this.maxlenght,
    this.inputType,
    this.readonly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      readOnly: readonly?? false,
      keyboardType: inputType,
      inputFormatters: [LengthLimitingTextInputFormatter(maxlenght)],
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
