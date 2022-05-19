import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/presentation/screen/menu/home_view/tracking_report/trip.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kText.dart';


class TrackingReport extends StatefulWidget {
  const TrackingReport({Key? key}) : super(key: key);

  @override
  State<TrackingReport> createState() => _TrackingReportState();
}

class _TrackingReportState extends State<TrackingReport> {
  static const _heightBox = SizedBox(height: 20);
  static const List<String> option = ['Today', 'Last Week', 'This Month'];
  final ValueNotifier<int> trackOption = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(AppString.trackingReport,
              color: AppColor.white, fontSize: 28.0)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _tile(string: AppString.trip, imageProvider: ImageString.amount,onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const TripV()));
            }),
            _heightBox,
            _tile(
                string: AppString.violationReport,
                imageProvider: ImageString.fuelPrice),
            _heightBox,
            _tile(string: AppString.fuelFillingReport, imageProvider: ImageString.fuelTwo),
            _heightBox,
            _tile(string: AppString.fuelTheftReport, imageProvider: ImageString.fuelTwo),

          ],
        ),
      ),
    );
  }

  Widget _tile(
      {required String string, required ImageProvider imageProvider,VoidCallback? onTap}) =>
      ListTile(
          leading: Image(image: imageProvider, height: 32),
          title: KText(string, fontSize: 24),
          tileColor: AppColor.textFieldColor,
          onTap: onTap,
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(12.0)));

  // void _showBottomSheet(BuildContext _) async {
  //   await showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.grey[200],
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
  //     ),
  //     builder: (_) => SizedBox(
  //       height: 300,
  //       child: Column(
  //         children: [
  //           Container(
  //             margin: const EdgeInsets.symmetric(vertical: 12.0),
  //             width: 40,
  //             height: 5,
  //             decoration: BoxDecoration(
  //                 color: Colors.grey, borderRadius: BorderRadius.circular(2.0)),
  //           ),
  //           for (var i = 0; i < option.length; i++)
  //             ValueListenableBuilder<int>(
  //                 valueListenable: trackOption,
  //                 builder: (context,value,child) {
  //                   return Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
  //                     child: ListTile(
  //                       shape: value==i?RoundedRectangleBorder(
  //                           side: const BorderSide(color: AppColor.blue),
  //                           borderRadius: BorderRadius.circular(12.0)):null,
  //                       onTap: (){
  //                         trackOption.value=i;
  //                       },
  //
  //                       leading: Image(image: value==i?ImageString.radioActive:ImageString.radioInactive
  //                           ,height: 15),
  //                       title: KText(option[i],color: value==i?AppColor.black:AppColor.grey,fontSize: 24),
  //                     ),
  //                   );
  //                 }
  //             ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
