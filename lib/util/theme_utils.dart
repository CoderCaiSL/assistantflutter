import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assistantflutter/app_theme.dart';

class ThemeUtils {

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color getCellColor(BuildContext context) {
    return isDark(context) ? AppTheme.dark_cell_color : AppTheme.cell_color;
  }

  static Color getDialogColor(BuildContext context) {
    return isDark(context) ? AppTheme.dark_bg_color : AppTheme.bg_white;
  }

  static Color getInputBgColor(BuildContext context) {
    return isDark(context) ? AppTheme.dark_input_bg_color : AppTheme.input_bg_color;
  }


  static Color getBgBlackColor(BuildContext context) {
    return isDark(context) ? AppTheme.bg_black : AppTheme.bg_black;
  }

  static Color getDarkColor(BuildContext context, Color darkColor) {
    return isDark(context) ? darkColor : null;
  }

  static Color getIconColor(BuildContext context) {
    return isDark(context) ? Colors.white : Colors.black;
  }

  static Color getBtnCancelColor(BuildContext context) {
    return isDark(context) ? AppTheme.text_gray : AppTheme.text_gray_c;
  }

  static Color getStickyHeaderColor(BuildContext context) {
    return isDark(context) ? AppTheme.dark_bg_gray_ : AppTheme.bg_gray_;
  }

  static Color getDialogTextFieldColor(BuildContext context) {
    return isDark(context) ? AppTheme.dark_bg_gray_ : AppTheme.bg_gray;
  }

  static Color getKeyboardActionsColor(BuildContext context) {
    return isDark(context) ? AppTheme.dark_bg_color : Colors.grey[200];
  }

  /// 设置NavigationBar样式
  static void setSystemNavigationBarStyle(BuildContext context, ThemeMode mode) {
    /// 仅针对安卓
    if (Platform.isAndroid) {
      bool _isDark = false;
      final ui.Brightness platformBrightness = MediaQuery.platformBrightnessOf(context);
      print(platformBrightness);
      if (mode == ThemeMode.dark || (mode == ThemeMode.system && platformBrightness == ui.Brightness.dark)) {
        _isDark = true;
      }
      print(_isDark);
      final SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: _isDark ? AppTheme.dark_bg_color : Colors.white,
        systemNavigationBarIconBrightness: _isDark ? Brightness.light : Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}

extension ThemeExtension on BuildContext {
  bool get isDark => ThemeUtils.isDark(this);
  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get dialogBackgroundColor => Theme.of(this).canvasColor;
}