import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

//======= TOAST =======//
void showToast({
  required message,
  ToastGravity gravity = ToastGravity.BOTTOM,
  Color? textColor,
  Color? backgroundColor,
}) {
  Fluttertoast.showToast(
    msg: message,
    gravity: gravity,
    textColor: textColor,
    backgroundColor: backgroundColor,
  );
}
