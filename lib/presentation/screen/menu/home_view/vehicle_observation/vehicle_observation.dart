import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kText.dart';
import 'package:megatech/widgets/kTextFieldNonFloatingLabel.dart';
import 'package:megatech/widgets/kdecoratedField.dart';


class VehicleObservation extends StatefulWidget {
  const VehicleObservation({Key? key}) : super(key: key);

  @override
  State<VehicleObservation> createState() => _VehicleObservationState();
}

class _VehicleObservationState extends State<VehicleObservation> {
  Widget pageIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 18,
      width: 18,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? AppColor.lightBlue : Colors.grey[200]),
    );
  }
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<int> radioOne = ValueNotifier(0);
  static const _widthBox = SizedBox(width: 10);
  static const _heightBox = SizedBox(height: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(AppString.vehicleObservation,
              color: AppColor.white, fontSize: 28.0)),
      body: Column(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1.65,
              child: PageView( onPageChanged: (value) {
                pageIndex.value = value;
              },children: [
                ///pageOne
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40),
                  child: Column(
                    children: [
                      const KTextFieldNonFloatingLabel(label: AppString.driverName),
                      _heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: KDecoratedField(
                                label: true,
                                from: true,
                                labelString: AppString.date,
                                // value: AppUtility.dateFormat(fromState.dateTime),
                                callback: () {
                                  //fromBloc.add(PickDate(context: context));
                                }),
                          ),
                          _widthBox,
                          Expanded(
                            child: KDecoratedField(
                                label: true,
                                from: true,
                                labelString: AppString.lastObservationDate,
                                //value: AppUtility.dateFormat(fromState.dateTime),
                                callback: () {
                                  // fromBloc.add(PickDate(context: context));
                                }),
                          ),
                        ],
                      ),
                      _heightBox,
                     const  KTextFieldNonFloatingLabel(
                          label: AppString.businessGroup),
                      _heightBox,
                      const  KTextFieldNonFloatingLabel(label: AppString.designation),
                      _heightBox,
                      const KTextFieldNonFloatingLabel(label: AppString.lineManager),
                      _heightBox,
                      const  KTextFieldNonFloatingLabel(label: AppString.region),
                    ],
                  ),
                ),
                ///pageTwo
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const    KText('Assessee',
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      const     KTextFieldNonFloatingLabel(label: AppString.name),
                      _heightBox,
                      const    KTextFieldNonFloatingLabel(label: AppString.employee),
                      _heightBox,
                      const    KTextFieldNonFloatingLabel(label: AppString.vehicle),
                      _heightBox,
                      const     KText(AppString.pPetrol,
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne, data: const ['Yes', 'No'],label: AppString.observeAllSide),
                    ],
                  ),
                ),
              ]),
            ),
            ValueListenableBuilder<int>(
                valueListenable: pageIndex,
                builder: (_, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pageIndicator(0 == value),
                    pageIndicator(1 == value),
                  ],
                ))
          ],
      ),
    );
  }

}
