import 'package:alo_moves/ui/main_screen/main_screen_cubit.dart';
import 'package:alo_moves/ui/widgets/tab.dart';
import 'package:flutter/material.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        isScrollable: false,
        tabs: [
          TabSelector(
            selected: MainScreenCubit.get(context).selectedIndex == 0,
            title: "OVERVIEW",
          ),
          TabSelector(
            selected: MainScreenCubit.get(context).selectedIndex == 1,
            title: "CLASSES",
          ),
          TabSelector(
            selected: MainScreenCubit.get(context).selectedIndex == 2,
            title: "COMMUNITY",
          ),
        ],
        onTap: (newIndex) {
          MainScreenCubit.get(context).changeTab(newIndex);
        },
      ),
    );
  }
}
