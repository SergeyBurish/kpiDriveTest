import 'package:flutter/material.dart';

class AppButtonStyles extends ThemeExtension<AppButtonStyles>{
  final ButtonStyle dialogButton;
    
  const AppButtonStyles({
    required this.dialogButton,
  });

  @override
  AppButtonStyles copyWith({
    ButtonStyle? dialogButton,
  }) {
    return AppButtonStyles(
      dialogButton: dialogButton ?? this.dialogButton,
    );  
  }

  @override
  AppButtonStyles lerp(ThemeExtension<AppButtonStyles>? other, double t) {
    if (other is! AppButtonStyles) return this;
    return AppButtonStyles(
      dialogButton: ButtonStyle.lerp(dialogButton, other.dialogButton, t)!,
    );
  }
}