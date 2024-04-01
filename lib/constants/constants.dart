import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();
  static const String title = "Pokedex";

  static TextStyle getTitleTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSized(48),
    );
  }

  static TextStyle getPokemonNameTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSized(24),
    );
  }

  static TextStyle getTypeChipTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: _calculateFontSized(20),
    );
  }

  static double _calculateFontSized(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 4 / 5).sp;
    }
  }

  static getPokeInfoLabelTextStyle() {
    return TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
  }

  static getPokeInfoTextStyle() {
    return TextStyle(fontSize: 16, color: Colors.black);
  }
}
