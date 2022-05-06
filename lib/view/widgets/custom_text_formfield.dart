import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.text,
    required this.hintText,
    required this.onSaved,
    this.validator,
    this.keyBoardType,required this.obscureText, this.initialValue,
  }) : super(key: key);
  final String text;
  final String hintText;
  final FormFieldSetter onSaved;
  final FormFieldValidator? validator;
  final TextInputType? keyBoardType;
  final bool obscureText;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            color: Colors.grey.shade500,
          ),
          TextFormField(
            initialValue: initialValue,
            obscureText: obscureText,
            onSaved: onSaved,
            validator: validator,
            keyboardType: keyBoardType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
