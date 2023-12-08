import 'dart:async';

import 'package:alo_moves/domain/entity/training_entity.dart';
import 'package:alo_moves/domain/usecase/GetMainContent.dart';
import 'package:alo_moves/ui/main_screen/main_screen_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainScreenCubit extends Cubit<MainScreenStates> {
  GetMainContentUseCase getMainContentUseCase;
  int selectedIndex = 0;
  TrainingEntity? trainingEntity;

  MainScreenCubit({required this.getMainContentUseCase})
      : super(InitialState());

  static MainScreenCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getTrainingData() async {
    emit(LoadingMainState());
    try {
      TrainingEntity response = await getMainContentUseCase.getTrainingInfo();
      trainingEntity = response;
      emit(SuccessMainState(entity: response));
    } on Exception catch (e) {
      emit(ErrorMainState(message: "There is a problem Currently"));
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void changeTab(int index) {
    selectedIndex = index;
    emit(ChangeTabState());
  }
}
