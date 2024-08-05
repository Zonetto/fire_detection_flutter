import 'package:fire_detection_app/components/text_widget.dart';
import 'package:flutter/material.dart';

class NotDiscoverScreen extends StatelessWidget {
  const NotDiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          TextWidget(title: "NotDiscoverScreen"),
        ],
      ),
    );
  }
}
