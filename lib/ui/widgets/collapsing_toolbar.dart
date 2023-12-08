import 'package:alo_moves/domain/entity/training_entity.dart';
import 'package:flutter/material.dart';

class CollapsingToolbar extends StatelessWidget {
  final TrainingEntity? trainingEntity;

  const CollapsingToolbar({super.key, required this.trainingEntity});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 240.0,
      floating: false,
      pinned: true,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              trainingEntity?.challengeName ?? '',
              style: const TextStyle(color: Colors.black, fontSize: 28),
            ),
            ...?trainingEntity?.coachNames
                ?.map((e) => Text(e,
                    style: const TextStyle(color: Colors.grey, fontSize: 20)))
                .toList()
          ],
        ),
        background: Image.network(
          "https://images.pexels.com/photos/4148020/pexels-photo-4148020.jpeg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
