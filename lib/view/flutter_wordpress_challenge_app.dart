import 'package:flutter/material.dart';
import '../model/happy_theme.dart';
import 'flutter_wordpress_home_page.dart';

HappyTheme happyTheme = HappyTheme();

class FlutterWordPressChallengeApp extends StatelessWidget {
  const FlutterWordPressChallengeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter WordPress Challenge',
      theme: happyTheme.buildTheme(),
      home:
          const FlutterWordPressHomePage(title: 'Flutter WordPress Challenge'),
    );
  }
}
