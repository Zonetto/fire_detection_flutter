import 'package:fire_detection_app/components/text_widget.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/app_font_size.dart';
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
          margin: const EdgeInsets.only(top: 15.0, right: 15.0, bottom: 20.0),
          child: TextWidget(
            title: title,
            fontSize: AppFontSize.textTitle,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              mainAxisExtent: 270.0,
            ),
            itemCount: itemCount,
            itemBuilder: itemBuilder,
          ),
        )
      ],
    );
  }
}
