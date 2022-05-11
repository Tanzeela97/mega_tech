import 'package:flutter/material.dart';
import 'package:megatech/constant/route_string.dart';


import 'package:megatech/presentation/menu/home_view/admin_trip/admin_trip.dart';

import 'package:megatech/presentation/menu/home_view/device/device.dart';



import 'package:megatech/presentation/screen/main_layout.dart';
import 'package:megatech/presentation/screen/menu/home_view/applied_leave/applied_leave.dart';
import 'package:megatech/presentation/screen/menu/home_view/current_position/current_position.dart';
import 'package:megatech/presentation/screen/menu/home_view/feedback/feedback.dart';
import 'package:megatech/presentation/screen/menu/home_view/fuel_monitoring/fuel_monitoring.dart';
import 'package:megatech/presentation/screen/menu/home_view/leave/leave.dart';
import 'package:megatech/presentation/screen/menu/home_view/market_observation/market_observation.dart';
import 'package:megatech/presentation/screen/menu/home_view/pre_info/pre_info.dart';
import 'package:megatech/presentation/screen/menu/home_view/today_track/today_track.dart';
import 'package:megatech/presentation/screen/splash_view/splash_view.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case RouteString.initial:
        return MaterialPageRoute(builder: (_) => const SplashView());
        //  return MaterialPageRoute(builder: (_) => const BoardingView());
        return MaterialPageRoute(builder: (_) => const FeedBack());
      case RouteString.layout:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case RouteString.fuel:
        return MaterialPageRoute(builder: (_) => const FuelMonitoring());
      case RouteString.appliedLeave:
        return MaterialPageRoute(builder: (_) => const AppliedLeave());
      case RouteString.feedback:
        return MaterialPageRoute(builder: (_) => const FeedBack());

      case RouteString.adminTrip:
        return MaterialPageRoute(builder: (_) => const AdminTrip());
      case RouteString.device:
        return MaterialPageRoute(builder: (_) => const Device());

      case RouteString.preInfo:
        return MaterialPageRoute(builder: (_) => const PreInfo());
      case RouteString.marketObservation:
        return MaterialPageRoute(builder: (_) => const MarketObservation());
      case RouteString.currentPosition:
        return MaterialPageRoute(builder: (_) => const CurrentPosition());
      case RouteString.leave:
        return MaterialPageRoute(builder: (_) => const Leave());
      case RouteString.todayTrack:
        return MaterialPageRoute(builder: (_) => const TodayTrack());


        // case '/second':
        // // Validation of correct data type
        //   if (args is String) {
        //     return MaterialPageRoute(
        //       builder: (_) => SecondPage(
        //         data: args,
        //       ),
        //     );
        //   }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
