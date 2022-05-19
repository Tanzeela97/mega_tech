import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kMultilineTextField.dart';
import 'package:megatech/widgets/kText.dart';
import 'package:megatech/widgets/kTextFieldNonFloatingLabel.dart';
import 'package:megatech/widgets/kdecoratedField.dart';

import '../../../../../widgets/kElevatedButton.dart';

class DrivingObservation extends StatefulWidget {
  const DrivingObservation({Key? key}) : super(key: key);

  @override
  State<DrivingObservation> createState() => _DrivingObservationState();
}

class _DrivingObservationState extends State<DrivingObservation> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  static const _widthBox = SizedBox(width: 10);
  static const _heightBox = SizedBox(height: 20);
  final ValueNotifier<int> radioOne = ValueNotifier(0);
  final ValueNotifier<int> radioTwo = ValueNotifier(0);
  static const option = ['Yes', 'No'];
  static const optionTwo = ['Good', 'ok', 'No'];
  String dropdownvalue = 'Item 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const KAppBar(
          title: KText(AppString.drivingObservation,
              color: AppColor.white, fontSize: 28.0)),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1.65,
            child: PageView(
              onPageChanged: (value) {
                pageIndex.value = value;
              },
              children: [

                ///pageOne
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 40),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Expanded(
                              child: KTextFieldNonFloatingLabel(
                                  label: AppString.driverId)),
                          _widthBox,
                          Expanded(
                              child: KTextFieldNonFloatingLabel(
                                  label: AppString.driverName)),
                        ],
                      ),
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
                      KDecoratedDropDown(
                          data:, label: AppString.businessGroup, dropDown:),
                      const KTextFieldNonFloatingLabel(
                          label: AppString.businessGroup,
                          iconData: Icons.keyboard_arrow_down),
                      _heightBox,
                      const KTextFieldNonFloatingLabel(
                          label: AppString.designation,
                          iconData: Icons.keyboard_arrow_down),
                      _heightBox,
                      const KTextFieldNonFloatingLabel(
                          label: AppString.lineManager),
                      _heightBox,
                      const KTextFieldNonFloatingLabel(
                          label: AppString.delayedPassenger),
                      _heightBox,
                      const KTextFieldNonFloatingLabel(label: AppString.region),
                    ],
                  ),
                ),

                ///pageTwo
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const KText(AppString.beforeDriving,
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      Row(
                        children: [
                          Expanded(child: KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: const ['Yes', 'No'],
                              label: AppString.observeAllSide)),
                          _widthBox,
                          Expanded(child: KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: const ['Yes', 'No'],
                              label: AppString.fastenSafetyBelt)),
                        ],
                      ),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: const ['Yes', 'No'],
                          label: AppString.checkPassengerForSafetyBelt),
                      _heightBox,
                      const KText(AppString.turning,
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: optionTwo,
                          label: AppString.getsInTheProperLaneInTime),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: optionTwo,
                          label: AppString.spaceOnCurve),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: optionTwo,
                          label: AppString.curvePath),
                    ],
                  ),
                ),

                ///pageThree
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const KText(AppString.roadBehavior,
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: optionTwo,
                          label: AppString.isConfident),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: optionTwo,
                          label: AppString.isRelaxed),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: optionTwo,
                          label: AppString.toleratesBadDriving),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: optionTwo,
                          label: AppString.isConsiderateTo),
                      _heightBox,
                      const KText(AppString.incidents,
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: optionTwo,
                          label: AppString.incidentHappened),
                    ],
                  ),
                ),

                ///pageFour
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const KText(AppString.lastMonthsObservation,
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      const KMultiLineTextField(
                          title: AppString.whatWasTheLastMonthsObservation),
                      _heightBox,
                      const KText(AppString.improvement,
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: optionTwo,
                          label: AppString
                              .isThereAnyImprovementInLastMonthObservation),
                      _heightBox,
                      const KText(AppString.otherObservation,
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      const KMultiLineTextField(
                          title: AppString.anyOtherObservation),
                    ],
                  ),
                ),

                ///pageFive
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          KText(AppString.caution,
                              fontSize: 24, enumText: EnumText.bold),
                          _widthBox,
                          Icon(Icons.camera_alt_outlined)
                        ],
                      ),
                      _heightBox,
                      const KMultiLineTextField(title: ''),
                      _heightBox,
                      const KText(AppString.distance,
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: option,
                          label: AppString.maintainingThreeSecondDistance),
                      _heightBox,
                      const KText(AppString.inspection,
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: option,
                          label: AppString.carInspectionBeforeStartingAJourney),
                      _heightBox,
                      const KText(AppString.safeDistanceFront,
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: option,
                          label: AppString
                              .maintainingSafeDistanceFromOtherVehiclesFront),
                    ],
                  ),
                ),

                ///pageSix
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const KText(AppString.safeDistanceSide,
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: option,
                          label: AppString
                              .maintainingSafeDistanceFromOtherVehiclesSide),
                      _heightBox,
                      const KText(AppString.safeDistanceBack,
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: option,
                          label: AppString
                              .maintainingSafeDistanceFromOtherVehiclesBack),
                      _heightBox,
                      const KText(AppString.brakes,
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      KDecoratedFieldRadio(
                          radioNotifier: radioOne,
                          data: option,
                          label: AppString.distanceMaintainBeforePressingBreak),
                      const KText(AppString.comments,
                          fontSize: 24, enumText: EnumText.bold),
                      _heightBox,
                      const KMultiLineTextField(title: AppString.description),
                      _heightBox,
                      Center(child: KElevatedButton(
                        string: AppString.complete, onTap: () {}, width: 180,))
                    ],
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<int>(
              valueListenable: pageIndex,
              builder: (_, value, child) =>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      pageIndicator(0 == value),
                      pageIndicator(1 == value),
                      pageIndicator(2 == value),
                      pageIndicator(3 == value),
                      pageIndicator(4 == value),
                      pageIndicator(5 == value),
                    ],
                  ))
        ],
      ),
    );
  }

  Widget pageIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 14,
      width: 14,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? AppColor.lightBlue : Colors.grey[200]),
    );
  }
}