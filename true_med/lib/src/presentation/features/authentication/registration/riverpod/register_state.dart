import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/models/api_response_error_model.dart';
import '../../../../../domain/entities/bussiness_type_entity.dart';
import '../../../../../domain/entities/province_entity.dart';
import '../../../../../domain/entities/ward_entity.dart';
import '../../../../../domain/enum/app_enums.dart';
import '../../../../core/base/status.dart';

export 'package:true_med/src/presentation/core/base/status.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState<T> with _$RegisterState<T> {
  const factory RegisterState({
    @Default(false) bool isPolicyChecked,
    @Default(false) bool rememberMe,
    @Default(Status.initial) Status status,

    @Default('') String phoneNumber,
    @Default('') String passWord,

    @Default('') String addressFinal,
    @Default('') String otp,

    String? addressMail,

    String? error,

    BussinessTypeResponseEntity? businessTypeSelected,

    @Default([]) List<BussinessTypeResponseEntity> bussinessTypes,

    List<FieldErrorModel>? listError,

    ProvinceResponseEntity? provinceSelected,
    WardResponseEntity? wardSelected,
    String? errorResgister,
    @Default(false) bool isSubmitting,

    @Default(AuthFlowStep.idle) AuthFlowStep authFlowStep,
  }) = _RegisterState<T>;

  const RegisterState._();
  bool get hasError => listError?.isNotEmpty == true;

  String? get firstError =>
      listError?.isNotEmpty == true ? listError!.first.message : null;
}
