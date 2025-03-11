import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/widgets/custombutton.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.blackBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(AppSizes.myWidth(context) / 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppSizes.myHeight(context) / 20,
            ),
            Container(
              height: AppSizes.myHeight(context) / 3,
              child: Image.asset("assets/s3.png"),
            ),
            Row(
              //  mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  """Gözümüzün\nÖnündeki\nDeğerler!""",
                  style: AppTextStyles.headline1,
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 80,
            ),
            Text(
              """💰 Daha uygun maliyetlerin karşılanması mümkün! İsraf edilen ürünler, kartvizitler ve ekonomik alışverişin yeni adresi Fırsat Avcısı ile hem cebini hem doğayı koru.
Burada hem kazanır hem de kazanırsın. Daha az harcayarak, daha fazlasını paylaşarak ve ihtiyacın olanı bularak sürdürülebilir bir alışveriş deneyimine katılın!
🚀 Fırsatlar seni bekliyor! Hazır mısın?""",
              style: AppTextStyles.subText,
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 15,
            ),
          ],
        ),
      ),
    );
  }
}
