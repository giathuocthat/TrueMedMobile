part of '../dependency_injection.dart';

@riverpod
LoginUseCase loginUseCase(Ref ref) {
  return LoginUseCase(ref.read(authenticationRepositoryProvider));
}

@riverpod
RefreshTokenUseCase refreshTokenUseCase(Ref ref) {
  return RefreshTokenUseCase(ref.read(authenticationRepositoryProvider));
}

@riverpod
CheckRememberMeUseCase checkRememberMeUseCase(Ref ref) {
  return CheckRememberMeUseCase(ref.read(authenticationRepositoryProvider));
}

@riverpod
SaveRememberMeUseCase saveRememberMeUseCase(Ref ref) {
  return SaveRememberMeUseCase(ref.read(authenticationRepositoryProvider));
}

@riverpod
LogoutUseCase logoutUseCase(Ref ref) {
  return LogoutUseCase(ref.read(authenticationRepositoryProvider));
}

@riverpod
GetCurrentLocaleUseCase getCurrentLocaleUseCase(Ref ref) {
  return GetCurrentLocaleUseCase(ref.read(localeRepositoryProvider));
}

@riverpod
SetCurrentLocaleUseCase setCurrentLocaleUseCase(Ref ref) {
  return SetCurrentLocaleUseCase(ref.read(localeRepositoryProvider));
}

@riverpod
ResetRepositoryUseCase resetRepositoryUseCase(Ref ref) {
  return const ResetRepositoryUseCase();
}

@riverpod
GetOnboardingStatusUseCase getOnboardingStatusUseCase(Ref ref) {
  return GetOnboardingStatusUseCase(ref.read(routerRepositoryProvider));
}

@riverpod
GetUserLoginStatusUseCase getUserLoginStatusUseCase(Ref ref) {
  return GetUserLoginStatusUseCase(ref.read(routerRepositoryProvider));
}

@riverpod
MarkOnboardingCompletedUseCase markOnboardingCompletedUseCase(Ref ref) {
  return MarkOnboardingCompletedUseCase(ref.read(routerRepositoryProvider));
}

@riverpod
GetProductsUseCase getProductsUseCase(Ref ref) {
  return GetProductsUseCase(ref.read(productRepositoryProvider));
}

@riverpod
Get2ProductsUseCase get2ProductsUseCase(Ref ref) {
  return Get2ProductsUseCase(ref.read(productRepositoryProvider));
}

@riverpod
GetProductStoresUseCase getProductStoresUseCase(Ref ref) {
  return GetProductStoresUseCase(ref.read(productRepositoryProvider));
}

@riverpod
GetProductDetailUseCase getProductDetailUseCase(Ref ref) {
  return GetProductDetailUseCase(ref.read(productRepositoryProvider));
}

@riverpod
GetProvinceAllUseCase getProvinceAllUseCase(Ref ref) {
  return GetProvinceAllUseCase(ref.read(addressRepositoryProvider));
}

@riverpod
GetWardAllUseCase getWardAllUseCase(Ref ref) {
  return GetWardAllUseCase(ref.read(addressRepositoryProvider));
}

@riverpod
GetProvinceDetailUseCase getProvinceDetailUseCase(Ref ref) {
  return GetProvinceDetailUseCase(ref.read(addressRepositoryProvider));
}

@riverpod
GetWardDetailUseCase getWardDetailUseCase(Ref ref) {
  return GetWardDetailUseCase(ref.read(addressRepositoryProvider));
}

@riverpod
GetAddressShippingUseCase getAddressShippingUseCase(Ref ref) {
  return GetAddressShippingUseCase(ref.read(addressRepositoryProvider));
}

@riverpod
AddAddressShippingUseCase addAddressShippingUseCase(Ref ref) {
  return AddAddressShippingUseCase(ref.read(addressRepositoryProvider));
}

@riverpod
EditAddressShippingUseCase editAddressShippingUseCase(Ref ref) {
  return EditAddressShippingUseCase(ref.read(addressRepositoryProvider));
}

@riverpod
DeleteAddressShippingUseCase deleteAddressShippingUseCase(Ref ref) {
  return DeleteAddressShippingUseCase(ref.read(addressRepositoryProvider));
}

@riverpod
DefaultAddressShippingUseCase defaultAddressShippingUseCase(Ref ref) {
  return DefaultAddressShippingUseCase(ref.read(addressRepositoryProvider));
}

@riverpod
CreateOrderUseCase createOrderUseCase(Ref ref) {
  return CreateOrderUseCase(ref.read(orderRepositoryProvider));
}

@riverpod
OrderListUseCase orderListUseCase(Ref ref) {
  return OrderListUseCase(ref.read(orderRepositoryProvider));
}

@riverpod
GetBussinessTypeUseCase getBussinessTypeUseCase(Ref ref) {
  return GetBussinessTypeUseCase(ref.read(bussinessRepositoryProvider));
}

@riverpod
CheckExitingPhoneEmailUseCase checkExitingPhoneEmailUseCase(Ref ref) {
  return CheckExitingPhoneEmailUseCase(
    ref.read(authenticationRepositoryProvider),
  );
}

@riverpod
SendOTPUseCase sendOTPUseCase(Ref ref) {
  return SendOTPUseCase(ref.read(authenticationRepositoryProvider));
}

@riverpod
VerifyOTPUseCase verifyOTPUseCase(Ref ref) {
  return VerifyOTPUseCase(ref.read(authenticationRepositoryProvider));
}
