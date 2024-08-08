import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:fire_detection_app/utils/responsive_screen.dart';
import 'package:fire_detection_app/utils/typedef.dart';
import 'package:flutter/material.dart';

class TextFormFiledWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType textInputType;
  final ValidCallback? valid;
  final VoidCallback? onPressedPassword;
  final ValidCallback? onChanged;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final int maxLines;
  final int? maxLength;
  final int minLines;
  final bool readOnly;
  final double? width;
  final double? marginBottom;
  final bool isPassword;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;

  const TextFormFiledWidget({
    super.key,
    this.controller,
    this.hintText,
    required this.textInputType,
    this.valid,
    this.onChanged,
    this.maxLines = 1,
    this.minLines = 1,
    this.readOnly = false,
    this.width,
    this.maxLength,
    this.isPassword = false,
    this.onPressedPassword,
    this.obscureText = false,
    this.prefixIcon,
    this.textInputAction,
    this.textDirection,
    this.prefixIconColor = AppColor.red,
    this.marginBottom = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final double heightDimension = Dimensions.screenHeight(context);
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      onChanged: onChanged,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      validator: valid,
      keyboardType: textInputType,
      decoration: InputDecoration(
        fillColor: AppColor.grey,
        focusColor: Colors.teal,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: FONT_FAMILY,
          fontSize: MediaQuery.textScalerOf(context).scale(14),
        ),
        prefixIcon: Container(
          margin: EdgeInsets.only(bottom: marginBottom ?? 0.0),
          child: Icon(
            prefixIcon,
            color: prefixIconColor,
            size: heightDimension * 0.03,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(REDUCE)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(REDUCE)),
          borderSide: BorderSide(color: AppColor.grey2),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(REDUCE)),
          borderSide: BorderSide(color: AppColor.red),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(REDUCE)),
          borderSide: BorderSide(color: AppColor.grey2),
        ),
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: heightDimension * 0.018,
        ),
      ),
      cursorColor: AppColor.red,
    );
  }
}
