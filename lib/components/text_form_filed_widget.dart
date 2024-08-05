import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:fire_detection_app/utils/typedef.dart';
import 'package:flutter/material.dart';

class TextFormFiledWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType textInputType;
  final ValidCallback? valid;
  final VoidCallback? onPressedPassword;
  final ValidCallback? onChanged;
  final IconData? prefixIcon;
  final int maxLines;
  final int? maxLength;
  final int minLines;
  final bool readOnly;
  final double? width;
  final bool isPassword;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;

  const TextFormFiledWidget({
    super.key,
    required this.controller,
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
  });

  get iconsRed => null;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      onChanged: onChanged,
      validator: valid,
      keyboardType: textInputType,
      decoration: InputDecoration(
          fillColor: AppColor.textFromFieldGrey,
          focusColor: Colors.teal,
          hintText: hintText,
          prefixIcon: Icon(
            prefixIcon,
            color: iconsRed,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(REDUCE)),
            borderSide: BorderSide.none,
          ),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 15)),
      cursorColor: iconsRed,
    );
  }
}
