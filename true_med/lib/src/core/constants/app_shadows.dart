import 'package:flutter/material.dart';

class AppShadows {
  /// shadow-xs (outer)
  static const BoxShadow xsOuter = BoxShadow(
    offset: Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0,
    color: Color(0x0D0A0D12), // 5%
  );

  /// skeuomorphic inner top
  static const BoxShadow xsInnerTop = BoxShadow(
    offset: Offset(0, -2),
    blurRadius: 0,
    spreadRadius: 0,
    color: Color(0x0D0A0D12), // 5%
  );

  /// skeuomorphic inner border
  static const BoxShadow xsInnerBorder = BoxShadow(
    offset: Offset(0, 0),
    blurRadius: 0,
    spreadRadius: 1,
    color: Color(0x2E0A0D12), // 18%
  );
}
