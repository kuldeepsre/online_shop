import 'package:flutter/material.dart';

import '../bloc/them/ThemeCubit.dart';

class TextStyles {
  final ThemeState themeState;

  TextStyles(this.themeState);

  // Example text styles
  TextStyle get titleTextStyle => TextStyle(
      color: themeState.textColor,
      fontFamily: 'Gilroy',
      fontSize: 20,
      letterSpacing: 0 ,
      fontWeight: FontWeight.normal,
      height: 1// Access textColor from themeState
  );

  TextStyle get subtitleTextStyle => TextStyle(
    fontSize: 18,
    color: themeState.textColor, // Access textColor from themeState
  );
  TextStyle get bodyTextStyle => TextStyle(
    fontSize: 16,
    fontFamily: 'Gilroy',
    color: themeState.textColor, // Access textColor from themeState
  );

  TextStyle get buttonTextStyle => TextStyle(
    fontSize: 18,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.bold,
    color: themeState.textColor, // Access textColor from themeState
  );

}