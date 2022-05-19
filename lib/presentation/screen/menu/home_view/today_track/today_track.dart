import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kText.dart';

class TodayTrack extends StatefulWidget {
  const TodayTrack({Key? key}) : super(key: key);

  @override
  State<TodayTrack> createState() => _TodayTrackState();
}

class _TodayTrackState extends State<TodayTrack> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  ValueNotifier<String> valueNotifier =ValueNotifier('');
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
            const KText(AppString.summary,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(AppString.todayTrack,
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


            child:  Column(
              children:[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Chip(
                    backgroundColor: AppColor.blue,
                    label: ValueListenableBuilder<String>(
                      valueListenable: valueNotifier,
                      builder: (_,value,child)=>DropdownButtonHideUnderline(
                          child: DropdownButton<String>(icon: const Icon(Icons.keyboard_arrow_down_outlined,color: AppColor.white),
                            value: value.isEmpty ? null : value,
                            isDense: true,
                            hint: const KText(AppString.selectedVehicle,color: AppColor.white),
                            items: ['list1','list2','list3',]
                                .map((e) => DropdownMenuItem(child: KText(e), value: e))
                                .toList(),
                            onChanged: (val) {
                              valueNotifier.value = val!;
                            },
                          )),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 45,
                  width: 45,
                  child: PhysicalModel(
                    color: AppColor.black.withOpacity(0.3),
                    elevation: 6.0,
                    shadowColor: AppColor.black,
                    shape: BoxShape.circle,
                    child:  SizedBox(

                        child: InkWell(
                          onTap: () {
                            _showBottomSheet(context);
                          },
                          child: const Image(image: ImageString.info),
                        ),
                      ),
                    ),
                ),


           ] ),




            ),

        ],
      ),
    );
  }
}
