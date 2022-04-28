import 'package:flutter/material.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kText.dart';



class KAppBar extends StatelessWidget implements PreferredSizeWidget  {
  final List<Widget>? actions;
  final Widget? title;
  const KAppBar({Key? key,this.actions,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColor.blue,
      centerTitle: true,
      title: title,
      // leading: Align(
      //   child: Container(
      //     height: 45,
      //     decoration: BoxDecoration(
      //       color: Colors.grey[200],
      //       shape: BoxShape.circle,
      //     ),
      //     child: const Icon(Icons.person,size: 40),
      //   ),
      // ),
      // title: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     KText('Lorem Ipsumn',color: AppColor.white,textAlign: TextAlign.start),
      //     KText('sss-7777-toyota',color: AppColor.white,textAlign: TextAlign.start),
      //   ],
      // ),
      actions: actions
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
