
import 'package:fl_chat/exception/custom_exception.dart';
import 'package:fl_chat/exception/enum/custom_exception_field.dart';
import 'package:fl_chat/module/home/home_page.dart';
import 'package:fl_chat/module/login/view/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExceptionHandler {
  static int handleError(FlutterErrorDetails details) {
    if (details.exception is CustomException) {
      CustomException customException = details.exception as CustomException;
      if (customException.errorType == ExceptionType.home.toString()) {
        print("Global Error !!!: : ${customException.errorType}");
        return 1;
      }
    }
    return 2;
  }
}