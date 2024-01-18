import 'package:firebase_core/firebase_core.dart';
import 'package:fl_chat/firebase_options.dart';
import 'package:fl_chat/module/auth/page/auth_gate.dart';
import 'package:fl_chat/module/thmes/light_model.dart';
import 'package:fl_chat/utils/stringUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// https://www.youtube.com/watch?v=5xU5WH2kEc0&t=1016s
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: lightMode,
      // 클래스로 그룹화 시킨 방법
      // theme: ThemeConstants.lightMode,
    );
  }
}


