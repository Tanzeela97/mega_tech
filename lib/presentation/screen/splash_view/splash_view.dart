import 'dart:async';

import 'package:flutter/material.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/constant/route_string.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 10),
            () =>Navigator.pushReplacementNamed(context, RouteString.boarding));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:Image(image: ImageString.splash),
      ),
    );
  }
}
