import 'package:firebase_core/firebase_core.dart';
import 'package:fl_chat/firebase_options.dart';
import 'package:fl_chat/module/auth/view/auth_gate_page.dart';
import 'package:fl_chat/module/themes/light_model.dart';
import 'package:fl_chat/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// https://www.youtube.com/watch?v=5xU5WH2kEc0&t=1016s
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");

  FlutterError.onError = (FlutterErrorDetails details) {
    // 여기에 원하는 글로벌 에러 처리 로직을 추가
    print('Global Error: ${details.exception}');
  };

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGatePage(),
      theme: lightMode,
      // 클래스로 그룹화 시킨 방법
      // theme: ThemeConstants.lightMode,
    );
  }
}


