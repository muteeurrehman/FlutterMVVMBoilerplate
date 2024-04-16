import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_starter/mvvm/app_route_spec.dart';
import 'package:flutter_app_starter/mvvm/value_notifier.dart';
import 'package:rxdart/rxdart.dart';

/// Base class for ViewModels.
abstract class ViewModel extends ChangeNotifier {
  /// Initialization method, to be overridden by subclasses if necessary.
  init() {}

  @override
  @mustCallSuper
  void dispose();
}

/// Base class for ViewModels associated with screens.
abstract class ScreenViewModel extends ViewModel {
  /// Stream controller for routing events.
  final routesSubject = PublishSubject<AppRouteSpec>();

  /// Stream of routing events.
  Stream<AppRouteSpec> get routes => routesSubject;

  /// Notifier for indicating loading state.
  AppValueNotifier<bool> _isLoading = AppValueNotifier<bool>(false);

  /// Notifier for displaying error messages.
  AppValueNotifier<String> _errorString = AppValueNotifier<String>('');

  /// Getter for the error message notifier.
  AppValueNotifier<String> get errorString => _errorString;

  /// Getter for the loading state notifier.
  AppValueNotifier<bool> get isLoading => _isLoading;

  /// Setter for the error message notifier.
  @protected
  set errorString(AppValueNotifier<String> value) {
    _errorString = value;
  }

  /// Setter for the loading state notifier.
  @protected
  set isLoading(AppValueNotifier<bool> value) {
    _isLoading = value;
  }

  /// Method to remove error message.
  removeError() {
    errorString.value = "";
  }

  @override
  @mustCallSuper
  void dispose() {
    routesSubject.close();
    super.dispose();
  }
}
