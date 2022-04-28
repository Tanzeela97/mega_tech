import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kText.dart';

class KElevatedButton extends StatelessWidget {
  final double width;
  final String string;
  const KElevatedButton({Key? key,this.width=230,required this.string}) : super(key: key);

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
          onPressed: () {},
          child:  KText(
            string,
            color: AppColor.white,
            enumText: EnumText.bold,
          )),
    );
  }
}
