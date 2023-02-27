import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'custom_colors.dart';
import 'package:flutter/material.dart';

void showToast(String message,{bool? centerGravity,bool? warning,bool? duration}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: duration != null ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    gravity: centerGravity != null ? ToastGravity.CENTER : ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: warning != null ? warning ? darkRed : Colors.greenAccent : const Color(0xFF23252A),
    textColor: warning != null ? warning ? Colors.white : Colors.black : Colors.white,
    fontSize: 14.sp,
  );
}