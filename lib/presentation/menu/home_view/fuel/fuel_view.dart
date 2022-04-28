import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kElevatedButton.dart';
import 'package:megatech/widgets/kText.dart';
import 'package:megatech/widgets/kdecoratedField.dart';

class FuelMonitoring extends StatelessWidget {
  const FuelMonitoring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(
        AppString.fuelMonitoring,
        color: AppColor.white,
        fontSize: 28.0,
      )),
      body: Center(
        child: Column(children: [
          Container(),
          const SizedBox(height: 36.0),
          const SizedBox(
            height: 150,
            width: 150,
            child: Image(
              image: ImageString.fuelGauge,
            ),
          ),
          const SizedBox(height: 18.0),
          const KText('4.5Ltr', fontSize: 35),
          const KText('14 March 2022,11:45PM'),
          const SizedBox(height: 18.0),

          // KDecoratedField(label: true, from: true),
          // KDecoratedField(label: false, from: true),
          // KDecoratedField(label: true, from: true),
          // KDecoratedField(label: false, from: true),
          Container(
            height: 125,
            width: 320,
            //padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 8.0),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.black),
                borderRadius: BorderRadius.circular(16.0)),
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16.0),
                          topLeft: Radius.circular(16.0))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: const [
                          KText('Date', color: AppColor.grey),
                          KText('24-02-2022'),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                      )),
                      Expanded(child: Column())
                    ],
                  ),
                )),
                Expanded(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      KText(AppString.fuel.toUpperCase(), color: AppColor.grey),
                      KText('6.8 Ltr'),
                    ],
                  ),
                )),
              ],
            ),
          ),

          KElevatedButton(width: 130, string: AppString.showw),
        ]),
      ),
    );
  }
}

class _FuelMonitoringListing extends StatelessWidget {
  const _FuelMonitoringListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(AppString.fuelMonitoring,
              color: AppColor.white, fontSize: 28.0)),
      body: ListView(
        children: [
          Container(
            height: 300,
            width: 320,
            decoration: BoxDecoration(),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.grey[200],
                )),
                Expanded(child: Column()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
