import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/decorated_drop_down.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kElevatedButton.dart';
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
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: AppColor.lightBlue)),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.message_outlined),
                    SizedBox(width: 13.0),
                    KText(AppString.yourFeedbackHere)
                  ],
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 18.0),
                    //filled: true,
                    //border: const OutlineInputBorder(),
                    border: InputBorder.none,
                    fillColor: Colors.grey[200],
                    hintText: 'message',
                  ),
                ),
              ],
            ),
          ),
          KElevatedButton(
              width: 130, string: AppString.saveFeedback, onTap: () {}),
        ]),
      ),
    );
  }
}
