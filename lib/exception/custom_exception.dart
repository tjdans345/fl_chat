import 'package:fl_chat/config/generic_builder.dart';



class CustomException {
  final String errorType;
  final String errorMessage;

  CustomException({required this.errorType, required this.errorMessage});
}

// 불변성을 유지해야지 값이 변화되었을 때 상태 감지가 가능하다