import 'package:flutter/material.dart';

import '../app_sizes.dart';
import '../colors/app_color_scheme.dart';
import '../text/app_text_scheme.dart';


/// Class of the app themes data.
abstract class AppThemeData {
  const AppThemeData._();

  /// Dark theme configuration.
  static final lightTheme = ThemeData(
    extensions: [
      _lightColorScheme,
      AppTextScheme.base(_lightColorScheme.onSurface),
    ],
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _lightColorScheme.primary,
      onPrimary: _lightColorScheme.onPrimary,
      secondary: _lightColorScheme.secondary,
      onSecondary: _lightColorScheme.onSecondary,
      error: _lightColorScheme.danger,
      onError: _lightColorScheme.onDanger,
      background: _lightColorScheme.background,
      onBackground: _lightColorScheme.onBackground,
      surface: _lightColorScheme.background,
      onSurface: _lightColorScheme.onSurface,
    ),
    textTheme: TextTheme(
      // Text field text style
      bodyLarge: AppTextScheme.base()
          .regular24
          .copyWith(color: _lightColorScheme.textField, height: 33 / 24),
    ),
    scaffoldBackgroundColor: _lightColorScheme.background,
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.primary,
      elevation: AppSizes.double0,
      iconTheme: IconThemeData(
        color: _lightColorScheme.onPrimary,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _lightColorScheme.background,
      selectedItemColor: _lightColorScheme.primary,
      unselectedItemColor: _lightColorScheme.onBackground,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _lightColorScheme.primary,
      contentTextStyle: TextStyle(
        color: _lightColorScheme.onPrimary,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: _lightColorScheme.frameTextFieldSecondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.fromLTRB(25, 17, 25, 17),
      fillColor: _lightColorScheme.surface,
      hintStyle: AppTextScheme.base().regular24.copyWith(color: _lightColorScheme.textFieldLabel),
      labelStyle: AppTextScheme.base().regular24.copyWith(color: _lightColorScheme.textFieldLabel),
      floatingLabelStyle: AppTextScheme.base().regular16.copyWith(
        color: _lightColorScheme.textFieldLabel,
        fontSize: 18,
      ),
      errorStyle: AppTextScheme.base().regular16.copyWith(
        color: _lightColorScheme.danger,
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSizes.double16),
      ),
    ),
  );

  static final _lightColorScheme = AppColorScheme.light();
}
