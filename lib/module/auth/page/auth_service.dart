
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chat/utils/stringUtil.dart';
import 'package:flutter/material.dart';

@immutable
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;



  /// original Data -> encrypt Data
  String _getEncryptedData(password) => StringUtil.encryptedData(password);


  // instance of auth
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      String encryptPassword = _getEncryptedData(password);
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: encryptPassword);
      return userCredential;
    } on FirebaseAuthException catch (error) {
      throw Exception(error.code);
    }
  }


  // sign in




  /// sign up Method Ver.1
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      final encryptPassword = _getEncryptedData(password);
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: encryptPassword);
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