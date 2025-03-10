import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

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
              child: Image.asset("assets/s2.png"),
            ),
            Row(
              //  mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  """Gördüğümüz\nBüyük Tehlike!""",
                  style: AppTextStyles.headline1,
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 30,
            ),
            Text(
              """🛒 Her yıl milyarlarca ton gıda, kıyafet ve diğer ürünler çöpe gidiyor. Peki ya bu ürünler tekrar kullanılabilseydi?
İsraf, sadece bütçesine değil, doğaya da zarar verir. Oysa onun fazlalığı, bir başkasının ihtiyacı olabilir. Doğru değerlendirdiğinde, kaybetmek değil fırsat olur!
🔄 İhtiyaç fazlası ürünleri tüketme yerine fırsata çevir! Fırsat Avcısı'nda her şeyin bir ikinci şansı var.""",
              style: AppTextStyles.subText,
            ),
          ],
        ),
      ),
    );
  }
}
