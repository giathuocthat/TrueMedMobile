import 'package:intl/intl.dart';

extension StringCurrencyExtension on String {
  String toCurrency({bool withSymbol = true}) {
    try {
      final value = num.parse(this);
      final formatter = NumberFormat("#,###", "vi_VN");
      final formatted = formatter.format(value);
      return withSymbol ? "$formattedđ" : formatted;
    } catch (_) {
      return this; // không parse được → trả lại chuỗi gốc
    }
  }
}

extension NumCurrencyExtension on num {
  String toCurrency(bool bool, {bool withSymbol = true}) {
    final formatter = NumberFormat("#,###", "vi_VN");
    final formatted = formatter.format(this);
    return withSymbol ? "$formattedđ" : formatted;
  }
}

extension PriceChangeExtension on num {
  /// Tính phần trăm thay đổi so với giá gốc (original)
  /// Trả về số âm = giảm giá
  /// Trả về số dương = tăng giá
  double percentChange(num original) {
    if (original == 0) return 0;
    return ((this - original) / original) * 100;
  }

  String percentChangeText({int fractionDigits = 0}) {
    final value = this;
    final sign = value > 0 ? "+" : ""; // âm thì tự có "-"
    return "$sign${value.toStringAsFixed(fractionDigits)} %";
  }

  // /// Trả về dạng text: "-9%" hoặc "+12%"
  // String percentChangeText(num original, {int fractionDigits = 0}) {
  //   final value = percentChange(original);
  //   final sign = value > 0 ? "+" : ""; // âm thì tự có "-"
  //   return "$sign${value.toStringAsFixed(fractionDigits)}%";
  // }
}
