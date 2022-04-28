import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/presentation/menu/demo_view/demo_view.dart';
import 'package:megatech/presentation/menu/home_view/home_view.dart';
import 'package:megatech/presentation/menu/setting_view/settting_view.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kText.dart';

class MenuView extends StatefulWidget {
  final AnimationController animationController;
  final Animation<double> animation;

  const MenuView(
      {Key? key, required this.animationController, required this.animation})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MenuView> {
  final ValueNotifier<int> indexNotifier = ValueNotifier(0);

  @override
  void dispose() {
    indexNotifier.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    indexNotifier.value = index;
  }

  // bool _toggle = false;
  //
  // void toggle() {
  //   setState(() {
  //     _toggle = !_toggle;
  //   });
  // }

  // static bool appbarDecider(int value) =>
  //     EnumAppBar.values[value] == EnumAppBar.findHome;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (_, child) {
        return Transform(
          transform: Matrix4.translationValues(
              (1 - widget.animation.value) * 650,
              (1 - widget.animation.value) * 450,
              0)
            ..scale(widget.animation.value),
          child: child,
        );
      },
      child: ValueListenableBuilder<int>(
        valueListenable: indexNotifier,
        builder: (context, value, child) => Scaffold(
            appBar: KAppBar(actions: [
              IconButton(onPressed: (){}, icon: const Image(image: ImageString.menu)),
            ]),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(canvasColor: AppColor.blue),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Image(image: ImageString.demo, height: 24),
                      label: AppString.demo),
                  BottomNavigationBarItem(
                      icon: Image(image: ImageString.home, height: 24),
                      label: AppString.home),
                  BottomNavigationBarItem(
                      icon: Image(image: ImageString.setting, height: 24),
                      label: AppString.setting),
                ],
                currentIndex: value,
                selectedItemColor: AppColor.white,
                unselectedItemColor: AppColor.white,
                onTap: _onItemTapped,
              ),
            ),
            body: <Widget>[
              const Demo(),
              const Home(),
              const Setting(),
            ].elementAt(value)),
      ),
    );
  }
}

//enum EnumAppBar { Demo, Home, Setting, Logout }
