import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megatech/widgets/kTextFieldNonFloatingLabel.dart';
import 'package:megatech/widgets/kAppbar.dart';

import '../../../../constant/app_string.dart';
import '../../../../theme/app_color.dart';
import '../../../../widgets/kElevatedButton.dart';
import '../../../../widgets/kText.dart';
import '../../../../widgets/kTextField.dart';

class AdminTrip extends StatelessWidget {
  const AdminTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const KAppBar(
            title: KText(
          AppString.adminTrip,
          color: AppColor.white,
          fontSize: 28.0,
        )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: const [
                    Expanded(
                        child: KTextFieldNonFloatingLabel(
                      label: AppString.driverLocalId,
                    )),
                    SizedBox(width: 10),
                    Expanded(
                        child: KTextFieldNonFloatingLabel(
                      label: AppString.driverName,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(children: const [
                  Expanded(
                      child: KTextFieldNonFloatingLabel(
                    label: AppString.employeeLocalId,
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: KTextFieldNonFloatingLabel(
                    label: AppString.employeeName,
                  )),
                ]),
                const SizedBox(
                  height: 20,
                ),
                const KTextFieldNonFloatingLabel(
                    label: AppString.employeeDesignation),
                const SizedBox(
                  height: 20,
                ),
                const KTextFieldNonFloatingLabel(
                    label: AppString.employeeCellNo),
                const SizedBox(
                  height: 20,
                ),
                Row(children: const [
                  Expanded(
                      child: KTextFieldNonFloatingLabel(
                    label: AppString.email,
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: KTextFieldNonFloatingLabel(
                    label: AppString.serviceType,
                    hintText: 'Pick & Drop',
                  )),
                ]),
                const SizedBox(
                  height: 20,
                ),
                const KTextFieldNonFloatingLabel(label: AppString.reason),
                const SizedBox(
                  height: 20,
                ),
                KElevatedButton(
                    width: 130, string: AppString.dayStart, onTap: () {})
              ],
            ),
          ),
        ));
  }
}
