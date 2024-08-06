import 'package:fire_detection_app/components/radio_widget.dart';
import 'package:fire_detection_app/components/text_widget.dart';
import 'package:fire_detection_app/model/dialog_card_model.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/app_font_size.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:fire_detection_app/utils/typedef.dart';
import 'package:flutter/material.dart';

class CardRadioWidget extends StatelessWidget {
  final DialogCardModel dialogCardList;
  final ValidCallback onChangedFirst;
  final ValidCallback onChangedSecond;
  const CardRadioWidget({
    super.key,
    required this.dialogCardList,
    required this.onChangedFirst,
    required this.onChangedSecond,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
     // margin: const EdgeInsets.only(left: 6, right: 6, bottom: 6),
      color: AppColor.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(REDUCE),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              title: dialogCardList.title,
              fontSize: AppFontSize.textButton,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 5.0),
            RadioWidget(
              title: dialogCardList.firstTitleOption,
              dialogCardList: dialogCardList,
              onChanged: onChangedFirst,
              value: dialogCardList.optionsValue[0],
              selected: dialogCardList.firstOptionStatus,
            ),
            const SizedBox(height: 8.0),
            RadioWidget(
              title: dialogCardList.secondTitleOption,
              dialogCardList: dialogCardList,
              onChanged: onChangedSecond,
              value: dialogCardList.optionsValue[1],
              selected: dialogCardList.secondOptionStatus,
            ),
          ],
        ),
      ),
    );
  }
}
