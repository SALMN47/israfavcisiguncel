import 'package:flutter/material.dart';
import 'package:israfavcisi/auth/confirmreset.dart';
import 'package:israfavcisi/auth/login.dart';
import 'package:israfavcisi/auth/signup.dart';
import 'package:israfavcisi/auth/signup2.dart';
import 'package:israfavcisi/auth/signup3.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/widgets/custombutton.dart';
import 'package:israfavcisi/widgets/custombutton2.dart';

class resetpage extends StatefulWidget {
  const resetpage({super.key});

  @override
  State<resetpage> createState() => _resetpageState();
}

class _resetpageState extends State<resetpage> {
  bool private = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Appcolors.greenBackground,
      body: Column(
        children: [
          text1(),
          SizedBox(
            height: AppSizes.myHeight(context) / 90,
          ),
          text2(),
          SizedBox(
            height: AppSizes.myHeight(context) / 10,
          ),
          Container(
            color: Appcolors.blackBackgroundColor,
            width: double.infinity,
            height: AppSizes.myHeight(context) / 4,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(" Email",
                          style: AppTextStyles.subText!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                  child: TextField(
                    style: AppTextStyles.subText,
                    cursorColor: Appcolors.greenBackground,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: Appcolors.greenBackground, width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: Appcolors.greenBackground, width: 2))),
                  ),
                ),
                SizedBox(
                  height: AppSizes.myHeight(context) / 30,
                ),
                CustomButton(
                    text: 'Confirm',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const confirmpage(),
                        ),
                      );
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Text text2() => Text(
        textAlign: TextAlign.center,
        """ “E-postanızı girin ve size şifrenizi sıfırlamanız için bir bağlantı gönderelim" """,
        style: AppTextStyles.subText2,
      );

  Text text1() {
    return Text("""Şifremi Unuttum """,
        textAlign: TextAlign.center,
        style: AppTextStyles.headline2
            .copyWith(fontWeight: FontWeight.bold, fontSize: 25));
  }
}
