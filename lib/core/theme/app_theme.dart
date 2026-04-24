import 'package:flutter/material.dart';

import 'button_styles.dart';
import 'color_scheme.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData createLightTheme(){
    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        const AppColorScheme(
          appBackground: Colors.black,
          columnBackground: Color.fromARGB(255, 42, 42, 42),
          dialogBackground: Color.fromARGB(255, 56, 56, 56),
          borderColor: Colors.grey,
        ),
        const AppTextStyles(
          appBarText: TextStyle(
            fontSize: 28,
            fontFamily: _fontFamily,
            color: Colors.white,
          ),
          headerText: TextStyle(
            fontSize: 18,
            fontFamily: _fontFamily,
            color: Colors.white,
          ),
          bodyText: TextStyle(
            fontSize: 16,
            fontFamily: _fontFamily,
            color: Colors.white,
          ),
        ),
        const AppButtonStyles(
          dialogButton: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.black),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            textStyle: WidgetStatePropertyAll(TextStyle(fontFamily: _fontFamily))
          ),  
        ),
      ],
    );
  }

  static const _fontFamily = 'SSFBreakthrough';
}

extension BuildContextExtention on BuildContext {
  AppColorScheme get colorScheme =>
      Theme.of(this).extension<AppColorScheme>()!;

  AppTextStyles get textStyles =>
      Theme.of(this).extension<AppTextStyles>()!;

  AppButtonStyles get buttonStyles =>
    Theme.of(this).extension<AppButtonStyles>()!;
}