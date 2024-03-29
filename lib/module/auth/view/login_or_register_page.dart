
import 'package:fl_chat/module/login/provider/login_or_register_provider.dart';
import 'package:fl_chat/module/login/view/login_page.dart';
import 'package:fl_chat/module/login/view/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginOrRegisterPage extends ConsumerWidget {
  const LoginOrRegisterPage({super.key});

  // initially, show login page

  // after login logic

  // after register logic

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
