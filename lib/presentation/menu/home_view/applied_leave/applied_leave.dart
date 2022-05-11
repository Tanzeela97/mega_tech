import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kElevatedButton.dart';
import 'package:megatech/widgets/kText.dart';
import 'package:megatech/widgets/kdecoratedField.dart';

class AppliedLeave extends StatelessWidget {
  const AppliedLeave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(AppString.appliedLeave,
              color: AppColor.white, fontSize: 28.0)),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 180.0),
          // const SizedBox(height: 36.0),
          // const SizedBox(
          //   height: 150,
          //   width: 150,
          //   child: Image(
          //     image: ImageString.fuelGauge,
          //   ),
          // ),
          // const SizedBox(height: 18.0),
          // const KText('4.5Ltr', fontSize: 35),
          // const KText('14 March 2022,11:45PM'),
          // const SizedBox(height: 18.0),

          const KDecoratedField(label: true, from: true),
          const KDecoratedField(label: false, from: true),
          const KDecoratedField(label: true, from: true),
          const KDecoratedField(label: false, from: true),



       
  

          KElevatedButton(width: 130, string: AppString.showw, onTap: () {}),

        ]),
      ),
    );
  }
}
