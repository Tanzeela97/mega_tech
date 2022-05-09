import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kElevatedButton.dart';
import 'package:megatech/widgets/kMultilineTextField.dart';
import 'package:megatech/widgets/kText.dart';
import 'package:megatech/widgets/kTextField.dart';

import '../../../../widgets/kTextFieldNonFloatingLabel.dart';

class MarketObservation extends StatelessWidget {
  const MarketObservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const KAppBar(
          title: KText(AppString.marketObservation,
              color: AppColor.white, fontSize: 28.0)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Container(),
            const SizedBox(height: 26.0),
            const KTextFieldNonFloatingLabel(label: AppString.shop),
            const SizedBox(height: 26.0),
            const KTextFieldNonFloatingLabel(label: AppString.town),
            const SizedBox(height: 26.0),
            const KMultiLineTextField(title: AppString.observation),
            const SizedBox(height: 26.0),
            KElevatedButton(string: AppString.save,onTap: (){},width: 80),
          ],
        ),
      ),
    );
  }
}
