import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/dependency_injection.dart';
import 'package:megatech/presentation/blocs/date_time_picker/date_time_picker_bloc.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kText.dart';


class TrackHistory extends StatefulWidget {
  const TrackHistory({Key? key}) : super(key: key);

  @override
  State<TrackHistory> createState() => _TrackHistoryState();
}

class _TrackHistoryState extends State<TrackHistory> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  final Completer<GoogleMapController> _controller = Completer();
  final timeDateBloc = injector<DateTimePickerBloc>();
  @override
  void initState() {
    timeDateBloc.add(PickDate(context: context));
    timeDateBloc.add(PickTime(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(AppString.trackHistory,
              color: AppColor.white, fontSize: 28.0)),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            top: 75,
            left: 20,
            child: Column(
              children: [
                _decorateContainer(
                    onTap: () => _showBottomSheet(context),
                    imageProvider: ImageString.infoWhite),
                _decorateContainer(
                    onTap: () => _showBottomSheet(context),
                    imageProvider: ImageString.play),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _decorateContainer(
      {VoidCallback? onTap, required ImageProvider imageProvider}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Align(child: Image(image: imageProvider, height: 30, width: 30)),
        //child: Image(image: imageProvider),
      ),
    );
  }

  void _showBottomSheet(BuildContext _) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[200],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft:  Radius.circular(18.0),
            topRight:  Radius.circular(18.0)),
      ),
      builder: (_) => SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12.0),
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(2.0)),
            ),
            const KText(AppString.summery,
                fontSize: 28, enumText: EnumText.bold, color: AppColor.grey),
            _info(AppString.regNo, value: 'SSS-777'),
            _info(AppString.mileage, value: '2.2 KM'),
            _info(AppString.topSpeed, value: '25 KM/H'),
            _info(AppString.avgSpeed, value: '6.6 KM/H'),
          ],
        ),
      ),
    );
  }
  Widget _info(String option,{required String value}){

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
          width: 250,
          child: Row(
            children: [
              KText(option,
                  fontSize: 24, enumText: EnumText.semiBold,color: AppColor.grey),
              const Spacer(),
              KText(value, fontSize: 24, enumText: EnumText.semiBold,color: AppColor.grey)
            ],
          )),
    );
  }
}
