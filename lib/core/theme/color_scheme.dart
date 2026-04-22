import 'package:flutter/material.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme>{
  final Color appBarBackground;
    
  const AppColorScheme({
    required this.appBarBackground,
  });

  @override
  AppColorScheme copyWith({
    Color? appBarBackground,
  }) {
    return AppColorScheme(
      appBarBackground: appBarBackground ?? this.appBarBackground,
    );
  }

  @override
  AppColorScheme lerp(ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) return this;
    return AppColorScheme(
      appBarBackground: Color.lerp(appBarBackground, other.appBarBackground, t)!,
    );  
  }
}