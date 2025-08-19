import 'package:flutter/material.dart';

class AppTheme {
  static const _primary = Color(0xFF7E57C2); // soft purple
  static const _text = Color(0xFF111111);
  static const _subtitle = Color(0xFF7A7A7A);
  static const _divider = Color(0xFFECECEC);

  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: _primary,
        secondary: _primary,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: base.textTheme.apply(
        bodyColor: _text,
        displayColor: _text,
      ),
      dividerColor: _divider,
      listTileTheme: const ListTileThemeData(
        dense: true,
        iconColor: _text,
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }

  static Color get primary => _primary;
  static Color get subtitle => _subtitle;
  static Color get divider => _divider;
}
