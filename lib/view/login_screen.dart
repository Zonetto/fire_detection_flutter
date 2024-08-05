import 'package:fire_detection_app/components/button_elevated_widget.dart';
import 'package:fire_detection_app/components/text_form_filed_widget.dart';
import 'package:fire_detection_app/components/text_widget.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/app_font_size.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:fire_detection_app/utils/responsive_screen.dart';
import 'package:fire_detection_app/utils/s_of.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController _jopNumberController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: Dimensions.screenHeight(context) / 1.8,
                  width: Dimensions.screenWidth(context),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(IMAGE_PATH_FIRE),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        title: SOf.text(context).civilDefenseDivision,
                        color: AppColor.textWhite,
                        fontSize: AppFontSize.textTitle,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // const Spacer(),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: HORIZONTAL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      title: SOf.text(context).login,
                      color: AppColor.textBlack,
                      fontSize: AppFontSize.textTitle,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 30.0),
                    TextFormFiledWidget(
                      controller: _jopNumberController,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      hintText: SOf.text(context).jobNumber,
                      prefixIcon: Icons.badge,
                    ),
                    const SizedBox(height: 15.0),
                    TextFormFiledWidget(
                      controller: _jopNumberController,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      hintText: SOf.text(context).pass,
                      prefixIcon: Icons.password,
                    ),
                    const SizedBox(height: 30.0),
                    Center(
                      child: Column(
                        children: [
                          ButtonElevatedWidget(
                            onPressed: () {},
                            title: SOf.text(context).login,
                            height: 50,
                            width: 145,
                          ),
                          const SizedBox(height: 30.0),
                          TextWidget(
                            title: SOf.text(context).reserved,
                            color: AppColor.textBlack,
                            fontSize: AppFontSize.textTitle2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}