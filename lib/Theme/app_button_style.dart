import 'package:flutter/material.dart';
import 'package:move_demo/Theme/app_colors.dart';

abstract class AppButtonStyle {
  static final a = ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(AppColors.mainDarkBlue),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700)),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 15, vertical: 8)));

  static final linkButton = ButtonStyle(
      foregroundColor:
          MaterialStateProperty.all(const Color.fromRGBO(1, 180, 228, 1)),
      textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 15, vertical: 8)));

}
