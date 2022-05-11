import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/constant/route_string.dart';
import 'package:megatech/widgets/kText.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children:const [
         CategoryBox(
          imageProvider: ImageString.fuelTwo,
          string: AppString.fuel,
          routeString: RouteString.fuel,
        ),
         CategoryBox(
          imageProvider: ImageString.leave,
          string: AppString.appliedLeave,
          routeString: RouteString.appliedLeave,
        ),
         CategoryBox(
          imageProvider: ImageString.feedback,
          string: AppString.feedback,
          routeString: RouteString.feedback,
        ),
        CategoryBox(
          imageProvider: ImageString.feedback,
          string: AppString.adminTrip,
          routeString: RouteString.adminTrip,
        ),
        CategoryBox(
          imageProvider: ImageString.feedback,
          string: AppString.device,
          routeString: RouteString.device,
        ),
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
        SizedBox(
          width: 80,
          height: 80,
          child: IconButton(
              onPressed: routeString != null ? () {
                Navigator.pushNamed(context, routeString!);
              } : null,
              icon: Image(image: imageProvider)),
        ),
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
