import 'package:fire_detection_app/utils/app_bar_widget.dart';
import 'package:fire_detection_app/components/my_card_widget.dart';
import 'package:fire_detection_app/components/tap_Extinguishers.dart';
import 'package:fire_detection_app/model/extinguisher_model.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/my_alert_dialog.dart';
import 'package:fire_detection_app/utils/responsive_screen.dart';
import 'package:fire_detection_app/utils/s_of.dart';
import 'package:fire_detection_app/utils/tab_bar.dart';
import 'package:fire_detection_app/view_model/scan_cubit/scan_cubit.dart';
import 'package:fire_detection_app/view_model/scan_cubit/scan_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    3,
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
  ScanCubit _scanCubit = ScanCubit();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scanCubit = context.read<ScanCubit>();
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
          BlocListener<ScanCubit, ScanState>(
            listener: (context, state) {
              if (state is ScanSuccessfulState) {
                myAlertDialog(
                  context: context,
                  barCodeInfo: state.barcodeScanRes,
                );
              }
            },
            child: IconButton(
              icon: Icon(
                Icons.qr_code,
                color: Colors.black,
                size: Dimensions.screenHeight(context) * 0.045,
              ),
              onPressed: () {
                _scanCubit.qr(context);
              },
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.grey,
      body: TabBarView(
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
    );
  }
}
