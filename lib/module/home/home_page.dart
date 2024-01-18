
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("홈 페이지", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      
      actions: [IconButton(onPressed: onLogout, icon: Icon(Icons.logout))],),
    );
  }

  void onLogout() {

  }
}
