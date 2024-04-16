import 'package:flutter_app_starter/business_logic/enums/app_eums.dart';
import 'package:flutter_app_starter/business_logic/model/bird.dart';
import 'package:flutter_app_starter/business_logic/repositories/api_repository.dart';

/// A provider class for creating instances of [BirdRepository].
class BirdRepositoryProvider {
  /// Creates a [BirdRepository] instance with the provided [apiRepository].
  static BirdRepository create({
    required APIRepository apiRepository,
  }) {
    return _BirdRepositoryImpl(apiRepository: apiRepository);
  }
}

/// Abstract class defining methods for interacting with bird data.
abstract class BirdRepository {
  /// Fetches a list of birds.
  Future<List<Bird>> getBirds();
}

/// Implementation of [BirdRepository] interface.
class _BirdRepositoryImpl implements BirdRepository {
  final APIRepository apiRepository;

  /// Constructor for [_BirdRepositoryImpl].
  _BirdRepositoryImpl({required this.apiRepository});

  @override
  Future<List<Bird>> getBirds() async {
    try {
      // Fetch bird data from the API
      final jsonResponse = await apiRepository.get(
        APIEndPoint.birds.toString(),
        queryStringParams: {},
      );

      // Parse JSON response into a list of birds
      final birdsJsonList = jsonResponse as List<dynamic>;

      return List<Bird>.from(
        birdsJsonList.map((json) => Bird.fromJson(json)),
      );
    } catch (e) {
      // Propagate the error
      rethrow;
    }
  }
}
