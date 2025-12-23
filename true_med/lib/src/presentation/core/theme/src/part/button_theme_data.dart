part of '../theme_data.dart';

/// Filled Button
///
/// Light Theme
class _FilledButtonLightThemeData with ThemeExtensions {
  // FilledButtonThemeData call() {
  //   return FilledButtonThemeData(
  //     style: ButtonStyle(
  //       shape: WidgetStateProperty.all(
  //         StadiumBorder(side: BorderSide(color: lightColor.primary, width: 2)),
  //       ),
  //       padding: WidgetStateProperty.all(
  //         const EdgeInsets.symmetric(horizontal: 24),
  //       ),
  //       minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
  //       textStyle: WidgetStateProperty.all(
  //         const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  //       ),
  //     ),
  //   );
  // }
  FilledButtonThemeData call() {
    return FilledButtonThemeData(
      style: ButtonStyle(
        // HEIGHT = 44
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 44)),

        // PADDING = 10 / spacing-xl
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16, // spacing-xl
          ),
        ),

        // SHAPE = radius-md (NOT stadium)
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: lightColor.primary, width: 1),
          ),
        ),

        // TEXT STYLE
        textStyle: WidgetStateProperty.all(
          AppTextStyles.bodyTextSmSemiBold, // 🔥 đúng design system
        ),
      ),
    );
  }
}

/// Dark Theme
class _FilledButtonDarkThemeData with ThemeExtensions {
  FilledButtonThemeData call() {
    return FilledButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          StadiumBorder(side: BorderSide(color: darkColor.primary, width: 2)),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24),
        ),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

/// OutlinedButton Button
///
/// Light Theme
class _OutlinedButtonLightThemeData with ThemeExtensions {
  OutlinedButtonThemeData call() {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          const Size(double.infinity, 44), // đúng height
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // radius-md
          ),
        ),
        side: WidgetStateProperty.all(
          BorderSide(color: AppColors.borderPrimary, width: 1),
        ),
        // TEXT STYLE
        textStyle: WidgetStateProperty.all(
          AppTextStyles.bodyTextSmSemiBold, // 🔥 đúng design system
        ),
        foregroundColor: WidgetStateProperty.all(AppColors.fgPrimary),
      ),
    );
  }
}

/// Dark Theme
class _OutlinedButtonLightDarkThemeData with ThemeExtensions {
  OutlinedButtonThemeData call() {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          const Size(double.infinity, 44), // đúng height
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // radius-md
          ),
        ),
        side: WidgetStateProperty.all(
          BorderSide(color: AppColors.borderPrimary, width: 1),
        ),
        textStyle: WidgetStateProperty.all(AppTextStyles.bodyTextSmMedium),
        foregroundColor: WidgetStateProperty.all(AppColors.fgPrimary),
      ),
    );
  }
}

/// Elevated Button
///
/// Light Theme
class _ElevatedButtonLightThemeData with ThemeExtensions {
  ElevatedButtonThemeData call() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          StadiumBorder(side: BorderSide(color: lightColor.primary, width: 2)),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24),
        ),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

/// Dark Theme
class _ElevatedButtonDarkThemeData with ThemeExtensions {
  ElevatedButtonThemeData call() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          StadiumBorder(side: BorderSide(color: darkColor.primary, width: 2)),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24),
        ),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

/// Text Button
///
/// Light Theme
class _TextButtonLightThemeData with ThemeExtensions {
  TextButtonThemeData call() {
    return TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(lightColor.text.secondary),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

/// Dark Theme
class _TextButtonDarkThemeData with ThemeExtensions {
  TextButtonThemeData call() {
    return TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(darkColor.text.secondary),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
