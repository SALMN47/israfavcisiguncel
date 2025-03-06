import 'package:flutter/material.dart';
import 'package:israfavcisi/auth/login.dart';
import 'package:israfavcisi/auth/signup.dart';
import 'package:israfavcisi/auth/signup2.dart';
import 'package:israfavcisi/auth/signup3.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/widgets/custombutton.dart';
import 'package:israfavcisi/widgets/custombutton2.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({super.key});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
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
            height: AppSizes.myHeight(context) / 60,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Appcolors.blackBackgroundColor,
              child: Card(
                color: Appcolors.blackBackgroundColor,
                child: Container(
                  height: AppSizes.myHeight(context) / 1.6,
                  width: AppSizes.myWidth(context),
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppSizes.myHeight(context) / 10,
                      ),
                      text11(),
                      field1(),
                      text111(),
                      field1(),
                      text112(),
                      field1(),
                      SizedBox(
                        height: AppSizes.myHeight(context) / 40,
                      ),
                      Row(
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Icon(Icons.arrow_back,
                                color: Appcolors.greenBackground),
                          ),
                          CustomButton2(
                              text: "İlerleyin",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp3()));
                              }),
                        ],
                      ),
                      SizedBox(
                        height: AppSizes.myHeight(context) / 30,
                      ),
                      SizedBox(
                        height: AppSizes.myHeight(context) / 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox facebookbutton(BuildContext context) {
    return SizedBox(
      width: AppSizes.myWidth(context) / 1.2, // Default genişlik: tam genişlik
      height: AppSizes.myHeight(context) / 18, // Default yükseklik: 50
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1877f2),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: Image.asset("assets/logo/f1.png"),
              ),
              Text(
                "Login with Facebook",
                style: AppTextStyles.subText,
              )
            ],
          )),
    );
  }

  SizedBox googlebutton(BuildContext context) {
    return SizedBox(
      width: AppSizes.myWidth(context) / 1.2, // Default genişlik: tam genişlik
      height: AppSizes.myHeight(context) / 18, // Default yükseklik: 50
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey[900],
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: Image.asset("assets/logo/g1.png"),
              ),
              Text(
                "Login with Google",
                style: AppTextStyles.subText,
              )
            ],
          )),
    );
  }

  Row text14(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: AppSizes.myWidth(context) / 20),
        Container(
          width: AppSizes.myWidth(context) / 5,
          child: Divider(
            color: Colors.grey[600],
            thickness: 1,
          ),
        ),
        SizedBox(width: AppSizes.myWidth(context) / 40),
        Text("Try another method",
            style: AppTextStyles.subText!.copyWith(fontSize: 15)),
        SizedBox(width: AppSizes.myWidth(context) / 40),
        Container(
          width: AppSizes.myWidth(context) / 5,
          child: Divider(
            color: Colors.grey[600],
            thickness: 1,
          ),
        ),
        SizedBox(width: AppSizes.myWidth(context) / 20),
      ],
    );
  }

  Row text13() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hesabınız var mı ? ",
          style: AppTextStyles.subText,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Text(
            " Giriş yap",
            style: AppTextStyles.subText!.copyWith(
                color: Appcolors.greenBackground, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Padding field2() {
    return Padding(
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
              icon: Icon(private ? Icons.visibility_off : Icons.visibility),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide:
                    BorderSide(color: Appcolors.greenBackground, width: 2)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide:
                    BorderSide(color: Appcolors.greenBackground, width: 2))),
      ),
    );
  }

  Padding text12() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 8, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(" Password",
              style:
                  AppTextStyles.subText!.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Padding field1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
      child: TextField(
        style: AppTextStyles.subText,
        cursorColor: Appcolors.greenBackground,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide:
                    BorderSide(color: Appcolors.greenBackground, width: 2)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide:
                    BorderSide(color: Appcolors.greenBackground, width: 2))),
      ),
    );
  }

  Padding text11() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 8, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(" E-mail",
              style:
                  AppTextStyles.subText!.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Padding text111() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 8, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(" Phone Number",
              style:
                  AppTextStyles.subText!.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Padding text112() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 8, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(" Adress",
              style:
                  AppTextStyles.subText!.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Text text2() => Text(
        textAlign: TextAlign.center,
        """ 🌱 Fazlalık sandığın şey, bir başkasının ihtiyacı olabilir. İsrafı önle, fırsatları değerlendirin! 🚀 """,
        style: AppTextStyles.subText2,
      );

  Text text1() {
    return Text(""" "Kaybedilen Değerleri Geri Kazan!"  """,
        textAlign: TextAlign.center,
        style: AppTextStyles.headline2
            .copyWith(fontWeight: FontWeight.bold, fontSize: 25));
  }
}
