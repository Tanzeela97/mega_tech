import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megatech/app_utility/app_utility.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/dependency_injection.dart';
import 'package:megatech/presentation/blocs/date_time_picker/date_time_picker_bloc.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kElevatedButton.dart';
import 'package:megatech/widgets/kText.dart';
import 'package:megatech/widgets/kdecoratedField.dart';

class FuelMonitoring extends StatefulWidget {
  const FuelMonitoring({Key? key}) : super(key: key);

  @override
  State<FuelMonitoring> createState() => _FuelMonitoringState();
}

class _FuelMonitoringState extends State<FuelMonitoring> {
  final fromBloc = injector<DateTimePickerBloc>();
  final toBloc = injector<DateTimePickerBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(
        AppString.fuelMonitoring,
        color: AppColor.white,
        fontSize: 28.0,
      )),
      body: BlocBuilder<DateTimePickerBloc, DateTimePickerInitial>(
        bloc: fromBloc,
        builder: (_,fromState){
          return  BlocBuilder<DateTimePickerBloc, DateTimePickerInitial>(
            bloc: toBloc,
            builder: (_,toState){
              return Center(
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
                  Column(
                    children: [
                      KDecoratedField(
                          label: true,
                          from: true,
                          value: AppUtility.dateFormat(fromState.dateTime),
                          callback: () {
                            fromBloc.add(PickDate(context: context));
                          }),
                      KDecoratedField(
                          label: false,
                          from: true,
                          value: AppUtility.timeFormat(fromState.timeOfDay),
                          callback: () {
                            fromBloc.add(PickTime(context: context));
                          }),
                      KDecoratedField(
                          label: true,
                          from: false,
                          value: AppUtility.dateFormat(toState.dateTime),
                          callback: () {
                            toBloc.add(PickDate(context: context));
                          }),
                      KDecoratedField(
                          label: false,
                          from: true,
                          value: AppUtility.timeFormat(toState.timeOfDay),
                          callback: () {
                            toBloc.add(PickTime(context: context));
                          }),
                    ],
                  ),
                  const SizedBox(height: 26.0),
                  KElevatedButton(
                      width: 130,
                      string: AppString.show,
                      onTap: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const _FuelMonitoringListing()));
                      }),
                ]),
              );
            },
          );
        },
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
          for (var i = 0; i < 10; i++)
            Align(
              child: Container(
                height: 125,
                width: 320,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.black),
                    borderRadius: BorderRadius.circular(16.0)),
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                            KText(AppString.fuel.toUpperCase(),
                                color: AppColor.grey),
                            KText('6.8 Ltr', enumText: EnumText.bold),
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
