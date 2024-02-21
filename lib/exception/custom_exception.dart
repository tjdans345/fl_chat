import 'package:fl_chat/config/generic_builder.dart';

class CustomException implements Exception {
  late String errorType;
  late String errorMessage;

  CustomException({required this.errorType, required this.errorMessage});


  factory CustomException.fromJson(Map<String, dynamic> json) {
    return CustomException(
      errorType: json['errorType'] as String,
      errorMessage: json['errorMessage'] as String,
    );

  }

  // // 정적 메서드를 만드는 방법
  // CustomException.test() {
  //   print("asdsadasd");
  // }
  // // 아래와 동일
  // static void test() {
  //   print("asdsadasd");
  // }
}

// 불변성을 유지해야지 값이 변화되었을 때 상태 감지가 가능하다