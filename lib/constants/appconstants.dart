import 'package:flutter/material.dart';

class Appcolors {
  static const Color greenBackground = Color(0xFFa2ff06);
  static const Color secondaryColor = Color(0xFF03DAC5);
  static const Color blackBackgroundColor = Color(0xFF0d1b29);
}

class AppSizes {
  static double myHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double myWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
}

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle subText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static const TextStyle subText2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
}
