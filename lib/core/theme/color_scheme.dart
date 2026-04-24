import 'package:flutter/material.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme>{
  final Color appBackground;
  final Color columnBackground;
  final Color dialogBackground;
  final Color borderColor;
    
  const AppColorScheme({
    required this.appBackground,
    required this.columnBackground,
    required this.dialogBackground,
    required this.borderColor,
  });

  @override
  AppColorScheme copyWith({
    Color? appBackground,
    Color? columnBackground,
    Color? dialogBackground,
    Color? borderColor,
  }) {
    return AppColorScheme(
      appBackground: appBackground ?? this.appBackground,
      columnBackground: columnBackground ?? this.columnBackground,
      dialogBackground: dialogBackground ?? this.dialogBackground,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  AppColorScheme lerp(ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) return this;
    return AppColorScheme(
      appBackground: Color.lerp(appBackground, other.appBackground, t)!,
      columnBackground: Color.lerp(columnBackground, other.columnBackground, t)!,
      dialogBackground: Color.lerp(dialogBackground, other.dialogBackground, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
    );  
  }
}