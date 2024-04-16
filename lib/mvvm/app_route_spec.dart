import 'package:flutter/material.dart';
import 'package:flutter_app_starter/business_logic/misc/route_names.dart';
import 'package:flutter_app_starter/business_logic/model/bird.dart';
import 'package:flutter_app_starter/business_logic/repositories/bird_repository.dart';
import 'package:flutter_app_starter/screens/bird_detais/bird_details.dart';
import 'package:flutter_app_starter/screens/bird_detais/bird_details_vm.dart';
import 'package:flutter_app_starter/screens/birds_list/birds_list.dart';
import 'package:flutter_app_starter/screens/birds_list/birds_list_vm.dart';
import 'package:provider/provider.dart';

/// Enum defining different types of route actions.
enum AppRouteAction {
  pushTo,
  pop,
  popUntil,
  popUntilRoot,
  replaceWith,
  replaceAllWith
}

/// Class representing a route specification.
class AppRouteSpec {
  /// The name of the route.
  final String name;

  /// Arguments for the route. Arguments for Pop actions are ignored.
  /// Default empty.
  final Map<String, dynamic> arguments;

  /// The action to be performed.
  /// Defaults to `AppRouteAction.pushTo`.
  final AppRouteAction action;

  const AppRouteSpec({
    required this.name,
    this.arguments = const {},
    this.action = AppRouteAction.pushTo,
  });

  /// Constructor for push action.
  const AppRouteSpec.push(this.name, {this.arguments = const {}})
      : action = AppRouteAction.pushTo;

  /// Constructor for pop action.
  const AppRouteSpec.pop()
      : name = '',
        action = AppRouteAction.pop,
        arguments = const {};

  /// Constructor for popUntil action.
  const AppRouteSpec.popUntil({
    required this.name,
    this.arguments = const {},
    this.action = AppRouteAction.popUntil,
  });

  /// Constructor for popUntilRoot action.
  const AppRouteSpec.popUntilRoot()
      : name = '',
        action = AppRouteAction.popUntilRoot,
        arguments = const {};
}

/// Class responsible for handling application routing.
class AppRouter {
  /// Route generator method for generating routes based on route settings.
  Route<dynamic>? route(RouteSettings settings) {
    // Extract arguments from settings or default to an empty map.
    final arguments = settings.arguments as Map<String, dynamic>? ?? {};

    // Handle different routes based on settings.name.
    switch (settings.name) {
      case RouteNames.toBirdsList:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => BirdsList(
                BirdsListVM(birdRepository: context.read<BirdRepository>())));

      case RouteNames.toBirdDetails:
        final Bird bird = arguments["bird"];

        return MaterialPageRoute(
            settings: settings,
            builder: (context) => BirdDetails(BirdDetailsVM(bird)));

      default:
        throw Exception('Route ${settings.name} not implemented');
    }
  }
}
