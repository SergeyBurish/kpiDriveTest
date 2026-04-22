import 'package:flutter/material.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles>{
  final TextStyle appBarText;
    
  const AppTextStyles({
    required this.appBarText,
  });

  @override
  AppTextStyles copyWith({
    TextStyle? appBarText,
  }) {
    return AppTextStyles(
      appBarText: appBarText ?? this.appBarText,
    );  
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) return this;
    return AppTextStyles(
      appBarText: TextStyle.lerp(appBarText, other.appBarText, t)!,
    );
  }
}