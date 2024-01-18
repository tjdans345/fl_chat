

import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as encrypt;

import 'package:flutter_dotenv/flutter_dotenv.dart';

class StringUtil {

  // 양방향 암호화를 위한 키 생성
  // final Uint8List secretKey = Uint8List.fromList(utf8.encode(dotenv.get("secret_key")));
  // final Uint8List ivKey = Uint8List.fromList(utf8.encode(dotenv.get("secret_key")));

  static final key = encrypt.Key.fromUtf8(dotenv.get("secret_key"));
  static final iv = encrypt.IV.fromLength(16);

  // 암호화 키 및 초기화 벡터 설정 값 반환 Method
  static encrypt.Encrypter _getEncrypter() {
    return encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
  }

  /// 평문 암호화 Method
  static String encryptedData(String originData) {
    final encrypter = _getEncrypter();
    // 암호화
    final encryptedData = encrypter.encrypt(originData, iv: iv);
    return encryptedData.base64;
  }

  /// 암호문 복호화 Method
  static String decryptedData(String originData) {
    final encrypter = _getEncrypter();
    final testValue = encryptedData(originData);
    // 복호화
    final decryptedData = encrypter.decrypt(encrypt.Encrypted.fromBase64(testValue), iv: iv);

    return decryptedData;
  }




}

