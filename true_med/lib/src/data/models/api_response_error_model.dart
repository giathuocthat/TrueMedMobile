class FieldErrorModel {
  final String? field;
  final String? code;
  final String message;

  FieldErrorModel({this.field, this.code, required this.message});

  factory FieldErrorModel.fromJson(Map<String, dynamic> json) {
    return FieldErrorModel(
      field: json['fieldName'] as String?,
      code: json['errorCode'] as String?,
      message: json['errorMessage'] as String? ?? 'Unknown error',
    );
  }

  /// Dùng cho lỗi hệ thống / network
  factory FieldErrorModel.general(String message) {
    return FieldErrorModel(message: message);
  }
}

class ApiResponseErrorResponseModel {
  final bool isValid;
  final String? message;
  final List<FieldErrorModel>? errors;

  ApiResponseErrorResponseModel({
    required this.isValid,
    this.message,
    required this.errors,
  });

  factory ApiResponseErrorResponseModel.fromJson(Map<String, dynamic> json) {
    final errorsJson = json['errors'];

    return ApiResponseErrorResponseModel(
      isValid: json['isValid'] as bool? ?? false,
      message: json['message'] as String?,
      errors: (errorsJson is List && errorsJson.isNotEmpty)
          ? errorsJson.map((e) => FieldErrorModel.fromJson(e)).toList()
          : null,
    );
  }
}

class ApiErrorResponseModel {
  final String? detail;
  final Map<String, dynamic>? errors;

  ApiErrorResponseModel({this.detail, this.errors});

  factory ApiErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponseModel(
      detail: json['detail'] as String?,
      errors: json['errors'] as Map<String, dynamic>?,
    );
  }

  /// Lấy message đẹp để show UI
  String get message {
    if (detail != null && detail!.isNotEmpty) {
      return detail!;
    }

    if (errors != null && errors!.isNotEmpty) {
      return errors!.values.first.toString();
    }

    return 'Có lỗi xảy ra';
  }
}
