import 'package:flutter/material.dart';
import 'package:israfavcisi/auth/login.dart';
import 'package:israfavcisi/auth/signup.dart';
import 'package:israfavcisi/auth/signup2.dart';
import 'package:israfavcisi/auth/signup3.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/widgets/custombutton.dart';
import 'package:israfavcisi/widgets/custombutton2.dart';

class confirmpage extends StatefulWidget {
  const confirmpage({super.key});

  @override
  State<confirmpage> createState() => _confirmpageState();
}

class _confirmpageState extends State<confirmpage> {
  bool private = false;
  bool private1 = false;
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
            height: AppSizes.myHeight(context) / 2.5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(" New Password",
                          style: AppTextStyles.subText!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    obscureText: private,
                    style: AppTextStyles.subText,
                    cursorColor: Appcolors.greenBackground,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              private = !private;
                            });
                          },
                          icon: Icon(private
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(" Confirm New Password",
                          style: AppTextStyles.subText!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    obscureText: private1,
                    style: AppTextStyles.subText,
                    cursorColor: Appcolors.greenBackground,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              private1 = !private1;
                            });
                          },
                          icon: Icon(private
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
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
                CustomButton(text: 'Reset Password', onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }

  Text text2() => Text(
        textAlign: TextAlign.center,
        """ “Yeni parolanızı girin, parolanın son parolanızla aynı olmadığından emin olun.” """,
        style: AppTextStyles.subText2,
      );

  Text text1() {
    return Text(""" Şifrenizi Sıfırlayın """,
        textAlign: TextAlign.center,
        style: AppTextStyles.headline2
            .copyWith(fontWeight: FontWeight.bold, fontSize: 25));
  }
}
