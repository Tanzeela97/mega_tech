import 'dart:async';

import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/constant/route_string.dart';
import 'package:megatech/navigation/route_aware.dart';
import 'package:megatech/navigation/route_generator.dart';
import 'package:megatech/theme/app_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    scheduleMicrotask((){
      precacheImage(ImageString.splash, context);
      precacheImage(ImageString.logo, context);
      precacheImage(ImageString.demo, context);
      precacheImage(ImageString.home, context);
      precacheImage(ImageString.setting, context);
      precacheImage(ImageString.menu, context);
      precacheImage(ImageString.fuelManagement, context);

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 380,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(380, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: '4K'),
        ],
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteString.initial,
      title: AppString.megaTech,
      theme: AppTheme.mainTheme,

      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorObservers: [
        RouteObservers.routeObserver,
      ],
    );
  }
}
