import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/decorated_drop_down.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kElevatedButton.dart';
import 'package:megatech/widgets/kText.dart';
import 'package:megatech/widgets/kdecoratedField.dart';

import '../../../../widgets/kMultilineTextField.dart';

class Leave extends StatefulWidget {
  const Leave({Key? key}) : super(key: key);

  @override
  State<Leave> createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  ValueNotifier<String> valueNotifier =ValueNotifier('');
  @override
  Widget build(BuildContext context) {

     return Scaffold(
      appBar:const KAppBar(
          title:
          KText(AppString.leaveApplication, color: AppColor.white, fontSize: 28.0)),
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
            const SizedBox(height: 26.0),
            Row(
              children:const [
                Expanded(child: KDecoratedField(label: true, from: true)),
                SizedBox(width: 18.0),
                Expanded(child: KDecoratedField(label: true, from: false)),

              ],
            ),
            const SizedBox(height: 26.0),
            const KMultiLineTextField(title: AppString.reason),
            const SizedBox(height: 26.0),
            KElevatedButton(string: AppString.save,onTap: (){},width: 80.0),
          ],
        ),
      ),
    );
  }
}
