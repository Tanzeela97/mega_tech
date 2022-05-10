import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kText.dart';


class CurrentPosition extends StatefulWidget {
  const CurrentPosition({Key? key}) : super(key: key);

  @override
  State<CurrentPosition> createState() => _CurrentPositionState();
}

class _CurrentPositionState extends State<CurrentPosition> {
 final  Completer<GoogleMapController> _controller = Completer();

  static const  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const  CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
 ValueNotifier<String> valueNotifier =ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(AppString.currentPosition,
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
            height: 150,
            left: 20,
            child: Chip(
              backgroundColor: AppColor.blue,
              
              label: ValueListenableBuilder<String>(
                valueListenable: valueNotifier,
                builder: (_,value,child)=>DropdownButtonHideUnderline(
                    child: DropdownButton<String>(icon: Icon(Icons.keyboard_arrow_down_outlined,color: AppColor.white),
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
        ],
      ),
    );
  }
}
