import 'package:fire_detection_app/components/text_widget.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/app_font_size.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:fire_detection_app/utils/s_of.dart';
import 'package:fire_detection_app/view/discover_screen.dart';
import 'package:fire_detection_app/view/not_discover_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const DiscoverScreen(),
      const NotDiscoverScreen(),
    ];
    // final List<String> screenTitle = [
    //   SOf.text(context).discover,
    //   SOf.text(context).notDiscover,
    // ];
    const TextStyle style = TextStyle(
      fontFamily: FONT_FAMILY,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       icon: const Icon(
      //         Icons.qr_code,
      //         color: Colors.black,
      //         size: 30,
      //       ),
      //       onPressed: () {
      //         //  scan.scanQR(context);
      //       },
      //     ),
      //   ],
      //   backgroundColor: AppColor.white,
      //   elevation: ELEVATION,
      //   centerTitle: true,
      //   shadowColor: AppColor.white,
      //   surfaceTintColor: AppColor.white,
      //   title: TextWidget(
      //     title: SOf.text(context).firefighters,
      //     fontWeight: FontWeight.bold,
      //     fontSize: AppFontSize.textAppBar,
      //     color: AppColor.black,
      //   ),
      // ),
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: ELEVATION,
        currentIndex: _selectedIndex,
        onTap: (int index) => _onItemTapped(index),
        selectedItemColor: AppColor.iconsRed,
        unselectedItemColor: AppColor.grey2,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: style,
        unselectedLabelStyle: style,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0
                  ? Icons.check_circle
                  : Icons.check_circle_outline,
              size: 30,
            ),
            label: SOf.text(context).discover,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _selectedIndex == 1
                  ? FIRE_EXTINGUISHER_SHARP_IMAGE
                  : FIRE_EXTINGUISHER_NO_SHARP_IMAGE,
            ),
            label: SOf.text(context).notDiscover,
          ),
        ],
      ),
    );
  }
}
