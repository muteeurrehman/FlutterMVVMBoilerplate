import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_starter/business_logic/enums/error_enums.dart';
import 'package:flutter_app_starter/business_logic/misc/constants.dart';
import 'package:http/http.dart' as http;
import 'app_exception.dart';

class APIRepositoryProvider {
  // Factory method to create APIServiceProvider
  static APIRepository create() {
    return _APIRepositoryImpl(
        http.Client(), Constants.apiBaseURL, Constants.apiVersion);
  }
}

abstract class APIRepository {
  // Method to perform a GET request
  Future<dynamic> get(String endPoint,
      {Map<String, dynamic> queryStringParams = const {},
      Map<String, dynamic> bodyParams = const {}});

  // Method to perform a POST request
  Future<dynamic> post(String endPoint,
      {Map<String, dynamic> queryStringParams = const {},
      Map<String, dynamic> bodyParams = const {}});
}

class _APIRepositoryImpl implements APIRepository {
  final String _baseUrl;
  final String _url;

  final http.Client _client;

  // Constructor to initialize _client, _baseUrl, and _url
  _APIRepositoryImpl(this._client, this._baseUrl, this._url);

  @override
  Future<dynamic> get(String endPoint,
      {Map<String, dynamic> queryStringParams = const {},
      Map<String, dynamic> bodyParams = const {}}) async {
    final dynamic responseJson;

    try {
      final url = Uri.https(_baseUrl, _url + endPoint, queryStringParams);
      final response = await _client.get(url);
      responseJson = _returnResponse(response);
    } catch (e) {
      throw ErrorHint('Network Failed');
    }

    return responseJson;
  }

  @override
  Future<dynamic> post(String endPoint,
      {Map<String, dynamic> queryStringParams = const {},
      Map<String, dynamic> bodyParams = const {}}) async {
    final List<Map<String, dynamic>> responseJson;

    try {
      final response = await _client.post(
        Uri.https(_baseUrl, _url + endPoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(bodyParams),
      );

      responseJson = _returnResponse(response);
    } catch (e) {
      rethrow;
    }

    return responseJson;
  }

  // Helper method to handle response and return JSON data
  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        try {
          return json.decode(response.body);
        } on FormatException {
          throw AppException(AppError.communicationToServerFailed);
        }
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
