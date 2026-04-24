import 'package:flutter/material.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles>{
  final TextStyle appBarText;
  final TextStyle headerText;
  final TextStyle bodyText;
    
  const AppTextStyles({
    required this.appBarText,
    required this.headerText,
    required this.bodyText,
  });

  @override
  AppTextStyles copyWith({
    TextStyle? appBarText,
    TextStyle? headerText,
    TextStyle? bodyText,
  }) {
    return AppTextStyles(
      appBarText: appBarText ?? this.appBarText,
      headerText: headerText ?? this.headerText,
      bodyText: bodyText ?? this.bodyText,
    );  
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) return this;
    return AppTextStyles(
      appBarText: TextStyle.lerp(appBarText, other.appBarText, t)!,
      headerText: TextStyle.lerp(headerText, other.headerText, t)!,
      bodyText: TextStyle.lerp(bodyText, other.bodyText, t)!,
    );
  }
}