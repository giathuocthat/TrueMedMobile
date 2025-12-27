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

enum ValidateStatusApp {
  idle, // chưa kiểm tra
  valid, // hợp lệ
  invalid, // không hợp lệ
}

enum AuthFlowStep {
  idle, // chưa làm gì
  checkingPhone, // đang check phone
  needOtp, // cần nhập OTP
  verifyingOtp, // đang verify OTP
  success, // đăng nhập xong
}
