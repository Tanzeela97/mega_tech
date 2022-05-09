import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/decorated_drop_down.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kMultilineTextField.dart';
import 'package:megatech/widgets/kText.dart';
import 'package:megatech/widgets/kdecoratedField.dart';


class PreInfo extends StatefulWidget {
  const PreInfo({Key? key}) : super(key: key);

  @override
  State<PreInfo> createState() => _PreInfoState();
}

class _PreInfoState extends State<PreInfo> {
  ValueNotifier<String> valueNotifier =ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const KAppBar(
          title:
          KText(AppString.preInfo, color: AppColor.white, fontSize: 28.0)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 26.0),
            DecoratedDropDown(
                list: const ['optionOne', 'optionTwo', 'optionThree'],
                valueNotifier: valueNotifier,
                hintText: 'Select Category/Type',
                prefixIcon: const Icon(Icons.category)),
            Row(
              children:const [
                 Expanded(child: KDecoratedField(label: true, from: false)),
                 SizedBox(width: 18.0),
                 Expanded(child: KDecoratedField(label: false, from: true)),

              ],
            ),
            Row(
              children:const [
                Expanded(child: KDecoratedField(label: true, from: true)),
                SizedBox(width: 18.0),
                Expanded(child: KDecoratedField(label: false, from: true)),

              ],
            ),
            const KMultiLineTextField(title: AppString.infoRemarks),
          ],
        ),
      ),
    );
  }
}
