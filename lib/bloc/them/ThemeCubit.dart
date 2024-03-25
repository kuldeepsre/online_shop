import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Define the theme state class
// Define the theme state class
// Define the theme state class
// Define the theme state class
class ThemeState {
  final ThemeData themeData;
  final Color backgroundColor;
  final Color SecondaryColor;
  final Color textColor;
  final Color AppBarTextColor;
  final Color iconColor;
  final bool isDarkTheme;
  ThemeState({
    required this.themeData,
    required this.backgroundColor,
    required this.SecondaryColor,
    required this.textColor,
    required this.AppBarTextColor,
    required this.iconColor,
    required this.isDarkTheme,
  });
}

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required bool isDarkTheme})
      : super(ThemeState(
    themeData: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
    backgroundColor: isDarkTheme ?   const Color.fromRGBO(9, 18, 39, 1) : Colors.white,
    SecondaryColor:isDarkTheme?   Color.fromRGBO(16, 27, 54, 1.0) : Color.fromRGBO(16, 27, 54, 1.0),
    textColor: isDarkTheme ? Colors.white : Colors.black ,
    AppBarTextColor: isDarkTheme ? Colors.white :Colors.white,
    iconColor: isDarkTheme ? Colors.white :  Colors.black ,
    isDarkTheme: isDarkTheme,
  ));

  void toggleTheme() {
    final currentState = state;
    final newThemeState = ThemeState(
      themeData:
      currentState.themeData == ThemeData.light() ? ThemeData.dark() : ThemeData.light(),
      backgroundColor: currentState.backgroundColor == Colors.white ? const Color.fromRGBO(9, 18, 39, 1) : Colors.white,
      textColor: currentState.textColor == Colors.black ? Colors.white : Colors.black,
      iconColor: currentState.iconColor == Colors.black ? Colors.white : Colors.black,
      isDarkTheme: !currentState.isDarkTheme,
      SecondaryColor: currentState.textColor == Colors.black? const Color.fromRGBO(9, 18, 39, 1) : Colors.white,
      AppBarTextColor: currentState.textColor == Colors.black?Colors.white : Colors.white,
    );
    emit(newThemeState);
    _saveThemeToStorage(newThemeState.isDarkTheme);
  }

  Future<void> _saveThemeToStorage(bool isDarkTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', isDarkTheme);
  }
}


class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit({required Locale locale}) : super(LanguageState(const Locale('en')));

  // Method to switch to English and save the selected language to storage
  void switchToEnglish() async {
    const newLocale = Locale('en');
    emit(LanguageState(newLocale));
    _saveLanguageToStorage(newLocale);
  }

  // Method to switch to Hindi and save the selected language to storage
  void switchToHindi() async {
    const newLocale = Locale('hi');
    emit(LanguageState(newLocale));
    _saveLanguageToStorage(newLocale);
  }
 void switchToPunjabi() async {
    const newLocale = Locale('pa');
    emit(LanguageState(newLocale));
    _saveLanguageToStorage(newLocale);
  } void switchToGujrati() async {
    const newLocale = Locale('gu');
    emit(LanguageState(newLocale));
    _saveLanguageToStorage(newLocale);
  }

  // Method to switch to German and save the selected language to storage
  void switchToGerman() async {
    const newLocale = Locale('de');
    emit(LanguageState(newLocale));
    _saveLanguageToStorage(newLocale);
  }

  // Method to save the selected language to storage
  Future<void> _saveLanguageToStorage(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);
  //  await prefs.setString('countryCode', locale.countryCode);
  }
}
class LanguageState {
  final Locale locale;

  LanguageState(this.locale);
}