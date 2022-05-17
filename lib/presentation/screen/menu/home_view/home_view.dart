import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/constant/route_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kText.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return GridView.count(
      padding: const EdgeInsets.symmetric(vertical: 26.0),
      crossAxisCount: 3,
      children: const [
        CategoryBox(
          imageProvider: ImageString.fuelMonitoring,
          string: AppString.fuelMonitoring,
          routeString: RouteString.fuel,
        ),
        CategoryBox(
          imageProvider: ImageString.appliedLeave,
          string: AppString.appliedLeave,
          routeString: RouteString.appliedLeave,
        ),
        CategoryBox(
          imageProvider: ImageString.feedback,
          string: AppString.feedback,
          routeString: RouteString.feedback,
        ),
        CategoryBox(
          imageProvider: ImageString.adminTrip,
          string: AppString.adminTrip,
          routeString: RouteString.adminTrip,
        ),
        // CategoryBox(
        //   imageProvider: ImageString.feedback,
        //   string: AppString.device,
        //   routeString: RouteString.device,
        // ),
        CategoryBox(
            imageProvider: ImageString.market,
            string: AppString.marketObservation,
            routeString: RouteString.marketObservation),
        CategoryBox(
            imageProvider: ImageString.location,
            string: AppString.currentPosition,
            routeString: RouteString.currentPosition),
        CategoryBox(
            imageProvider: ImageString.leave,
            string: AppString.leave,
            routeString: RouteString.leave),
        CategoryBox(
            imageProvider: ImageString.track,
            string: AppString.todayTrack,
            routeString: RouteString.todayTrack),
        CategoryBox(
            imageProvider: ImageString.info,
            string: AppString.preInfo,
            routeString: RouteString.preInfo),

        CategoryBox(
            imageProvider: ImageString.secureParking,
            string: AppString.secureParking,
            routeString: RouteString.secureParking),
        CategoryBox(
            imageProvider: ImageString.drivingObservation,
            string: AppString.drivingObservation,
            routeString: RouteString.drivingObservation),
        CategoryBox(
            imageProvider: ImageString.fuelTwo,
            string:   AppString.fuel,
            routeString: RouteString.fuelManagement),
        CategoryBox(
            imageProvider: ImageString.trackHistory,
            string: AppString.trackHistory,
            routeString: RouteString.trackHistory),
        CategoryBox(
            imageProvider: ImageString.trackHistory,
            string: AppString.vehicleObservation,
            routeString: RouteString.vehicleObservation),
        CategoryBox(
            imageProvider: ImageString.trackHistory,
            string: AppString.trackingReport,
            routeString: RouteString.trackingReport),
      ],
    );
  }
}

class CategoryBox extends StatelessWidget {
  final ImageProvider imageProvider;
  final String string;
  final String? routeString;

  const CategoryBox(
      {Key? key,
      required this.imageProvider,
      required this.string,
      this.routeString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColor.white,
            boxShadow: [BoxShadow(color: Colors.grey[200]!,spreadRadius: 3,blurRadius: 3)],
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Colors.grey[200]!)
          ),
          width: 80,
          height: 80,
          child: Align(
            child: IconButton(
                onPressed: routeString != null
                    ? () {
                        Navigator.pushNamed(context, routeString!);
                      }
                    : null,
                icon: Image(image: imageProvider),iconSize: 50),
          ),
        ),
        const SizedBox(height: 12.0),
        KText(string),
      ],
    );
  }
}

class FeatureListing {
  final ImageProvider imageProvider;
  final String string;

  const FeatureListing({required this.string, required this.imageProvider});
}
