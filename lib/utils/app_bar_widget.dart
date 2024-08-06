import 'package:fire_detection_app/components/text_widget.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/app_font_size.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:flutter/material.dart';

AppBar appBarWidget({
  required String title,
  PreferredSizeWidget? bottom,
  List<Widget>? actions,
}) {
  return AppBar(
    toolbarHeight: 70,
    actions: actions,
    backgroundColor: AppColor.white,
    elevation: ELEVATION,
    centerTitle: true,
    shadowColor: AppColor.white,
    surfaceTintColor: AppColor.white,
    title: TextWidget(
      title: title,
      fontWeight: FontWeight.bold,
      fontSize: AppFontSize.textAppBar,
      color: AppColor.black,
    ),
    bottom: bottom,
  );
}
