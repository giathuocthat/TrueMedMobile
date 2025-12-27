import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../data/models/api_response_error_model.dart';
import '../../../../../domain/entities/bussiness_type_entity.dart';
import '../../../../../domain/entities/province_entity.dart';
import '../../../../../domain/entities/sign_up_entity.dart';
import '../../../../../domain/entities/ward_entity.dart';
import '../../../../../domain/use_cases/authentication_use_case.dart';
import '../../../../../domain/use_cases/bussiness_usecase .dart';
import 'register_state.dart';

part 'register_provider.g.dart';

@riverpod
class Register extends _$Register {
  late RegisterUseCase _registerUseCase;
  late GetBussinessTypeUseCase _getBussinessTypeUseCase;
  late CheckExitingPhoneEmailUseCase _checkExitingPhoneEmailUseCase;

  @override
  RegisterState build() {
    ref.keepAlive(); // 🔥 giữ state

    ref.onDispose(() {
      debugPrint('🔥 RegisterProvider disposed');
    });

    _registerUseCase = ref.read(registerUseCaseProvider);
    _getBussinessTypeUseCase = ref.read(getBussinessTypeUseCaseProvider);
    _checkExitingPhoneEmailUseCase = ref.read(
      checkExitingPhoneEmailUseCaseProvider,
    );

    return RegisterState();
  }

  void updatePolicyCheck(bool isPolicyChecked) {
    state = state.copyWith(isPolicyChecked: isPolicyChecked);
  }

  void updateBusinessTypeSelected(BussinessTypeResponseEntity? businessType) {
    state = state.copyWith(businessTypeSelected: businessType);
  }

  void updateAccountInfo(String phone, String passWord, String? email) {
    state = state.copyWith(
      phoneNumber: phone,
      passWord: passWord,
      addressMail: email,
    );
  }

  void updateBussinessAddress(
    ProvinceResponseEntity? province,
    WardResponseEntity? ward,
  ) {
    state = state.copyWith(provinceSelected: province, wardSelected: ward);
  }

  void setAdressStreet(String addressFinal) {
    state = state.copyWith(addressFinal: addressFinal);
  }

  void setOtp(String otp) {
    state = state.copyWith(otp: otp);
  }

  void callRegister(String otp) {
    setOtp(otp);
    registerAccount();
  }

  Future<void> registerAccount() async {
    // reset state trước
    state = state.copyWith(
      status: Status.loading,
      isSubmitting: true,
      errorResgister: null,
    );

    // 1) Call API 1
    final result1 = await _registerUseCase.call(
      SignUpRequestEntity(
        fullName: state.businessTypeSelected != null
            ? state.businessTypeSelected!.name
            : '',
        email: state.addressMail ?? '',
        phoneNumber: state.phoneNumber,
        password: state.passWord,
        confirmPassword: state.passWord,
        businessTypeId: state.businessTypeSelected != null
            ? state.businessTypeSelected!.id
            : 0,
        provinceId: state.provinceSelected?.id ?? 0,
        wardId: state.wardSelected?.id ?? 0,
        address: state.addressFinal,
        otpCode: state.otp,
      ),
    );

    switch (result1) {
      case Success(:final data):
        state = state.copyWith(
          status: Status.success,
          isSubmitting: false,
          errorResgister: data.message,
        );
      case Error(:final error):
        state = state.copyWith(
          status: Status.error,
          error: error,
          isSubmitting: false,
        );
      default:
        state = state.copyWith(
          status: Status.error,
          error: 'Something went wrong',
        );
        return;
    }
  }

  Future<void> fetchBussinessType() async {
    // reset state trước
    state = state.copyWith(status: Status.loading, error: null);

    // 1) Call API 1
    final result1 = await _getBussinessTypeUseCase.call(
      pageNumber: 1,
      pageSize: 20,
    );

    switch (result1) {
      case Success(:final data):
        state = state.copyWith(
          status: Status.success,
          bussinessTypes: data.data ?? [],
        );
      case Error(:final error):
        state = state.copyWith(status: Status.error, error: error);
      default:
        state = state.copyWith(
          status: Status.error,
          error: 'Something went wrong',
        );
        return;
    }
  }

  Future<void> checkPhoneAndEmailIsVaild(String phone, String? email) async {
    // reset state trước
    state = state.copyWith(
      status: Status.loading,
      isValid: false,
      error: null,
      listError: null,
    );

    // 1) Call API 1
    final result = await _checkExitingPhoneEmailUseCase.call(
      phone: phone,
      email: email,
    );

    switch (result) {
      case Success(:final data):
        state = state.copyWith(
          status: Status.success,
          listError: data.errors,
          isValid: data.isValid,
        );
      case Error(:final error):
        state = state.copyWith(
          status: Status.error,
          isValid: false,
          listError: [FieldErrorModel.general(error)],
        );
      default:
        state = state.copyWith(
          isValid: false,
          status: Status.error,
          listError: [FieldErrorModel.general('Something went wrong')],
        );
        return;
    }
  }
}
