import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kElevatedButton.dart';
import 'package:megatech/widgets/kMultilineTextField.dart';
import 'package:megatech/widgets/kText.dart';
import 'package:megatech/widgets/kTextFieldNonFloatingLabel.dart';
import 'package:megatech/widgets/kdecoratedField.dart';

import '../../../../../app_utility/app_utility.dart';
import '../../../../../dependency_injection.dart';
import '../../../../blocs/date_time_picker/date_time_picker_bloc.dart';

class VehicleObservation extends StatefulWidget {
  const VehicleObservation({Key? key}) : super(key: key);

  @override
  State<VehicleObservation> createState() => _VehicleObservationState();
}

class _VehicleObservationState extends State<VehicleObservation> {
  final lastDate = sl<DateTimePickerBloc>();
  final lastObservation = sl<DateTimePickerBloc>();

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

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<int> radioOne = ValueNotifier(0);
  static const _widthBox = SizedBox(width: 10);
  static const _heightBox = SizedBox(height: 20);
  static const option = ['Yes', 'No'];
  static const optionTwo = ['Good', 'ok', 'No'];
  String dropdownvalue = 'Item 1';
  var items = [

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(AppString.vehicleObservation,
              color: AppColor.white, fontSize: 28.0)),
      body: SingleChildScrollView(
        child: Column(
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
                          const KTextFieldNonFloatingLabel(
                              label: AppString.driverName),
                          _heightBox,
                          Row(
                            children: [
                              BlocBuilder<DateTimePickerBloc,
                                  DateTimePickerInitial>(
                                bloc: lastDate,
                                builder: (_, toState) {
                                  return Expanded(
                                      child: KDecoratedField(
                                    labelString: AppString.date,
                                    label: true,
                                    value:
                                        AppUtility.dateFormat(toState.dateTime),
                                    //from: false,
                                    callback: () {
                                      lastDate.add(PickDate(context: context));
                                    },
                                    from: false,
                                  ));
                                },
                              ),
                              _widthBox,
                              BlocBuilder<DateTimePickerBloc,
                                  DateTimePickerInitial>(
                                bloc: lastObservation,
                                builder: (_, toState) {
                                  return Expanded(
                                      child: KDecoratedField(
                                    labelString: AppString.lastObservation,
                                    label: true,
                                    value:
                                        AppUtility.dateFormat(toState.dateTime),
                                    //from: false,
                                    callback: () {
                                      lastObservation
                                          .add(PickDate(context: context));
                                    },
                                    from: false,
                                  ));
                                },
                              ),
                            ],
                          ),

                          _heightBox,
                          const KTextFieldNonFloatingLabel(
                              label: AppString.businessGroup,iconData: Icons.keyboard_arrow_down,),
                          _heightBox,
                          const KTextFieldNonFloatingLabel(
                              label: AppString.designation),
                          _heightBox,
                          const KTextFieldNonFloatingLabel(
                              label: AppString.lineManager),
                          _heightBox,
                          const KTextFieldNonFloatingLabel(
                              label: AppString.region),
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
                          const KText('Assessee',
                              fontSize: 24, enumText: EnumText.bold),
                          _heightBox,
                          const KTextFieldNonFloatingLabel(
                              label: AppString.name),
                          _heightBox,
                          const KTextFieldNonFloatingLabel(
                              label: AppString.employee),
                          _heightBox,
                          const KTextFieldNonFloatingLabel(
                              label: AppString.vehicle),
                          _heightBox,
                          const KText(AppString.pPetrol,
                              fontSize: 24, enumText: EnumText.bold),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString.atLeastHalfTank),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString
                                  .isRadiatorWaterBottleFilledUpToTheLevel),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString
                                  .isWindScreenWaterBottleFilledUpToTheLevel),
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
                          const KText(AppString.oOil,
                              fontSize: 24, enumText: EnumText.bold),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label:
                                  AppString.isEngineOilGreaterThanToTheLevel),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label:
                                  AppString.isBrakeMCylReservoirUpToTheLevel),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label:
                                  AppString.isClutchMCylReservoirUpToTheLevel),
                          _heightBox,
                          const KText(AppString.eElectricity,
                              fontSize: 24, enumText: EnumText.bold),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString.isIgnitionSwitchWorking),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString
                                  .areAllIndicatorBreakReverseAndHeadLightWorking),
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
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString.isRadiatorFanWorking),
                          _heightBox,
                          const KText(AppString.rRubber,
                              fontSize: 24, enumText: EnumText.bold),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString.tirePressureOKWheel),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString.isPaddleRubberGoodCondition),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString.isWiperRubberGoodCondition),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString.isWiperWorkingGoodCondition),
                          _heightBox,
                          const KText(AppString.otherChecks,
                              fontSize: 24, enumText: EnumText.bold),
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
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString.isVehicleDamage),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString.vehicleLog),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString.isExtraTireStepney),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString.isFirstAidKit),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString
                                  .areAllSeatBeltsInGoodWorkingConditions),
                          _heightBox,
                          const KText(AppString.lastMonthFinding,
                              fontSize: 24, enumText: EnumText.bold),
                          const KMultiLineTextField(
                              title: AppString.whatWasTheLastMonthsObservation)
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
                          const KText(AppString.improvement,
                              fontSize: 24, enumText: EnumText.bold),
                          _heightBox,
                          KDecoratedFieldRadio(
                              radioNotifier: radioOne,
                              data: option,
                              label: AppString
                                  .isThereAnyImprovementInLastMonthObservation),
                          _heightBox,
                          Row(
                            children: const [
                              KText(AppString.otherObservation,
                                  fontSize: 24, enumText: EnumText.bold),
                              _widthBox,
                              Icon(Icons.camera_alt_outlined),
                            ],
                          ),
                          _heightBox,
                          const KMultiLineTextField(
                              title: AppString.anyOtherObservation),
                          _heightBox,
                          Center(child: KElevatedButton(string: AppString.complete,onTap: (){},width: 180))
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
                        pageIndicator(2 == value),
                        pageIndicator(3 == value),
                        pageIndicator(4 == value),
                        pageIndicator(5 == value),
                      ],
                    ))
          ],
        ),
      ),
    );
  }
}
