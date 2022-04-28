import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/widgets/kText.dart';

class BoardingView extends StatefulWidget {
  const BoardingView({Key? key}) : super(key: key);

  @override
  State<BoardingView> createState() => _BoardingViewState();
}

class _BoardingViewState extends State<BoardingView> {
  bool isFab = true;
  late final PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: isFab?Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: FloatingActionButton.extended(
          onPressed: (){
            _pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
          },
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
          ),
          label: const KText(AppString.skip),
        ),
      ):null,
      body: PageView.builder(
          itemCount: 3,
          controller: _pageController,
          onPageChanged: (value){
            if(value<2){
             setState(() {
                isFab = true;
             });
            }else{
              setState(() {
                 isFab = false;
              });
            }
          },
          itemBuilder: (_, index) {
            return Center(child: Text(index.toString()));
          }),
    );
  }
}
