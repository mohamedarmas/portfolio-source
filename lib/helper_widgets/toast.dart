import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void showSuccessToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.green.shade600,
    textColor: Colors.white,
    gravity: ToastGravity.BOTTOM,
  );
}

void showErrorToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    
    backgroundColor: Colors.red.shade600,
    textColor: Colors.white,
    gravity: ToastGravity.BOTTOM,
  );
}
