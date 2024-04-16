import 'package:flutter_app_starter/business_logic/misc/route_names.dart';
import 'package:flutter_app_starter/business_logic/model/bird.dart';
import 'package:flutter_app_starter/business_logic/repositories/bird_repository.dart';
import 'package:flutter_app_starter/mvvm/app_route_spec.dart';
import 'package:flutter_app_starter/mvvm/view_model.abs.dart';

/// ViewModel for managing the list of birds.
class BirdsListVM extends ScreenViewModel {

  List<Bird> get birds => _birds; // Getter for the list of birds

  List<Bird> _birds = []; // List of birds

  final BirdRepository birdRepository; // Repository for fetching bird data

  /// Constructor for BirdsListVM.
  BirdsListVM({required this.birdRepository}) {
    // Fetch birds data when the ViewModel is initialized
    getBirds();
  }

  /// Method to fetch birds data from the repository.
  getBirds() async {
    // Retrieve birds data from the repository
    _birds = await birdRepository.getBirds();
    // Notify listeners that the data has changed
    notifyListeners();
  }

  onBirdSelected(int index) {
    _navigateToBirdDetails(birds[index]);
  }

  _navigateToBirdDetails(Bird bird) {
    routesSubject.add(
        AppRouteSpec.push(RouteNames.toBirdDetails, arguments: {"bird": bird}));
  }

}
