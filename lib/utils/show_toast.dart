import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'config_color.dart';

showToast({required String? message}) {
  Fluttertoast.showToast(
    backgroundColor: redPrimary,
    textColor: whitePrimary,
    msg: message!,
    timeInSecForIosWeb: 3,
    fontSize: 16,
  );
}
showSuccessToast({required String? message}) {
  Fluttertoast.showToast(
    backgroundColor: Colors.green,
    textColor: whitePrimary,
    msg: message!,
    timeInSecForIosWeb: 3,
    fontSize: 16,
  );
}