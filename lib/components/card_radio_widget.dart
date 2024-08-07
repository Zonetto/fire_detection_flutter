import 'package:fire_detection_app/components/radio_widget.dart';
import 'package:fire_detection_app/components/text_widget.dart';
import 'package:fire_detection_app/model/dialog_card_model.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/app_font_size.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:fire_detection_app/utils/responsive_screen.dart';
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
    double screenHeight = Dimensions.screenHeight(context);
    double screenWidth = Dimensions.screenWidth(context);
    return Card(
      color: AppColor.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(REDUCE),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenHeight * 0.01,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              title: dialogCardList.title,
              fontSize: AppFontSize.textButton,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: screenHeight * 0.01),
            RadioWidget(
              title: dialogCardList.firstTitleOption,
              dialogCardList: dialogCardList,
              onChanged: onChangedFirst,
              value: dialogCardList.optionsValue[0],
              selected: dialogCardList.firstOptionStatus,
            ),
            SizedBox(height: screenHeight * 0.008),
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
