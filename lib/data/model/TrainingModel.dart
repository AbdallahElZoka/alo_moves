import 'dart:convert';

import 'package:alo_moves/domain/entity/training_entity.dart';

/// challenge_name : "The Challenge"
/// coach_names : ["Josh Kramer"]

TrainingModel trainingModelFromJson(String str) =>
    TrainingModel.fromJson(json.decode(str));

String trainingModelToJson(TrainingModel data) => json.encode(data.toJson());

class TrainingModel {
  TrainingModel({
    String? challengeName,
    List<String>? coachNames,
  }) {
    _challengeName = challengeName;
    _coachNames = coachNames;
  }

  TrainingModel.fromJson(dynamic json) {
    _challengeName = json['challenge_name'];
    _coachNames =
        json['coach_names'] != null ? json['coach_names'].cast<String>() : [];
  }

  String? _challengeName;
  List<String>? _coachNames;

  TrainingModel copyWith({
    String? challengeName,
    List<String>? coachNames,
  }) =>
      TrainingModel(
        challengeName: challengeName ?? _challengeName,
        coachNames: coachNames ?? _coachNames,
      );

  String? get challengeName => _challengeName;

  List<String>? get coachNames => _coachNames;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['challenge_name'] = _challengeName;
    map['coach_names'] = _coachNames;
    return map;
  }

  TrainingEntity toEntity() =>
      TrainingEntity(challengeName: _challengeName, coachNames: coachNames);
}
