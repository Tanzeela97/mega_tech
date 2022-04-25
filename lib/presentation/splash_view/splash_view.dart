import 'package:flutter/material.dart';
import 'package:megatech/widgets/ktext.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: KText('Splash View'),
      ),
    );
  }
}
