import 'package:flutter/material.dart';
import 'package:israfavcisi/auth/login.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/onboardings/onboarding1.dart';
import 'package:israfavcisi/onboardings/onboarding2.dart';
import 'package:israfavcisi/onboardings/onboarding3.dart';
import 'package:israfavcisi/widgets/custombutton.dart';
import 'package:israfavcisi/widgets/custombutton2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicatorExample extends StatefulWidget {
  @override
  _PageIndicatorExampleState createState() => _PageIndicatorExampleState();
}

class _PageIndicatorExampleState extends State<PageIndicatorExample> {
  final PageController _pageController = PageController();

  void nextpage(params) {}
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Widget getOptionRow() {
      switch (currentPage) {
        case 0:
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: 'Diğer Sayfa →',
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          );
        case 1:
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: CircleBorder(),
                  side: BorderSide(
                    color: Appcolors.greenBackground,
                    width: 2,
                  ),
                ),
                onPressed: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Icon(Icons.arrow_back, color: Appcolors.greenBackground),
              ),
              CustomButton2(
                text: 'Diğer Sayfa →',
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              )
            ],
          );
        case 2:
        default:
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: CircleBorder(),
                  side: BorderSide(
                    color: Appcolors.greenBackground,
                    width: 2,
                  ),
                ),
                onPressed: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Icon(Icons.arrow_back, color: Appcolors.greenBackground),
              ),
              CustomButton2(
                text: 'Şimdi Alışverişe Başlayın →',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              )
            ],
          );
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            controller: _pageController,
            children: [Onboarding1(), Onboarding2(), Onboarding3()],
          ),
          Positioned(
            left: AppSizes.myWidth(context) / 25, // Soldan 50 piksel
            bottom: AppSizes.myHeight(context) / 8, // Alttan 100 piksel
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: CustomizableEffect(
                spacing: AppSizes.myWidth(context) / 50,
                dotDecoration: DotDecoration(
                  width: AppSizes.myWidth(context) / 20,
                  height: AppSizes.myHeight(context) / 80,
                  color: Appcolors.blackBackgroundColor,
                  dotBorder: DotBorder(
                      color: Appcolors.greenBackground,
                      width: 3), // Inactive dot border
                  borderRadius: BorderRadius.circular(6),
                ),
                activeDotDecoration: DotDecoration(
                  width: AppSizes.myWidth(context) / 10,
                  height: AppSizes.myHeight(context) / 80,
                  color: Appcolors.greenBackground,
                  dotBorder: DotBorder(
                      color: Appcolors.greenBackground,
                      width: 3), // Active dot border
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: AppSizes.myHeight(context) / 25,
              child: Container(
                width: AppSizes.myWidth(context),
                height: AppSizes.myHeight(context) / 15,
                child: Container(child: getOptionRow()),
              ))
        ],
      ),
    );
  }
}
