import 'package:fire_detection_app/utils/app_bar_widget.dart';
import 'package:fire_detection_app/components/my_card_widget.dart';
import 'package:fire_detection_app/components/tap_Extinguishers.dart';
import 'package:fire_detection_app/model/extinguisher_model.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:fire_detection_app/utils/s_of.dart';
import 'package:fire_detection_app/utils/tab_bar.dart';
import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  // Fill List
  List<ExtinguisherModel> extinguishersFound = List.generate(
    20,
    (index) {
      return ExtinguisherModel(
        status: index % 2 == 0, // Alternate status between true and false
        name: 'طفاية $index',
        gm: index + 45,
        type: 'سائل',
        counter: index + 8,
        isDiscover: false,
      );
    },
  );
  List<ExtinguisherModel> extinguishersNotFound = List.generate(
    20,
    (index) {
      return ExtinguisherModel(
        status: index % 2 == 0, // Alternate status between true and false
        name: 'طفاية $index',
        gm: index + 45,
        type: 'سائل',
        counter: index + 8,
        isDiscover: index % 2 == 1,
      );
    },
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [
      Tab(
        height: 60,
        text: SOf.text(context).found,
      ),
      Tab(
        height: 60,
        text: SOf.text(context).notFound,
      ),
    ];
    return Scaffold(
      appBar: appBarWidget(
        title: SOf.text(context).firefighters,
        bottom: tabBar(
          controller: _tabController,
          tabs: tabs,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.qr_code,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              //  scan.scanQR(context);
            },
          ),
        ],
      ),
      backgroundColor: AppColor.grey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: HORIZONTAL),
        child: TabBarView(
          controller: _tabController,
          children: [
            // Extinguishers Found
            TabExtinguishers(
              title: SOf.text(context).extinguishersFound,
              itemCount: extinguishersFound.length,
              itemBuilder: (BuildContext context, int index) {
                return MyCardWidget(
                  extinguisher: extinguishersFound[index],
                );
              },
            ),
            // Extinguishers Not Found
            TabExtinguishers(
              title: SOf.text(context).extinguishersNotFound,
              itemCount: extinguishersFound.length,
              itemBuilder: (BuildContext context, int index) {
                return MyCardWidget(
                  extinguisher: extinguishersNotFound[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
