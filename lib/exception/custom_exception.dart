
enum CustomExceptionFile {
  errorType,
  errorMessage,
}

class CustomException {
  final String errorType;
  final String errorMessage;

  CustomException({
    required this.errorType,
    required this.errorMessage});
}

