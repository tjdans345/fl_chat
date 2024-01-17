
import 'package:fl_chat/login/page/login_page.dart';
import 'package:fl_chat/login/page/register_page.dart';
import 'package:fl_chat/login/provider/login_or_register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginOrRegisterPage extends ConsumerWidget {
  const LoginOrRegisterPage({super.key});


  // initially, show login page


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginOrRegisterState = ref.watch(loginOrRegisterProvider);

    if(LoginOrRegisterState.login == loginOrRegisterState) {
      return LoginPage();
    } else {
      return RegisterPage();
    }
  }
}
