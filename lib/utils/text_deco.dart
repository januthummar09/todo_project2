import 'package:flutter/material.dart';
import 'package:todo_project2/utils/global.dart';

class TextDeco {
  TextStyle textDecoration(
      {double? size, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      color: color ?? Global.bgColor,
      fontSize: size ?? 18,
      fontWeight: fontWeight,
    );
  }
}
