import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData createLightTheme(){
    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        const AppColorScheme(
          appBarBackground: Colors.cyan,
        ),
        const AppTextStyles(
          appBarText: TextStyle(
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}

extension BuildContextExtention on BuildContext {
  AppColorScheme get colorScheme =>
      Theme.of(this).extension<AppColorScheme>()!;

  AppTextStyles get textStyles =>
      Theme.of(this).extension<AppTextStyles>()!;
}