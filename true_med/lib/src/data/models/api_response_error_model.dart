class FieldErrorModel {
  final String fieldName;
  final String errorCode;
  final String errorMessage;

  FieldErrorModel({
    required this.fieldName,
    required this.errorCode,
    required this.errorMessage,
  });

  factory FieldErrorModel.fromJson(Map<String, dynamic> json) {
    return FieldErrorModel(
      fieldName: json['fieldName'] as String? ?? '',
      errorCode: json['errorCode'] as String? ?? '',
      errorMessage: json['errorMessage'] as String? ?? '',
    );
  }
}

class ApiResponseErrorResponseModel {
  final bool isValid;
  final String? message;
  final List<FieldErrorModel> errors;

  ApiResponseErrorResponseModel({
    required this.isValid,
    this.message,
    required this.errors,
  });

  factory ApiResponseErrorResponseModel.fromJson(Map<String, dynamic> json) {
    final errorsJson = json['errors'] as List? ?? [];

    return ApiResponseErrorResponseModel(
      isValid: json['isValid'] as bool? ?? true,
      message: json['message'] as String?,
      errors: errorsJson
          .map((e) => FieldErrorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
