import 'package:flutter_app_starter/business_logic/model/bird.dart';
import 'package:flutter_app_starter/mvvm/view_model.abs.dart';

class BirdDetailsVM extends ScreenViewModel {
  Bird get bird => _bird;

  final Bird _bird;

  BirdDetailsVM(this._bird) {
    notifyListeners();
  }
}
