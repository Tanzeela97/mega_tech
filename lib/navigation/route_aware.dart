import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RouteObservers {
  static RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
}
class RouteAwareWidget extends StatefulWidget {
  final String name;
  final Widget? child;

  const RouteAwareWidget(this.name, {required this.child,Key? key}): super(key: key);

  @override
  State<RouteAwareWidget> createState() => RouteAwareWidgetState();
}
class RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    RouteObservers.routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);

  }

  @override
  void dispose() {
    RouteObservers.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    if (kDebugMode) {
      print('didPush ${widget.name}');
    }
  }

  @override
  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    if (kDebugMode) {
      print('didPopNext ${widget.name}');
    }
  }

  @override
  Widget build(BuildContext context) => widget.child!;
}

