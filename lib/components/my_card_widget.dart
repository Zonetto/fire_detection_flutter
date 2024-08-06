import 'package:fire_detection_app/components/text_widget.dart';
import 'package:fire_detection_app/model/extinguisher_model.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/app_font_size.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:fire_detection_app/utils/responsive_screen.dart';
import 'package:flutter/material.dart';

class MyCardWidget extends StatelessWidget {
  final ExtinguisherModel extinguisher;
  final VoidCallback? onTab;
  const MyCardWidget({
    super.key,
    // required this.status,
    required this.extinguisher,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    final bool status = extinguisher.status;
    final bool isDiscover = extinguisher.isDiscover ?? false;
    String textStatus = extinguisher.status ? "صالحة" : "تحتوي على مشاكل";
    Color counterColor() {
      if (!isDiscover) {
        return status ? AppColor.green : AppColor.red;
      } else {
        return AppColor.grey2;
      }
    }

    Color extinguisherShadowColor() {
      if (!isDiscover) {
        return status ? AppColor.mintGreen : AppColor.lightPeach;
      } else {
        return AppColor.grey;
      }
    }

    String extinguisherImage() {
      if (!isDiscover) {
        return status
            ? GOOD_FIRE_EXTINGUISHER_IMAGE
            : BAD_FIRE_EXTINGUISHER_IMAGE;
      } else {
        return FIRE_EXTINGUISHER_IMAGE;
      }
    }

    double heightSize = !isDiscover ? 0.054 : 0.1;

    return InkWell(
      onTap: onTab,
      child: Card(
        color: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            // First part of the card
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Fire extinguisher info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 18.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: counterColor(),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 3.0,
                        ),
                        child: TextWidget(
                          title: extinguisher.counter.toString(),
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const TextWidget(
                        title: "طفاية",
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                      ),
                      TextWidget(
                        title: extinguisher.name,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSize.textTitle,
                      ),
                    ],
                  ),
                  // Fire extinguisher icon
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        height: Dimensions.screenHeight(context) * 0.106,
                        width: Dimensions.screenHeight(context) * 0.072,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(25.0),
                          ),
                          color: extinguisherShadowColor(),
                        ),
                      ),
                      Container(
                        height: Dimensions.screenHeight(context) * 0.095,
                        width: Dimensions.screenHeight(context) * 0.060,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(25.0),
                          ),
                          color: counterColor(),
                        ),
                        child: Image(
                          image: AssetImage(extinguisherImage()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.screenHeight(context) * heightSize,
            ),
            // Second part of the card
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Image(
                        image: AssetImage(VECTOR_IMAGE),
                        height: 17.0,
                        width: 17.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextWidget(
                          title: extinguisher.gm.toString(),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const TextWidget(
                        title: " غم ",
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Image(
                        image: AssetImage(WIND_SIGN_IMAGE),
                        height: 17.0,
                        width: 17.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextWidget(
                          title: extinguisher.type,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            //  Third part of the card
            const SizedBox(
              height: 25.0,
            ),
            !isDiscover
                ? Container(
                    width: Dimensions.screenWidth(context),
                    alignment: Alignment.center,
                    height: 35.0,
                    margin: const EdgeInsets.only(
                      right: 5.0,
                      left: 5.0,
                    ),
                    decoration: BoxDecoration(
                      color: status ? AppColor.green : AppColor.red,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    child: TextWidget(
                      title: textStatus,
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: AppFontSize.textCardButton,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
