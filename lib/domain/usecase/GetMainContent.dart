import 'package:alo_moves/domain/repository/main_repository_contracts.dart';
import 'package:injectable/injectable.dart';

import '../entity/training_entity.dart';

@injectable
class GetMainContentUseCase {
  MainRepository mainRepository;

  GetMainContentUseCase({required this.mainRepository});

  Future<TrainingEntity> getTrainingInfo() => mainRepository.getTrainingInfo();
}
