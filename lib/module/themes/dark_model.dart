
import 'package:flutter/material.dart';

// 클래스 변수로 만들어 lightMode 변수에 직접 접근하는 방법
ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade600,
    secondary: Colors.grey.shade800,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade300,
  ),
);
