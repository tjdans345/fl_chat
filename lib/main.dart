import 'package:firebase_core/firebase_core.dart';
import 'package:fl_chat/exception/exception_handler.dart';
import 'package:fl_chat/firebase_options.dart';
import 'package:fl_chat/module/auth/view/auth_gate_page.dart';
import 'package:fl_chat/module/themes/light_model.dart';
import 'package:fl_chat/module/themes/provider/theme_provider.dart';
import 'package:fl_chat/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// https://www.youtube.com/watch?v=5xU5WH2kEc0&t=1016s
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");

  FlutterError.onError = ExceptionHandler.handleError;

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGatePage(),
      theme: ref.watch(themeState),
      // 클래스로 그룹화 시킨 방법
      // theme: ThemeConstants.lightMode,
    );
  }
}


