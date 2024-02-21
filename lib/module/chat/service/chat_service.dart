import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chat/exception/custom_exception.dart';
import 'package:fl_chat/module/chat/model/message_model.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // get user Stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  // send message
  Future<void> sendMessage(String receiverID, message) async {
    // get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    // create a new message
    MessageModel newMessageModel = MessageModel(
        senderID: currentUserId,
        senderEmail: currentUserEmail,
        receiverID: receiverID,
        message: message,
        timestamp: timestamp);

    print("currentUserId : $currentUserId / receiverID : $receiverID");
    // construct chat room ID for the two users (sorted to ensure uniqueness)
    List<String> ids = [currentUserId, receiverID];
    ids.sort(); //sort the ids (this ensure the chatroomID is the same for any 2 people)
    String chatRoomID = ids.join("_");

    // add new message to database
    await _firestore.collection("chat_rooms").doc(chatRoomID).collection("messages").add(newMessageModel.toJson());
  }

  // get message
  Stream<QuerySnapshot> getMessageList(String userID, otherUserID) {
    // construct a chatroom ID for the two users
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join("_");
    return _firestore.collection("chat_rooms").doc(chatRoomID).collection("message").orderBy("timestamp", descending: false).snapshots();
  }

}
