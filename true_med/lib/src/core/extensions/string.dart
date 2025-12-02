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
