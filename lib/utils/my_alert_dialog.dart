import 'package:fire_detection_app/components/button_elevated_widget.dart';
import 'package:fire_detection_app/components/card_radio_widget.dart';
import 'package:fire_detection_app/components/text_form_filed_widget.dart';
import 'package:fire_detection_app/components/text_widget.dart';
import 'package:fire_detection_app/model/dialog_card_model.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/app_font_size.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:fire_detection_app/utils/responsive_screen.dart';
import 'package:flutter/material.dart';

myAlertDialog({
  required String barCodeInfo,
  required BuildContext context,
}) {
  double getResponsiveHeight(double height) {
    double screenHeight = Dimensions.screenHeight(context);
    return height * (screenHeight / 896.0);
  }

  double getResponsiveFontSize(double fontSize) {
    double screenWidth = Dimensions.screenWidth(context);
    return fontSize * (screenWidth / 414.0);
  }

  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Dialog(
            insetPadding: const EdgeInsets.symmetric(
              horizontal: HORIZONTAL,
              vertical: 20.0,
            ),
            backgroundColor: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: Dimensions.screenHeight(context),
                child: Column(
                  children: [
                    // title
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      child: TextWidget(
                        title: barCodeInfo,
                        fontSize: AppFontSize.textAppBar,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // content
                    SizedBox(
                      width: Dimensions.screenWidth(context),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (getResponsiveFontSize(1) /
                              getResponsiveHeight(1)),
                        ),
                        itemCount: dialogCardList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardRadioWidget(
                            dialogCardList: dialogCardList[index],
                            onChangedFirst: (String? value) {
                              setState(() {
                                dialogCardList[index].groupValue = value ?? '';
                                dialogCardList[index].firstOptionStatus = true;
                                dialogCardList[index].secondOptionStatus =
                                    false;
                              });
                              return null;
                            },
                            onChangedSecond: (String? value) {
                              setState(() {
                                dialogCardList[index].groupValue = value ?? '';
                                dialogCardList[index].firstOptionStatus = false;
                                dialogCardList[index].secondOptionStatus = true;
                              });
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    const TextFormFiledWidget(
                      textInputType: TextInputType.text,
                      hintText: "ملاحظات",
                      prefixIcon: Icons.note,
                      maxLines: 10,
                      minLines: 5,
                      prefixIconColor: AppColor.grey3,
                      marginBottom: 90.0,
                      maxLength: 200,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonElevatedWidget(
                          title: "إرسال",
                          onPressed: () {},
                        ),
                        ButtonElevatedWidget(
                          title: "الغاء",
                          onPressed: () {},
                          backgroundColor: AppColor.white,
                          textColor: AppColor.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
