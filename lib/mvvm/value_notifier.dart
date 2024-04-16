import 'package:flutter/material.dart';

/// It can be used as an alternative to changenotifier.
/// It will automatically call notify listerner when values changes.
/// It will help reducing the number of times of writing notifyListener in code.
class AppValueNotifier<T> extends ChangeNotifier {
  T _value; // The encapsulated value of type T.

  // Constructor to initialize the ValueNotifier with an initial value.
  AppValueNotifier(this._value);

  // Getter to retrieve the current value.
  T get value => _value;

  // Setter to update the value.
  set value(T newValue) {
    // Check if the new value is different from the current value.
    if (_value != newValue) {
      _value = newValue; // Update the value.
      notifyListeners(); // Notify listeners of the change.
    }
  }
}
