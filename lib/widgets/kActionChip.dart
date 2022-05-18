import 'package:flutter/material.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kText.dart';

class KActionChip extends StatelessWidget {
  final String string;
  final VoidCallback onPressed;
  const KActionChip({Key? key,required this.string,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
        label: Row(
          children: [
            KText(string),
            const Icon(Icons.keyboard_arrow_down_rounded)
          ],
        ),
        backgroundColor: AppColor.blue,
        onPressed: onPressed);
  }
}
