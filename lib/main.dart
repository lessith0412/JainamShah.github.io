import 'package:flutter/material.dart';
import 'package:portfolio/HomeScreen.dart';
import 'package:portfolio/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: kDefaultInputDecorationTheme,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
