import '../entity/training_entity.dart';

abstract class MainRepository {
  Future<TrainingEntity> getTrainingInfo();
}

abstract class MainOnlineDataSource {
  Future<TrainingEntity> fetchTrainingInfo();
}

