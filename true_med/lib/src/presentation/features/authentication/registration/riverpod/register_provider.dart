import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../domain/entities/province_entity.dart';
import '../../../../../domain/entities/ward_entity.dart';
import '../../../../../domain/use_cases/address/get_province_all_usecase.dart';
import '../../../../../domain/use_cases/address/get_province_detail_usecase.dart';
import '../../../../../domain/use_cases/authentication_use_case.dart';
import '../../../../../domain/use_cases/bussiness_usecase .dart';
import '../../../../../domain/use_cases/order/payment_use_case.dart';
import 'register_state.dart';

part 'register_provider.g.dart';

@riverpod
class Register extends _$Register {
  late RegisterUseCase _registerUseCase;
  late SendOTPUseCase _sendOTPUseCase;
  late VerifyOTPUseCase _verifyOTPUseCase;
  late GetBussinessTypeUseCase _getBussinessTypeUseCase;
  late CheckExitingPhoneEmailUseCase _checkExitingPhoneEmailUseCase;
  late GetProvinceAllUseCase _getProvinceAllUseCase;
  late GetProvinceDetailUseCase _getProvinceDetailUseCase;

  @override
  RegisterState build() {
    ref.keepAlive(); // 🔥 giữ state
    //_registerUseCase = ref.read(registerUseCaseProvider);
    _getBussinessTypeUseCase = ref.read(getBussinessTypeUseCaseProvider);
    _checkExitingPhoneEmailUseCase = ref.read(
      checkExitingPhoneEmailUseCaseProvider,
    );
    _sendOTPUseCase = ref.read(sendOTPUseCaseProvider);
    _verifyOTPUseCase = ref.read(verifyOTPUseCaseProvider);

    _getProvinceAllUseCase = ref.read(getProvinceAllUseCaseProvider);
    _getProvinceDetailUseCase = ref.read(getProvinceDetailUseCaseProvider);

    final initialState = RegisterState(status: Status.loading);
    Future.microtask(() => fetchBussinessType());
    // ref.onInit(() {
    //   fetchBussinessType();
    // });
    return initialState;
  }

  void updatePolicyCheck(bool isPolicyChecked) {
    state = state.copyWith(isPolicyChecked: isPolicyChecked);
  }

  void updateBussinessTypesSelectedIds(List<int> ids) {
    state = state.copyWith(bussinessTypesSelectedIds: ids);
  }

  void toggleBusinessType(int id) {
    final current = state.bussinessTypesSelectedIds;
    final next = current.contains(id)
        ? current.where((e) => e != id).toList()
        : [...current, id];

    updateBussinessTypesSelectedIds(next);
  }

  void setAcountInfo(String phone, String passWord, String? email) {
    state = state.copyWith(
      phoneNumber: phone,
      passWord: passWord,
      addressMail: email,
    );
  }

  void setAddressPick(
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

  void callSendOTP() {
    state = state.copyWith(phoneNumber: state.phoneNumber);
    _sendOTPUseCase.call(phone: state.phoneNumber, type: 1);
    final phone = state.phoneNumber;

    resendOTP('0976973925', 0);
  }

  Future<void> resendOTP(String phone, int type) async {
    // reset state trước
    state = state.copyWith(status: Status.loading, error: null);

    // 1) Call API 1
    final result1 = await _sendOTPUseCase.call(phone: phone, type: type);

    switch (result1) {
      case Success(:final data):
        state = state.copyWith(status: Status.success);
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
      error: null,
      listError: null,
    );

    // 1) Call API 1
    final result1 = await _checkExitingPhoneEmailUseCase.call(
      phone: phone,
      email: email,
    );

    switch (result1) {
      case Success(:final data):
        state = state.copyWith(
          status: Status.success,
          //isValidCheck: data.isValid,
          listError: data.errors,
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
}
