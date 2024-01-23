
import 'package:fl_chat/module/auth/page/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AuthService authService = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("홈 페이지", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      
      actions: [IconButton(onPressed: onLogout, icon: const Icon(Icons.logout))],),
    );
  }

  void onLogout() {
    authService.signOut();
  }
}
