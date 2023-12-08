import 'package:alo_moves/domain/entity/training_entity.dart';
import 'package:alo_moves/ui/main_screen/main_screen_cubit.dart';
import 'package:alo_moves/ui/main_screen/main_screen_states.dart';
import 'package:alo_moves/ui/widgets/collapsing_toolbar.dart';
import 'package:alo_moves/ui/widgets/main_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../di/di.dart';

@injectable
class MainScreen extends StatelessWidget {
  static String ROUTE_NAME = "Main";

  @singleton
  final MainScreenCubit cubit = getIt<MainScreenCubit>();

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainScreenCubit>(
      create: (context) => cubit..getTrainingData(),
      child: BlocConsumer<MainScreenCubit, MainScreenStates>(
        builder: (context, state) {
          if (state is SuccessMainState) {
            return getSuccessBody(context);
          } else if (state is LoadingMainState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ChangeTabState) {
            return getSuccessBody(context);
          }
          return const SizedBox();
        },
        listener: (BuildContext context, MainScreenStates? state) {
          if (state is LoadingMainState) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                content: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (state is ErrorMainState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(
                  'Error',
                ),
                content: Text(
                  state.message,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget getSuccessBody(BuildContext context) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              CollapsingToolbar(
                trainingEntity: MainScreenCubit.get(context).trainingEntity,
              ),
            ];
          },
          body: const MainScreenBody(),
        ),
      );
}
