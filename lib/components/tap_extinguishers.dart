import 'package:fire_detection_app/components/text_widget.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/app_font_size.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:fire_detection_app/utils/responsive_screen.dart';
import 'package:fire_detection_app/utils/typedef.dart';
import 'package:flutter/material.dart';

class TabExtinguishers extends StatelessWidget {
  final String title;
  final int itemCount;
  final ItemBuilderCallback itemBuilder;
  const TabExtinguishers({
    super.key,
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
              vertical: 20, horizontal: HORIZONTAL + 2),
          child: TextWidget(
            title: title,
            fontSize: AppFontSize.textTitle,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
        ),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: Dimensions.screenWidth(context) * 0.01,
              crossAxisSpacing: Dimensions.screenWidth(context) * 0.01,
              mainAxisExtent: 250,
            ),
            padding: const EdgeInsets.symmetric(horizontal: HORIZONTAL),
            itemCount: itemCount,
            itemBuilder: itemBuilder,
          ),
        )
      ],
    );
  }
}
