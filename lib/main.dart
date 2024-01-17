import 'package:fl_chat/auth/login_or_register_page.dart';
import 'package:fl_chat/login/page/login_page.dart';
import 'package:fl_chat/thmes/light_model.dart';
import 'package:fl_chat/thmes/themeConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegisterPage(),
      theme: lightMode,
      // 클래스로 그룹화 시킨 방법
      // theme: ThemeConstants.lightMode,
    );
  }
}


