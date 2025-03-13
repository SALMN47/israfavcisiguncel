import 'package:flutter/material.dart';
import 'package:israfavcisi/bottomapp.dart';
import 'package:israfavcisi/homescreen.dart';
import 'package:israfavcisi/onboardings/onboarding1.dart';
import 'package:israfavcisi/onboardings/pageindicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Homepage()
        //   PageIndicatorExample(),
        );
  }
}
