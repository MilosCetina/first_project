import 'package:flutter/material.dart';

import '../pages/detail_page.dart';
import '../pages/home_page.dart';
import '../pages/main_page.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
      routes: {
        MainPage.routeName: (ctx) => MainPage(),
        DetailPage.routeName: (ctx) => DetailPage(),
      },
    );
  }
}
