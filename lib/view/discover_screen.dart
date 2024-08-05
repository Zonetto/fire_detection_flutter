import 'package:fire_detection_app/components/my_card_widget.dart';
import 'package:fire_detection_app/components/tap_Extinguishers.dart';
import 'package:fire_detection_app/components/text_widget.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/app_font_size.dart';
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
  // Scan scan = Scan();

  //forTest
  List<bool> status = [
    true,
    false,
    true,
    false,
    true,
    true,
    true,
    false,
    false,
    true
  ];

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
      appBar: AppBar(
        toolbarHeight: 70,
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
        backgroundColor: AppColor.white,
        elevation: ELEVATION,
        centerTitle: true,
        shadowColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        title: TextWidget(
          title: SOf.text(context).firefighters,
          fontWeight: FontWeight.bold,
          fontSize: AppFontSize.textAppBar,
          color: AppColor.black,
        ),
        bottom: tabBar(
          controller: _tabController,
          tabs: tabs,
        ),
      ),
      backgroundColor: AppColor.grey,
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: HORIZONTAL),
          child: TabBarView(
            controller: _tabController,
            children: [
              // Extinguishers Found
              TabExtinguishers(
                title: SOf.text(context).extinguishersFound,
                itemCount: status.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyCardWidget(status: status[index]);
                },
              ),
              // Extinguishers Not Found
              TabExtinguishers(
                title: SOf.text(context).extinguishersNotFound,
                itemCount: status.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyCardWidget(status: status[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}






  // appBar: AppBar(
          //   backgroundColor: Colors.white,
          //   title: Text(
          //     "المطافئ",
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontWeight: FontWeight.bold,
          //       fontFamily: "Avenir",
          //     ),
          //   ),
          //   leading: IconButton(
          //     icon: Icon(
          //       Icons.qr_code,
          //       color: Colors.black,
          //     ),
          //     onPressed: () {
          //       //  scan.scanQR(context);
          //     },
          //   ),
          //   centerTitle: true,
          //   bottom: TabBar(
          //     controller: _tabController,
          //     indicator: BoxDecoration(
          //       borderRadius: BorderRadius.circular(14),
          //       color: Colors.red,
          //     ),
          //     tabs: const [
          //       Tab(
          //         child: Text(
          //           "غير موجودة",
          //           style: TextStyle(
          //             color: Colors.black,
          //             fontFamily: "Avenir",
          //           ),
          //         ),
          //         iconMargin: EdgeInsets.only(bottom: 20.0),
          //       ),
          //       Tab(
          //         child: Text(
          //           "موجودة ",
          //           style: TextStyle(
          //             color: Colors.black,
          //             fontFamily: "Avenir",
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),



// Material(
//       color: AppColor.grey,
//       child: DefaultTabController(
//         length: 2,
//         child: Column(
//           children: [
//             TabBar(
//               controller: _tabController,
//               indicator: BoxDecoration(
//                 borderRadius: BorderRadius.circular(14),
//                 color: Colors.red,
//               ),
//               tabs: const [
//                 Tab(
//                   iconMargin: EdgeInsets.only(bottom: 20.0),
//                   child: Text(
//                     "غير موجودة",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontFamily: "Avenir",
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     "موجودة ",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontFamily: "Avenir",
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   //الطفايات  غير الموجودة
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(
//                             top: 15.0, right: 15.0, bottom: 20.0),
//                         child: const Text(
//                           " الطفايات  غير موجودة ",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: "Avenir",
//                               fontSize: 20.0),
//                         ),
//                       ),
//                       Expanded(
//                         child: GridView.builder(
//                           shrinkWrap: true,
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2,
//                                   mainAxisSpacing: 10.0,
//                                   mainAxisExtent: 270.0),
//                           itemCount: status.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return null;

//                             // return MyCard(
//                             //   status: status[index],
//                             // );
//                           },
//                         ),
//                       )
//                     ],
//                   ),
//                   //طفايات موجودة
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(
//                             top: 15.0, right: 15.0, bottom: 20.0),
//                         child: const Text(
//                           " الطفايات الموجودة ",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: "Avenir",
//                               fontSize: 20.0),
//                         ),
//                       ),
//                       Expanded(
//                         child: GridView.builder(
//                           shrinkWrap: true,
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2,
//                                   mainAxisSpacing: 10.0,
//                                   mainAxisExtent: 270.0),
//                           itemCount: 10,
//                           itemBuilder: (BuildContext context, int index) {
//                             return null;

//                             // return MyCard(
//                             //   status: status[index],
//                             // );
//                           },
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );