import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  Future<void> sendMessage(String receiverId, message) async {
    // get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    // create a new message

    // construct chat room ID for the two users (sorted to ensure uniqueness)

    // add new message to database
  }

  // get message

} 