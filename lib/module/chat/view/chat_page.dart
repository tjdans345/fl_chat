import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chat/components/my_textfield.dart';
import 'package:fl_chat/module/auth/service/auth_service.dart';
import 'package:fl_chat/module/chat/service/chat_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({required this.receiverEmail, required this.receiverID, super.key});

  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // send message
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      // send the message
      await _chatService.sendMessage(receiverID, _messageController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          // dispose all messages
          Expanded(child: _buildMessageList()),
          // user input
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    print("receiverID 222 : $receiverID / senderID 222 : $senderID");
    return StreamBuilder<QuerySnapshot>(
      stream: _chatService.getMessageList(receiverID, senderID),
      builder: (context, snapshot) {

        print("리빌드용");

        /// State = Error
        if (snapshot.hasError) {
          return Text("Error");
        }

        /// State = Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        /// State = Complete
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  // build Message Item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data["message"]);
  }

  Widget _buildUserInput() {
    return Row(
      children: [
        // textFiled should take up most of the space
        Expanded(
            child: MyTextField(
          controller: _messageController,
              hintText: "Type a Message",
              obscureText: false,
        )),
        IconButton(onPressed: sendMessage, icon: const Icon(Icons.arrow_upward)),
      ],
    );
  }
}
