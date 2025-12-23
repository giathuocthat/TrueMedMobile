part of '../theme_data.dart';

class _InputDecorationLightTheme with ThemeExtensions {
  // final BorderRadius _borderRadius = BorderRadius.circular(6);

  // InputDecorationTheme call() {
  //   return InputDecorationTheme(
  //     hintStyle: textStyle.bodyLarge.copyWith(color: lightColor.text.secondary),
  //     contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  //     border: OutlineInputBorder(borderRadius: _borderRadius),
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: _borderRadius,
  //       borderSide: BorderSide(color: lightColor.border, width: 1),
  //     ),
  //     suffixIconColor: lightColor.icon,
  //     disabledBorder: OutlineInputBorder(borderRadius: _borderRadius),
  //   );
  // }
  final BorderRadius _borderRadius = BorderRadius.circular(
    8,
  ); // radius-md (ví dụ)

  InputDecorationTheme call() {
    return InputDecorationTheme(
      isDense: true, // 🔥 BẮT BUỘC để height chuẩn 44

      hintStyle: AppTextStyles.bodyTextSm.copyWith(
        color: AppColors.textPlaceholder,
      ),

      contentPadding: const EdgeInsets.symmetric(
        vertical: 10, // ✅ đúng spec
        horizontal: 14, // ✅ đúng spec
      ),

      border: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: const BorderSide(width: 1, color: AppColors.borderPrimary),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: const BorderSide(width: 1, color: AppColors.borderPrimary),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: const BorderSide(width: 2, color: AppColors.borderFocus),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: const BorderSide(width: 1, color: AppColors.borderDisabled),
      ),

      suffixIconColor: AppColors.iconSecondary,
    );
  }
}

class _InputDecorationDarkTheme with ThemeExtensions {
  final BorderRadius _borderRadius = BorderRadius.circular(6);

  InputDecorationTheme call() {
    return InputDecorationTheme(
      hintStyle: textStyle.bodyLarge.copyWith(color: darkColor.text.secondary),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      border: OutlineInputBorder(borderRadius: _borderRadius),
      enabledBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: BorderSide(color: darkColor.border, width: 1),
      ),
      suffixIconColor: darkColor.icon,
      disabledBorder: OutlineInputBorder(borderRadius: _borderRadius),
    );
  }
}
