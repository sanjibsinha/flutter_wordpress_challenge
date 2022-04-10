import 'package:flutter/material.dart';
import '../controller/dashboard_home.dart';
import '../model/happy_theme.dart';

HappyTheme happyTheme = HappyTheme();

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter WordPress Challenge',
      theme: happyTheme.buildTheme(),
      home: const DashBoardHome(),
    );
  }
}
