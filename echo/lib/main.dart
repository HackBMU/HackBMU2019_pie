import 'package:echo/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
   debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}