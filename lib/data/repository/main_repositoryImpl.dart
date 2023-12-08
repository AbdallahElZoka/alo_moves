import 'package:alo_moves/data/remote/api_manager.dart';
import 'package:alo_moves/domain/entity/training_entity.dart';
import 'package:alo_moves/domain/repository/main_repository_contracts.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MainRepository)
class MainRepositoryImpl implements MainRepository {
  MainOnlineDataSource mainOnlineDataSource;

  MainRepositoryImpl({required this.mainOnlineDataSource});

  @override
  Future<TrainingEntity> getTrainingInfo() {
    // checking Internet Connection strategy for example
    if (true) {
      return mainOnlineDataSource.fetchTrainingInfo();
    }
  }
}
