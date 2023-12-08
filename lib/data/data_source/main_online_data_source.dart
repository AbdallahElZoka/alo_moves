import 'package:alo_moves/data/remote/api_manager.dart';
import 'package:alo_moves/domain/entity/training_entity.dart';
import 'package:alo_moves/domain/repository/main_repository_contracts.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MainOnlineDataSource)
class MainOnlineDataSourceImpl implements MainOnlineDataSource {
  @override
  Future<TrainingEntity> fetchTrainingInfo() async {
    try {
      var response = await ApiManager.getTraining();
      return response.toEntity();
    } on Exception {
      rethrow;
    }
  }
}
