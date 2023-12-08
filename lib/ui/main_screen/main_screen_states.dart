import 'package:alo_moves/domain/entity/training_entity.dart';

abstract class MainScreenStates {}

class InitialState implements MainScreenStates {}

class LoadingMainState implements MainScreenStates {}

class ErrorMainState implements MainScreenStates {
  String message;

  ErrorMainState({required this.message});
}

class SuccessMainState implements MainScreenStates {
  TrainingEntity entity;

  SuccessMainState({required this.entity});
}

class ChangeTabState implements MainScreenStates {}
