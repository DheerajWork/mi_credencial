import 'package:flutter/material.dart';
import 'package:mi_credencial/src/utils/my_colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(),

    //for fonts
    hintColor: MyColors.white,

    //for scaffold bg
    scaffoldBackgroundColor: MyColors.black,

    //for aapBar
    appBarTheme: AppBarTheme(color: MyColors.black),

    //for grey
    canvasColor: MyColors.white,

    //container bg
    cardColor: MyColors.grayClr.withOpacity(0.2),

    //bottom sheet bg
    bottomAppBarColor: const Color(0xff282828),

    primaryColor: const Color(0xffCAA6FF)

  );

  static final lightTheme = ThemeData(
      buttonTheme: ButtonThemeData(buttonColor: MyColors.bgClr),
      colorScheme: const ColorScheme.light(),

      //for fonts
      hintColor: MyColors.black,

      //for scaffold bg
      scaffoldBackgroundColor: MyColors.white,

      //for aapBar
    appBarTheme: AppBarTheme(color: MyColors.white),

      //for grey
      canvasColor: MyColors.grayClr,

      //container bg
      cardColor: MyColors.grayBg,

      //bottom sheet bg
      bottomAppBarColor: MyColors.white,

      primaryColor: MyColors.themeClr
  );
}
