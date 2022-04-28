import 'package:flutter/material.dart';
import 'package:megatech/constant/route_string.dart';
import 'package:megatech/presentation/boarding_view/boarding_view.dart';
import 'package:megatech/presentation/main_layout.dart';
import 'package:megatech/presentation/menu/home_view/fuel/fuel_view.dart';
import 'package:megatech/presentation/menu/menu_view.dart';
import 'package:megatech/presentation/signIn_view/signIn_view.dart';

import 'package:megatech/presentation/splash_view/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case RouteString.initial:
        //return MaterialPageRoute(builder: (_) => const MainLayout());
      //  return MaterialPageRoute(builder: (_) => const BoardingView());
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouteString.layout:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case RouteString.fuel:
        return MaterialPageRoute(builder: (_) => const FuelMonitoring());
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
