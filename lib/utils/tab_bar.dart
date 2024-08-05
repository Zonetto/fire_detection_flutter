import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/app_font_size.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:flutter/material.dart';

TabBar tabBar({
  TabController? controller,
  required List<Widget> tabs,
}) {
  return TabBar(
    controller: controller,
    labelStyle: TextStyle(
      color: AppColor.white,
      fontWeight: FontWeight.bold,
      fontSize: AppFontSize.textTitle,
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(REDUCE),
      color: AppColor.iconsRed,
    ),
    indicatorPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
    tabs: tabs,
  );
}
