import 'package:fire_detection_app/components/text_widget.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:fire_detection_app/utils/responsive_screen.dart';
import 'package:flutter/material.dart';

class ButtonElevatedWidget extends StatelessWidget {
  final Color? borderSideColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? height;
  final String title;
  final VoidCallback onPressed;
  final double? width;

  const ButtonElevatedWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderSideColor = AppColor.iconsRed,
    this.backgroundColor = Colors.white,
    this.foregroundColor = AppColor.iconsRed,
    this.height = 44,
    this.width,
  });

  get textButton => null;

  @override
  Widget build(BuildContext context) {
    final double widthDimension = Dimensions.screenWidth(context);
    return SizedBox(
      height: height,
      width: width ?? widthDimension,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.iconsRed,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(REDUCE),
            ),
          ),
        ),
        onPressed: onPressed,
        child: TextWidget(
          fontSize: textButton,
          title: title,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
