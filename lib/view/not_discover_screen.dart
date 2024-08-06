import 'package:fire_detection_app/utils/app_bar_widget.dart';
import 'package:fire_detection_app/components/my_card_widget.dart';
import 'package:fire_detection_app/components/tap_extinguishers.dart';
import 'package:fire_detection_app/model/extinguisher_model.dart';
import 'package:fire_detection_app/utils/app_color.dart';
import 'package:fire_detection_app/utils/constant.dart';
import 'package:fire_detection_app/utils/my_alert_dialog.dart';
import 'package:fire_detection_app/utils/s_of.dart';
import 'package:flutter/material.dart';

class NotDiscoverScreen extends StatelessWidget {
  const NotDiscoverScreen({super.key});

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
        child: TabExtinguishers(
          title: SOf.text(context).notDiscover,
          itemCount: extinguishersNotFound.length,
          itemBuilder: (BuildContext context, int index) {
            return MyCardWidget(
              extinguisher: extinguishersNotFound[index],
              onTab: () {
                myAlertDialog(barCodeInfo: extinguishersNotFound[index].name, context: context);
              },
            );
          },
        ),
      ),
    );
  }
}
