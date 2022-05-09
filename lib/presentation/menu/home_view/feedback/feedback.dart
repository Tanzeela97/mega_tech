import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/decorated_drop_down.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kElevatedButton.dart';
import 'package:megatech/widgets/kMultilineTextField.dart';
import 'package:megatech/widgets/kText.dart';
import 'package:megatech/widgets/kdecoratedField.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final ValueNotifier<String> valueNotifier = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title:
              KText(AppString.feedback, color: AppColor.white, fontSize: 28.0)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(children: [
          const SizedBox(height: 26.0),
          Align(
            alignment: Alignment.centerRight,
            child: ActionChip(
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: KText(AppString.viewAll, color: AppColor.white),
                ),
                onPressed: () {},
                backgroundColor: AppColor.blue),
          ),
          DecoratedDropDown(
              list: const ['optionOne', 'optionTwo', 'optionThree'],
              valueNotifier: valueNotifier,
              hintText: 'Select Category/Type',
              prefixIcon: const Icon(Icons.category)),
          const SizedBox(height: 26.0),
          const KMultiLineTextField(title: AppString.yourFeedbackHere),
          KElevatedButton(
              width: 130, string: AppString.saveFeedback, onTap: () {}),
        ]),
      ),
    );
  }
}
