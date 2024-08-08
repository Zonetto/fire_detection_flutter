import 'package:fire_detection_app/utils/app_bar_widget.dart';
import 'package:fire_detection_app/components/my_card_widget.dart';
import 'package:fire_detection_app/components/tap_extinguishers.dart';
import 'package:fire_detection_app/model/extinguisher_model.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/my_alert_dialog.dart';
import 'package:fire_detection_app/utils/responsive_screen.dart';
import 'package:fire_detection_app/utils/s_of.dart';
import 'package:fire_detection_app/view_model/scan_cubit/scan_cubit.dart';
import 'package:fire_detection_app/view_model/scan_cubit/scan_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotDiscoverScreen extends StatefulWidget {
  const NotDiscoverScreen({super.key});

  @override
  State<NotDiscoverScreen> createState() => _NotDiscoverScreenState();
}

class _NotDiscoverScreenState extends State<NotDiscoverScreen> {
  ScanCubit _scanCubit = ScanCubit();

  @override
  void initState() {
    super.initState();
    _scanCubit = context.read<ScanCubit>();
  }

  @override
  Widget build(BuildContext context) {
    List<ExtinguisherModel> extinguishersNotFound = List.generate(
      20,
      (index) {
        return ExtinguisherModel(
          status: index % 2 == 0,
          name: 'طفاية $index',
          gm: index + 45,
          type: 'سائل',
          counter: index + 8,
          isDiscover: true,
        );
      },
    );
    return Scaffold(
      appBar: appBarWidget(
        title: SOf.text(context).firefighters,
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
      body: TabExtinguishers(
        title: SOf.text(context).notDiscover,
        itemCount: extinguishersNotFound.length,
        itemBuilder: (BuildContext context, int index) {
          return MyCardWidget(
            extinguisher: extinguishersNotFound[index],
            onTap: () {
              myAlertDialog(
                barCodeInfo: extinguishersNotFound[index].name,
                context: context,
              );
            },
          );
        },
      ),
    );
  }
}
