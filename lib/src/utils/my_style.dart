import 'package:flutter/material.dart';
import 'package:mi_credencial/src/utils/my_colors.dart';

class MyFontWeight {
  static FontWeight light = FontWeight.w400;
  static FontWeight regular = FontWeight.w500;
  static FontWeight normal = FontWeight.w600;
  static FontWeight semiBold = FontWeight.bold;
  static FontWeight bold = FontWeight.w800;
  static FontWeight extraBold = FontWeight.w900;
}

class MyStyles {
  static TextStyle black18Light = TextStyle(
    color: MyColors.black,
    fontSize: 18,
    fontWeight: MyFontWeight.light,
  );
  static TextStyle black15Light = TextStyle(
    color: MyColors.black,
    fontSize: 15,
    fontWeight: MyFontWeight.light,
  );
  static TextStyle black15Regular = TextStyle(
    color: MyColors.black,
    fontSize: 15,
    fontWeight: MyFontWeight.regular,
  );
  static TextStyle gray15Light = TextStyle(
    color: MyColors.hintClr,
    fontSize: 15,
    fontWeight: MyFontWeight.light,
  );
  static TextStyle gray15Small = TextStyle(
    color: MyColors.grayClr,
    fontSize: 15,
    fontWeight: FontWeight.w300,
  );
  static TextStyle white20Normal = TextStyle(
    color: MyColors.white,
    fontSize: 20,
    fontWeight: MyFontWeight.normal,
  );
  static TextStyle black22Normal = TextStyle(
    color: MyColors.black,
    fontSize: 22,
    fontWeight: MyFontWeight.normal,
  );
  static TextStyle black20Regular = TextStyle(
    color: MyColors.black,
    fontSize: 20,
    fontWeight: MyFontWeight.regular,
  );
  static TextStyle black25Normal = TextStyle(
    color: MyColors.black,
    fontSize: 25,
    fontWeight: MyFontWeight.normal,
  );
  static TextStyle black18Regular = TextStyle(
    color: MyColors.black,
    fontSize: 18,
    fontWeight: MyFontWeight.regular,
  );
  static TextStyle blue15Light = TextStyle(
    color: MyColors.themeClr,
    fontSize: 15,
    fontWeight: MyFontWeight.light,
  );
  static TextStyle blue18Light = TextStyle(
    color: MyColors.themeClr,
    fontSize: 18,
    fontWeight: MyFontWeight.light,
  );
}
