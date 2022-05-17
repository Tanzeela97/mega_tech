import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kElevatedButton.dart';
import 'package:megatech/widgets/kText.dart';

class FuelManagement extends StatefulWidget {
  const FuelManagement({Key? key}) : super(key: key);

  @override
  State<FuelManagement> createState() => _FuelManagementState();
}

class _FuelManagementState extends State<FuelManagement> {
  static const _heightBox = SizedBox(height: 20);
  static const List<String> option = ['Today', 'Last Week', 'This Month'];
  final ValueNotifier<int> trackOption = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(AppString.fuelMonitoring,
              color: AppColor.white, fontSize: 28.0)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 36.0),
            Row(
              children: [
                const Icon(Icons.camera_alt_outlined, size: 32),
                const Spacer(),
                ActionChip(
                    label: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: KText(AppString.show, color: AppColor.white),
                    ),
                    onPressed: () {},
                    backgroundColor: AppColor.blue),
              ],
            ),
            _heightBox,
            ActionChip(
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      KText(option[0]),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
                backgroundColor: AppColor.white,
                side: const BorderSide(color: AppColor.lightBlue),
                onPressed: () {
                  _showBottomSheet(context);
                }),
            _heightBox,
            _tile(string: 'Amount Paid', imageProvider: ImageString.amount),
            _heightBox,
            _tile(
                string: 'Fuel Price/Ltr(Rate)',
                imageProvider: ImageString.fuelPrice),
            _heightBox,
            _tile(string: 'Litre', imageProvider: ImageString.fuelTwo),
            _heightBox,
            Center(child: const KElevatedButton(string: AppString.saveFilling))
          ],
        ),
      ),
    );
  }

  Widget _tile(
          {required String string, required ImageProvider imageProvider}) =>
      ListTile(
          leading: Image(image: imageProvider, height: 32),
          title: KText(string, fontSize: 24),
          tileColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(12.0)));

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
            for (var i = 0; i < option.length; i++)
              ValueListenableBuilder<int>(
                valueListenable: trackOption,
                builder: (context,value,child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                    child: ListTile(
                      shape: value==i?RoundedRectangleBorder(
                          side: const BorderSide(color: AppColor.blue),
                          borderRadius: BorderRadius.circular(12.0)):null,
                      onTap: (){
                        trackOption.value=i;
                      },
                      leading: Image(image: value==i?ImageString.radioActive:ImageString.radioInactive
                          ,height: 15),
                      title: KText(option[i],color: value==i?AppColor.black:AppColor.grey,fontSize: 24),
                    ),
                  );
                }
              ),
          ],
        ),
      ),
    );
  }
}
