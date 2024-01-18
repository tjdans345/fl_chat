
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chat/utils/stringUtil.dart';
import 'package:flutter/material.dart';

@immutable
class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // instance of auth
  Future<UserCredential> signInWithEmailPassword(String email, password) async {

    try {
      String encryptPassword = StringUtil.encryptedData(password);
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (error) {
      throw Exception(error.code);
    }
  }
  // sign in

  // sign up

  // sign out

  // errors

}