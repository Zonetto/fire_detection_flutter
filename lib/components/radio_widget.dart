import 'package:fire_detection_app/model/dialog_card_model.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:fire_detection_app/utils/typedef.dart';
import 'package:flutter/material.dart';

import 'text_widget.dart';

class RadioWidget extends StatelessWidget {
  final String value;
  final String title;
  final DialogCardModel dialogCardList;
  final bool selected;
  final ValidCallback onChanged;
  const RadioWidget({
    super.key,
    required this.value,
    required this.dialogCardList,
    required this.onChanged,
    required this.selected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        height: 50.0,
        child: RadioListTile(
          contentPadding:
              const EdgeInsets.only(right: 10, bottom: 0.0, top: 0.0),
          secondary: TextWidget(
            title: title,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(REDUCE),
          ),
          tileColor: AppColor.grey2.withOpacity(0.5),
          selectedTileColor: AppColor.white,
          activeColor: AppColor.red,
          fillColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              return states.contains(WidgetState.selected)
                  ? AppColor.red
                  : Colors.white;
            },
          ),
          selected: selected,
          value: value,
          groupValue: dialogCardList.groupValue,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
