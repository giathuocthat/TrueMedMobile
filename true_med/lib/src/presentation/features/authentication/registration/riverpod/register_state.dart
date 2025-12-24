import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/models/api_response_error_model.dart';
import '../../../../../domain/entities/bussiness_type_entity.dart';
import '../../../../../domain/entities/product_entity.dart';
import '../../../../../domain/entities/province_detail_entity .dart';
import '../../../../../domain/entities/province_entity.dart';
import '../../../../../domain/entities/ward_entity.dart';
import '../../../../core/base/status.dart';

export 'package:true_med/src/presentation/core/base/status.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState<T> with _$RegisterState<T> {
  const factory RegisterState({
    @Default(false) bool isPolicyChecked,
    @Default(false) bool rememberMe,
    @Default(Status.initial) Status status,

    String? error,
    @Default([]) List<int> bussinessTypesSelectedIds,

    @Default([]) List<BussinessTypeResponseEntity> bussinessTypes,
    //@Default(false) bool isValidCheck,
    List<FieldErrorModel>? listError,

    @Default([]) List<ProvinceResponseEntity> listProvince,
    @Default([]) List<WardResponseEntity> listWard,
    ProvinceDetailResponseEntity? provinceDetail,
  }) = _RegisterState<T>;

  const RegisterState._();
  bool get isValid => listError?.isEmpty == true;
}
