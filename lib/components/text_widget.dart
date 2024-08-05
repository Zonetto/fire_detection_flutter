import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final double? fontSize;
  final double? height;
  final TextAlign alignment;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? fontFamily;
  final TextTheme? textStyle;

  const TextWidget({
    super.key,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.color = AppColor.black,
    this.alignment = TextAlign.right,
    this.maxLines,
    this.overflow,
    this.height,
    this.fontFamily = FONT_FAMILY,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: alignment,
      overflow: overflow,
      title,
      maxLines: maxLines,
      style: TextStyle(
        height: height,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
