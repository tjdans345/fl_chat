
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chat/module/auth/service/auth_service.dart';
import 'package:fl_chat/module/chat/service/chat_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
   ChatPage({
    required this.receiverEmail,
    required this.receiverID,
    super.key});

  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // send message
  void sendMessage() async {
    if(_messageController.text.isNotEmpty) {
      // send the message
      await _chatService.sendMessage(receiverEmail, _messageController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receiverEmail),),
      body: Column(
        children: [
          // dispose all messages
          Expanded(child: _buildMessageList()),

          // user input


        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder<QuerySnapshot>(stream: _chatService.getMessageList(receiverID, senderID), builder: (context, snapshot) {

      if(snapshot.hasError) {
        return Text("Error");
      }

      if(snapshot.connectionState == ConnectionState.waiting) {
        return const Text("Loading...");
      }

      return ListView(
        children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
      );
    },);
  }

  // build Message Item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data["message"]);
  }

  Widget _buildUserInput() {
    return Row(
      children: [

        // textfiled should take up most of the space

      ],
    );
  }

}
