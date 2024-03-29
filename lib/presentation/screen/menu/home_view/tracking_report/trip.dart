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
import 'package:megatech/widgets/kTextFieldNonFloatingLabel.dart';
import 'package:megatech/widgets/kdecoratedField.dart';

class TripV extends StatefulWidget {
  const TripV({Key? key}) : super(key: key);

  @override
  State<TripV> createState() => _TripVState();
}

class _TripVState extends State<TripV> {
  final fromBloc = sl<DateTimePickerBloc>();
  final toBloc = sl<DateTimePickerBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(AppString.trip, color: AppColor.white, fontSize: 28.0)),
      body: BlocBuilder<DateTimePickerBloc, DateTimePickerInitial>(
        bloc: fromBloc,
        builder: (_, fromState) {
          return BlocBuilder<DateTimePickerBloc, DateTimePickerInitial>(
            bloc: toBloc,
            builder: (_, toState) {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 36.0),
                      const SizedBox(height: 18.0),
                      Column(
                        children: [
                          KDecoratedField(
                              label: true,
                              from: true,
                              labelString: AppString.from,
                              value: AppUtility.dateFormat(fromState.dateTime),
                              callback: () {
                                fromBloc.add(PickDate(context: context));
                              }),
                          KDecoratedField(
                              label: false,
                              from: true,
                              labelString: '',
                              value: AppUtility.timeFormat(fromState.timeOfDay),
                              callback: () {
                                fromBloc.add(PickTime(context: context));
                              }),
                          KDecoratedField(
                              label: true,
                              from: false,
                              labelString: AppString.to,
                              value: AppUtility.dateFormat(toState.dateTime),
                              callback: () {
                                toBloc.add(PickDate(context: context));
                              }),
                          KDecoratedField(
                              label: false,
                              from: true,
                              labelString: '',
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
                                    builder: (_) =>
                                        const _FuelMonitoringListing()));
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
  static const _heightBox = SizedBox(height: 20);
  static const _widthBox = SizedBox(width: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(AppString.trip, color: AppColor.white, fontSize: 28.0)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: KElevatedButton(string: 'PDF', width: 80, onTap: () {})),
            _heightBox,
            const KTextFieldNonFloatingLabel(label: AppString.driver),
            _heightBox,
            Row(
              children: const [
                Expanded(
                    child:
                        KTextFieldNonFloatingLabel(label: AppString.vehicle)),
                _widthBox,
                Expanded(
                    child: KTextFieldNonFloatingLabel(label: AppString.regNo)),
              ],
            ),
            _heightBox,
            Row(
              children: const [
                Expanded(
                    child: KTextFieldNonFloatingLabel(
                        label: AppString.totalMileage)),
                _widthBox,
                Expanded(
                    child: KTextFieldNonFloatingLabel(
                        label: AppString.avgSpeedTrip)),
              ],
            ),
            _heightBox,
            //for(var i=0;i<5;i++)
            SizedBox(
              height: 250,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      color: AppColor.textFieldColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            KText('Trip 1', fontSize: 18),
                            Spacer(),
                            TextButton(
                                onPressed: () {},
                                child: KText(AppString.view, fontSize: 18))
                          ],
                        ),
                      ),
                    )),

                    Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.orange[50],
                          child: Column(
                            children: [
                              const ListTile(
                                  title: KText('Start'),
                                  subtitle: KText('subtitle'),dense: true),
                              const ListTile(
                                  title: KText('End'),
                                  subtitle: KText('subtitle'),dense: true),
                              ListTile(
                                dense: true,
                                leading: Wrap(
                                  spacing: 25,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        KText('Duration'),
                                        KText('HH:MM:SS'),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        KText('Distance'),
                                        KText('1.471km/hr'),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        KText('Top Speed'),
                                        KText('241.471 km/hr'),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        KText('Avg. Speed'),
                                        KText('241.471 km/hr'),
                                      ],
                                    ),
                                  ],
                                ),
                                // trailing: Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     KText('Distance'),
                                //     KText('1.47 k/mhr'),
                                //   ],
                                // ),
                              ),
                              // ListTile(
                              //   dense: true,
                              //   leading: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       KText('Speed'),
                              //       KText(''),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // body: ListView(
      //   children: [
      //     for (var i = 0; i < 10; i++)
      //       Align(
      //         child: Container(
      //           height: 125,
      //           width: 320,
      //           margin: const EdgeInsets.symmetric(vertical: 8.0),
      //           decoration: BoxDecoration(
      //               border: Border.all(color: AppColor.black),
      //               borderRadius: BorderRadius.circular(16.0)),
      //           child: Column(
      //             children: [
      //               Expanded(
      //                   child: Container(
      //                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //                 decoration: BoxDecoration(
      //                     color: Colors.grey[200],
      //                     borderRadius: const BorderRadius.only(
      //                         topRight: Radius.circular(16.0),
      //                         topLeft: Radius.circular(16.0))),
      //                 child: Row(
      //                   children: [
      //                     Expanded(
      //                         child: Column(
      //                       children: const [
      //                         KText('DATE', color: AppColor.grey),
      //                         KText('24-02-2022', enumText: EnumText.bold),
      //                       ],
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                     )),
      //                     Expanded(
      //                         child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: const [
      //                         KText('TIME', color: AppColor.grey),
      //                         KText('11 : 30 AM', enumText: EnumText.bold)
      //                       ],
      //                     ))
      //                   ],
      //                 ),
      //               )),
      //               Expanded(
      //                   child: Align(
      //                 alignment: Alignment.centerLeft,
      //                 child: Padding(
      //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       KText(AppString.fuel.toUpperCase(),
      //                           color: AppColor.grey),
      //                       KText('6.8 Ltr', enumText: EnumText.bold),
      //                     ],
      //                   ),
      //                 ),
      //               )),
      //             ],
      //           ),
      //         ),
      //       ),
      //   ],
      // ),
    );
  }
}
