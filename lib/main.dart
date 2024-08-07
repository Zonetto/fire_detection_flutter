// ignore: depend_on_referenced_packages
import 'package:device_preview/device_preview.dart';
import 'package:fire_detection_app/generated/l10n.dart';
import 'package:fire_detection_app/view/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

import 'utils/constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MainApp(), // Wrap your app
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      locale: const Locale(LANGUAGE),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: S.delegate.supportedLocales,
      home: const LoginScreen(),
    );
  }
}
