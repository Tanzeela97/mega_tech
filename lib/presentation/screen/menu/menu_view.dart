import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/presentation/screen/menu/demo_view/demo_view.dart';
import 'package:megatech/presentation/screen/menu/home_view/home_view.dart';
import 'package:megatech/presentation/screen/menu/setting_view/settting_view.dart';
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
  final ValueNotifier<int> indexNotifier = ValueNotifier(1);

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
            appBar: KAppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      widget.animationController.forward();
                    },
                    icon: const Image(image: ImageString.menu)),
              ],
              centerTitle: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:const  [
                  KText('Lorem Ipsumn',color: AppColor.white,textAlign: TextAlign.start),
                  KText('sss-7777-toyota',color: AppColor.white,textAlign: TextAlign.start),
                ],
              ),
              leading: Align(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person,size: 40),
                ),
              ),
            ),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(canvasColor: AppColor.blue),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.phonelink_setup_outlined, size: 24.0),
                      label: AppString.demo),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined, size: 24.0),
                      label: AppString.home),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined, size: 24.0),
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
