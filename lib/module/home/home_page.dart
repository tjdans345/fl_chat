import 'package:fl_chat/components/my_drawer.dart';
import 'package:fl_chat/components/user_tile.dart';
import 'package:fl_chat/module/auth/service/auth_service.dart';
import 'package:fl_chat/module/chat/service/chat_service.dart';
import 'package:fl_chat/module/chat/view/chat_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "홈 페이지",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        // loading ...
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading .....");
        }

        return ListView(
          children:
            snapshot.data!.map<Widget>(
              (userData) => _buildUserListItem(userData, context)).toList(),
        );

        // return list view
      },
    );
  }

  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    final userEmail = userData["email"];
    return UserTile(text: userEmail, onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatPage(receiverEmail: userEmail),));
    },);
  }
}