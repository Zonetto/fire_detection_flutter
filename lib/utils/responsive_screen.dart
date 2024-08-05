import 'package:flutter/material.dart';

class Dimensions {
  static double screenHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;
  static double screenWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;
  static double? fontSize(BuildContext context, double? percentage) {
    if (percentage != null) {
      return screenHeight(context) * (percentage) / 100;
    }
    return null;
  }
}
