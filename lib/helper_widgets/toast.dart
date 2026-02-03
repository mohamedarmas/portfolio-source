import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:final_site/theme/app_theme.dart';

void showSuccessToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: AppColors.black,
    textColor: AppColors.white,
    gravity: ToastGravity.BOTTOM,
  );
}

void showErrorToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: AppColors.black,
    textColor: AppColors.white,
    gravity: ToastGravity.BOTTOM,
  );
}
