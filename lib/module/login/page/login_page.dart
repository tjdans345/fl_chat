import 'package:fl_chat/components/my_button.dart';
import 'package:fl_chat/components/my_textfield.dart';
import 'package:fl_chat/module/auth/page/auth_service.dart';
import 'package:fl_chat/module/login/provider/login_or_register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService authService = AuthService();

  LoginPage({super.key});



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
              "반가워요 !! 기다리고 있었어요 !",
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
            // 로그인 버튼
            const SizedBox(
              height: 25,
            ),
            MyButton(text: "로그인", onTap: () => onLogin(context),),
            // 가입하러 가기
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("회원이 아니세요?", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                GestureDetector(
                    onTap: () {
                      ref.read(loginOrRegisterProvider.notifier).state = LoginOrRegisterState.register;
                    },
                    child: const Text(" 지금 바로 가입하기", style: TextStyle(fontWeight: FontWeight.bold),)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // login Method
  void onLogin(BuildContext context) async {

    final String email = _emailController.text;
    final String password = _passwordController.text;
    
    try {
      await authService.signInWithEmailPassword(email, password);
    }

    catch (error) {
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(error.toString()),
      ),);
      
    }

  }


}
