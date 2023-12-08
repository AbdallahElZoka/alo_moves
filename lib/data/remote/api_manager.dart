import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:alo_moves/data/model/TrainingModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../../core/api/error/errors.dart';

class ApiManager {
  static Future<TrainingModel> getTraining() async {
    try {
      var response =
          await rootBundle.loadString("assets/json/training_response.json");
      var trainingModelResponse = TrainingModel.fromJson(jsonDecode(response));
      return trainingModelResponse;
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      throw NetworkException("Timeout: please check internet connection");
    } on HttpException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      throw NetworkException("Http exception: "
          "couldn't reach server");
    }
  }
}
