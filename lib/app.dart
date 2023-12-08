import 'package:alo_moves/ui/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alo Moves',
      debugShowCheckedModeBanner: false,
      routes: {
        MainScreen.ROUTE_NAME: (context) => MainScreen(),
      },
      initialRoute: MainScreen.ROUTE_NAME,
    );
  }
}
