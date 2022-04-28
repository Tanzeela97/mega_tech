import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/presentation/menu/menu_view.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kText.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;
  ValueNotifier<bool> absorbNotifier = ValueNotifier(false);

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    animation = Tween(begin: 1.0, end: 0.69).animate(animationController);
    animationController.addListener(() {});
    //animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const DrawerScreen(),
          MenuView(
              animationController: animationController, animation: animation),
        ],
      ),
    );
  }
}

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColor.white),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(height: 250, color: AppColor.blue),
          ListTile(
              leading: const Icon(Icons.animation),
              title: const KText(AppString.aboutUs),
              onTap: () {}),
          ListTile(
              leading: const Icon(Icons.privacy_tip_outlined),
              title: const KText(AppString.privacyPolicy),
              onTap: () {}),
          ListTile(
              leading: const Icon(Icons.animation),
              title: const KText(AppString.termAndCondition),
              onTap: () {}),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const KText(AppString.logout),
              onTap: () {}),
        ],
      ),
    );
  }
}
