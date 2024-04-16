import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_starter/mvvm/view_model.abs.dart';

import 'app_route_spec.dart';

/// Abstract class representing a view in the MVVM architecture.
abstract class View<VM extends ViewModel> extends StatelessWidget {
  const View(this.viewModel, {super.key});
  final VM viewModel;
}

/// Abstract class representing a screen in the MVVM architecture.
abstract class Screen<VM extends ScreenViewModel> extends View<VM> {
  const Screen(super.viewModel, {super.key});
  
  @override
  build(BuildContext context) {
    // Listen to route spec stream for navigation events.
    listenToRouteSpecStream(context);
    // Create the widget for the screen.
    return createWidget(context);
  }

/// Method to create the widget for the screen.
  Widget createWidget(BuildContext context);

  /// Listens to the stream and automatically routes users according to the
  /// route spec.
  StreamSubscription listenToRouteSpecStream(BuildContext context) {

    // Subscribe to route spec stream.
    return viewModel.routes.listen((appRouteSpec) async {

      // Handle different types of navigation actions.
      switch (appRouteSpec.action) {
        
        // Push to a new route.
        case AppRouteAction.pushTo:
          Navigator.of(context)
              .pushNamed(appRouteSpec.name, arguments: appRouteSpec.arguments);
          break;

        // Pop current route.
        case AppRouteAction.pop:
          Navigator.of(context).pop();
          break;
        
        // Pop routes until a specific route is reached.
        case AppRouteAction.popUntil:
          Navigator.of(context)
              .popUntil((route) => route.settings.name == appRouteSpec.name);
          break;

        // Pop all routes until reaching the root route.
        case AppRouteAction.popUntilRoot:
          Navigator.of(context).popUntil((route) => route.isFirst);
          break;
        
        // Replace current route with a new one.
        case AppRouteAction.replaceWith:
          Navigator.of(context).pushReplacementNamed(appRouteSpec.name,
              arguments: appRouteSpec.arguments);
          break;

        // Replace all routes with a new route.
        case AppRouteAction.replaceAllWith:
          Navigator.of(context).pushNamedAndRemoveUntil(
              appRouteSpec.name, (route) => false,
              arguments: appRouteSpec.arguments);
      }
    });
  }

}
