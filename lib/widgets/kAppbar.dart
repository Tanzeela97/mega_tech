import 'package:flutter/material.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kText.dart';



class KAppBar extends StatelessWidget implements PreferredSizeWidget  {
  final List<Widget>? actions;
  final Widget? title;
  final Widget? leading;
  final bool centerTitle;
  const KAppBar({Key? key,this.actions,this.title,this.centerTitle=true,this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColor.blue,
      centerTitle: centerTitle,
      title: title,
      leading: leading,
      actions: actions
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
