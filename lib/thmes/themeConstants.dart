
import 'package:flutter/material.dart';

// 2. 클래스로 정의하여 관리하는 방법
class ThemeConstants {
  static final lightMode = ThemeData(
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade300,
      primary: Colors.grey.shade500,
      secondary: Colors.grey.shade200,
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade900,
    ),
  );
}