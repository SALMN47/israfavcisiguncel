import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/widgets/custombutton.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

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
              child: Image.asset("assets/s1.png"),
            ),
            Text(
              "Görünmez İzleri Takip Et!",
              style: AppTextStyles.headline1,
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 40,
            ),
            Text(
              """🌍Her adımımız, doğaya bir iz bırakır. Ürününü aldığımız, tükettiğimiz kaynağı, Hizmetlerimiz... Tüm bunları karbon ayaklarımızı oluşturur.
Ama unutma, izlerimizi silebiliriz! Daha fazla yerde tüketimi, atıklarını azaltma ve israfı önleme ile gezegenimize nefes alabiliriz. Fırsat Avcısı olarak biz, sürdürülebilir bir dünya için buradayız!
💚 Şimdi sen de karbon ayak izini küçültmek için ilk adım at!""",
              style: TextStyle(
                  fontSize: AppSizes.myHeight(context) / 53,
                  color: Colors.white),
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
