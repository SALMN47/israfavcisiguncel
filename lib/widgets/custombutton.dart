import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/onboardings/pageindicator.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final int? pageIndex;

  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.width,
      this.height,
      this.borderRadius = 30,
      this.pageIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.myWidth(context) / 1.4, // Default genişlik: tam genişlik
      height: AppSizes.myHeight(context) / 18, // Default yükseklik: 50
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Appcolors.greenBackground,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
