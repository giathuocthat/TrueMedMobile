import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle displayXsSemiBold = TextStyle(
    fontFamily: 'Display',
    fontSize: 24, // display-xs
    fontWeight: FontWeight.w600,
    height: 32 / 24, // line-height/display-xs
    letterSpacing: 0,
  );
  static const TextStyle bodyTextSmSemiBold = TextStyle(
    fontFamily: 'Body', // SF Pro Text
    fontSize: 14, // text-sm
    fontWeight: FontWeight.w600,
    height: 20 / 14, // line-height/text-sm
    letterSpacing: 0,
  );
  static const TextStyle bodyTextXsBold = TextStyle(
    fontFamily: 'Body', // SF Pro Text
    fontSize: 12, // text-xs
    fontWeight: FontWeight.w600,
    height: 18 / 12, // line-height/text-xs
    letterSpacing: 0,
  );
  static const TextStyle bodyTextSmBold = TextStyle(
    fontFamily: 'Body', // SF Pro Text
    fontSize: 14, // text-sm
    fontWeight: FontWeight.w700,
    height: 20 / 14, // line-height/text-sm
    letterSpacing: 0,
  );
  static const TextStyle bodyTextMdSemiBold = TextStyle(
    fontFamily: 'Body', // SF Pro Text
    fontSize: 16, // text-md
    fontWeight: FontWeight.w600,
    height: 24 / 16, // line-height/text-md
    letterSpacing: 0,
  );
  static const TextStyle bodyTextMd = TextStyle(
    fontFamily: 'Body', // SF Pro Text
    fontSize: 16, // text-md
    fontWeight: FontWeight.w400,
    height: 24 / 16, // line-height/text-md
    letterSpacing: 0,
  );
  static const TextStyle textSmMedium = TextStyle(
    fontFamily: 'Body', // SF Pro Text
    fontSize: 14, // text-sm
    fontWeight: FontWeight.w500,
    height: 20 / 14, // line-height/text-sm
    letterSpacing: 0,
  );
  static const TextStyle bodyTextSm = TextStyle(
    fontFamily: 'Body', // SF Pro Text
    fontSize: 14, // text-sm
    fontWeight: FontWeight.w400,
    height: 20 / 14, // line-height/text-sm
    letterSpacing: 0,
  );
  static const TextStyle displayMidiumLg = TextStyle(
    fontFamily: 'Display', // SF Pro Text
    fontSize: 48, // text-lg
    fontWeight: FontWeight.w500,
    height: 60 / 48, // line-height/text-lg
    //letterSpacing: 0,
    //letterSpacing = fontSize * (-2 / 100)
    letterSpacing: -0.96, // 🔥 -2%
  );

  static const TextStyle bodyTextXLSemiBold = TextStyle(
    fontFamily: 'Body', // SF Pro Text
    fontSize: 20, // text-xl
    fontWeight: FontWeight.w600,
    height: 30 / 20, // line-height/text-xl
    letterSpacing: 0,
  );

  /// body / text-sm / medium (500)
  static const TextStyle bodyTextSmMedium = TextStyle(
    fontFamily: 'Body', // SF Pro Text
    fontSize: 14, // text-sm
    fontWeight: FontWeight.w500,
    height: 20 / 14, // line-height/text-sm
    letterSpacing: 0,
  );
}
