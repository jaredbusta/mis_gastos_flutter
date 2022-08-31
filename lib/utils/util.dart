import 'package:flutter/material.dart';

class Util {
  static int color(String hexColor) {
    return int.parse(hexColor.replaceAll("#", "0xff"));
  }
}
