import 'package:flutter/material.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kText.dart';

class KElevatedButton extends StatelessWidget {
  final double width;

  final String string;
  final VoidCallback? onTap;

  const KElevatedButton(
      {Key? key, this.width = 320, required this.string, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ))),
          onPressed: onTap,
          child: KText(
            string,
            fontSize: 18,
            color: AppColor.white,
            enumText: EnumText.bold,
          )),
    );
  }
}
