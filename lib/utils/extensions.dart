import 'dart:developer';

import 'package:flutter/foundation.dart';

extension StringExtensions on String {
  /// Print Devlopement Logs
  void printLog() {
    if (kDebugMode) log("===> $this");
  }
}
