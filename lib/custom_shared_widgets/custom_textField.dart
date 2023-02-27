import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_colors.dart';
import 'custom_textStyle.dart';


class CustomTextField extends StatelessWidget {


  String hintText;
  TextEditingController textController;
  TextInputType textInputType;
  TextInputAction textInputAction;
  int maxLength;
  Function(String) onChanged;
  String error;
  bool readOnly;

  CustomTextField({
    required this.hintText,
    required this.textController,
    required this.textInputType,
    required this.textInputAction,
    required this.maxLength,
    required this.onChanged,
    required this.error,
    required this.readOnly
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 34.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6)
            ),
            child: TextField(
              style: textFieldStyle,
              readOnly: readOnly,
              controller: textController,
              keyboardType: textInputType,
              textInputAction: textInputAction,
              maxLength: maxLength,
              cursorColor: headingColor,
              onChanged: onChanged,
              decoration: InputDecoration(
              counterText: '',
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 12.w),
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: hintTextStyle,
              ),
            )),
        Text(error ?? '', style: textFieldErrorStyle,)
      ],
    );
  }
}