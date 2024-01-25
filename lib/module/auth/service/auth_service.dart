
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chat/utils/stringUtil.dart';
import 'package:flutter/material.dart';

@immutable
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  /// original Data -> encrypt Data
  String _getEncryptedData(password) => StringUtil.encryptedData(password);

  /// sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      String encryptPassword = _getEncryptedData(password);
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: encryptPassword);

      // 혹시 다른 루트로 가입되었을 때 방지해서 로그인 메서드에도 추가했음
      // 실제 개발 단계 에서는 이런 방법 사용 하지 말고 빼야함
      _fireStore.collection("Users").doc(userCredential.user!.uid).set({
        "uid" : userCredential.user!.uid,
        "email" : email,
      });
      return userCredential;
    } on FirebaseAuthException catch (error) {
      throw Exception(error.code);
    }
  }



  /// sign up Method Ver.1
  /// Git Updates were rejected because the tip of your current branch is behind 해결 Test
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      final encryptPassword = _getEncryptedData(password);
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: encryptPassword);

      _fireStore.collection("Users").doc(userCredential.user!.uid).set({
        "uid" : userCredential.user!.uid,
        "email" : email,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
        throw Exception(e.code);
    }
  }

  // sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }




  // errors




}