import 'package:flutter/material.dart';

Future<void> navigatePushScreen({
  required BuildContext context,
  required Widget screen,
}) async {
  await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

Future<void> navigatePushReplacementScreen({
  required BuildContext context,
  required Widget screen,
}) async {
  await Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}
