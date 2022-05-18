import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/decorated_drop_down.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kElevatedButton.dart';
import 'package:megatech/widgets/kMultilineTextField.dart';
import 'package:megatech/widgets/kText.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: [
            const SizedBox(height: 100.0),
            Align(
              alignment: Alignment.centerRight,
              child: ActionChip(
                  label: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: KText(AppString.viewAll, color: AppColor.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const _FeedbackListing()));

                  },
                  backgroundColor: AppColor.blue),
            ),
            DecoratedDropDown(
                list: const ['optionOne', 'optionTwo', 'optionThree'],
                valueNotifier: valueNotifier,
                hintText: 'Select Category/Type',
                prefixIcon: const Icon(Icons.widgets_outlined)),
            const SizedBox(height: 26.0),
            const KMultiLineTextField(title: AppString.yourFeedbackHere),
            const SizedBox(
              height: 35,
            ),
            KElevatedButton(
                width: 150, string: AppString.saveFeedback, onTap: () {}),
          ]),
        ),
      ),
    );
  }
}

class _FeedbackListing extends StatelessWidget {
  const _FeedbackListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(AppString.feedback,
              color: AppColor.white, fontSize: 28.0)),
      body: ListView(
        children: [
          for (var i = 0; i < 10; i++)
            Align(
              child: Container(
                height: 125,
                width: 320,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grey),
                    borderRadius: BorderRadius.circular(16.0)),
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(16.0))),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                    children: const [
                                      KText('DATE', color: AppColor.grey),
                                      KText('24-02-2022', enumText: EnumText.bold),
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  )),
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      KText('TIME', color: AppColor.grey),
                                      KText('11 : 30 AM', enumText: EnumText.bold)
                                    ],
                                  ))
                            ],
                          ),
                        )),
                    Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                KText(AppString.feedback.toUpperCase(),
                                    color: AppColor.grey),
                                const KText('lorem is simply dummy text of thelorem is simply dummy text of the printing ', enumText: EnumText.bold),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
