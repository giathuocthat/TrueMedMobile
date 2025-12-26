enum SelectLocationMode { province, ward }

enum ProvinceHeaderState {
  completed, // đã chọn
  current, // đang chọn
  disabled, // chưa tới
}

enum OTPFlowType {
  register, // type = 0
  login, // type = 1
  forgotPass, // type = 2
}
