
import 'package:fl_chat/components/my_button.dart';
import 'package:fl_chat/components/my_textfield.dart';
import 'package:fl_chat/module/login/provider/login_or_register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPage extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 로고
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),
            // 가입 환영 메시지
            Text(
              "회원가입을 하고 다양한 기능들을 즐겨보세요",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // 이메일 필드
            MyTextField(hintText: "이메일", obscureText: false, controller: _emailController),
            const SizedBox(height: 10,),
            MyTextField(hintText: "비밀번호", obscureText: true, controller: _passwordController,),
            const SizedBox(height: 10,),
            MyTextField(hintText: "비밀번호 확인", obscureText: true, controller: _confirmPasswordController,),
            // 로그인 버튼
            const SizedBox(
              height: 25,
            ),
            MyButton(text: "회원 가입", onTap: onRegister,),
            // 가입하러 가기
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("이미 가입을 하셨나요?", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                GestureDetector(
                    onTap: () {
                      ref.read(loginOrRegisterProvider.notifier).state = LoginOrRegisterState.login;
                    },
                    child: Text(" 로그인 하러가기", style: TextStyle(fontWeight: FontWeight.bold),)),
              ],
            )
          ],
        ),
      ),
    );
  }

  void onRegister() {

  }
}
