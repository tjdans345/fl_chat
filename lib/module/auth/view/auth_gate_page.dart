import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chat/module/auth/view/login_or_register_page.dart';
import 'package:fl_chat/module/home/view/home_page.dart';
import 'package:flutter/material.dart';

class AuthGatePage extends StatelessWidget {
  const AuthGatePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // Stream 빌더를 이용하여 로그인 이후 페이지 분기 처리
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return HomePage();
          } else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
