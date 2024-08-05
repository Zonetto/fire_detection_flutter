import 'package:fire_detection_app/components/text_widget.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:flutter/material.dart';

class MyCardWidget extends StatelessWidget {
  final bool status;
  const MyCardWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          // First part of the card
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fire extinguisher info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 18.0, right: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: status ? AppColor.green : AppColor.iconsRed,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                      vertical: 5.0,
                    ),
                    child: const TextWidget(
                      title: "45",
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                    ),
                    // child: const Text(
                    //   "45",
                    //   style: TextStyle(color: Colors.white),
                    // ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      "طفاية",
                      style: TextStyle(
                        fontFamily: "Avenir",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      "باب القبلة",
                      style: TextStyle(
                        fontFamily: "Avenir",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              // Fire extinguisher icon
              Stack(
                children: [
                  Container(
                    height: 90.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: status ? AppColor.mintGreen : AppColor.lightPeach,
                    ),
                  ),
                  Container(
                    height: 80.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25.0),
                          topRight: Radius.circular(20.0)),
                      color: status ? AppColor.green : AppColor.iconsRed,
                    ),
                    child: status
                        ? const Image(
                            image: AssetImage(GOOD_FIRE_EXTINGUISHER_IMAGE),
                            width: 30.0,
                            height: 30.0,
                          )
                        : Image.asset(BAD_FIRE_EXTINGUISHER_IMAGE),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.050,
          ),
          // Second part of the card
          const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage(VECTOR_IMAGE),
                      height: 17.0,
                      width: 17.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text(" 45 "),
                    ),
                    Text(
                      " غم ",
                      style: TextStyle(
                        fontFamily: "Avenir",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage(WIND_SIGN_IMAGE),
                      height: 17.0,
                      width: 17.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text(
                        "سائل",
                        style: TextStyle(
                          fontFamily: "Avenir",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Third part of the card
          const SizedBox(
            height: 25.0,
          ),
          Container(
            width: double.infinity,
            height: 35.0,
            margin: const EdgeInsets.only(
              right: 5.0,
              left: 5.0,
            ),
            decoration: BoxDecoration(
              color: status ? Colors.green : Colors.red,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: const Center(
              child: Text(
                "صالحة",
                style: TextStyle(
                  fontFamily: "Avenir",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
