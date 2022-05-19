import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kActionChip.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kText.dart';

class ViolationReport extends StatefulWidget {
  const ViolationReport({Key? key}) : super(key: key);

  @override
  State<ViolationReport> createState() => _ViolationReportState();
}

class _ViolationReportState extends State<ViolationReport> {
  static const _heightBox = SizedBox(height: 20);
  static const _widthBox = SizedBox(width: 10);
  static const List<String> option = [
    'Full Month',
    'Week 1',
    'Week 2',
    'Week 3',
    'Week 4'
  ];
  final ValueNotifier<int> trackOption = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(AppString.violationReport,
              color: AppColor.white, fontSize: 28.0)),
      body: Padding(
        padding: const EdgeInsets.only(top: 26, right: 16.0, left: 16.0),
        child: Row(
          children: [
            KActionChip(string: 'Jan 2022', onPressed: () {}),
            Spacer(),
            KActionChip(
                string: 'Full Month',
                onPressed: () {
                  _showBottomSheet(context);
                }),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext _) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[200],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
      ),
      builder: (_) => SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12.0),
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(2.0)),
            ),
            Expanded(
                child: ListView(
              children: [
                for (var i = 0; i < option.length; i++)
                  ValueListenableBuilder<int>(
                      valueListenable: trackOption,
                      builder: (context, value, child) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: ListTile(
                            shape: value == i
                                ? RoundedRectangleBorder(
                                    side:
                                        const BorderSide(color: AppColor.blue),
                                    borderRadius: BorderRadius.circular(12.0))
                                : null,
                            onTap: () {
                              trackOption.value = i;
                            },
                            leading: Image(
                                image: value == i
                                    ? ImageString.radioActive
                                    : ImageString.radioInactive,
                                height: 15),
                            title: KText(option[i],
                                color:
                                    value == i ? AppColor.black : AppColor.grey,
                                fontSize: 24),
                          ),
                        );
                      }),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
