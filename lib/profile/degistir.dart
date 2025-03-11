import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/widgets/custombutton.dart';

class degistirPage extends StatefulWidget {
  const degistirPage({super.key});

  @override
  State<degistirPage> createState() => _degistirPageState();
}

class _degistirPageState extends State<degistirPage> {
  bool private1 = false;
  bool private2 = false;
  bool private3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appcolors.blackBackgroundColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Appcolors.greenBackground),
          backgroundColor: Colors.transparent,
          title: Text(
            "Şifreni Değiştir",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Eski Şifre",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.myHeight(context) / 60),
                  ),
                  SizedBox(
                    height: AppSizes.myHeight(context) / 50,
                  ),
                  TextField(
                    obscureText: private1,
                    style: AppTextStyles.subText,
                    cursorColor: Appcolors.greenBackground,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF1B2B3A),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              private1 = !private1;
                            });
                          },
                          icon: Icon(private1
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
                  SizedBox(
                    height: AppSizes.myHeight(context) / 20,
                  ),
                  Text(
                    "Yeni Şifre",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.myHeight(context) / 60),
                  ),
                  SizedBox(
                    height: AppSizes.myHeight(context) / 50,
                  ),
                  TextField(
                    obscureText: private2,
                    style: AppTextStyles.subText,
                    cursorColor: Appcolors.greenBackground,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF1B2B3A),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              private2 = !private2;
                            });
                          },
                          icon: Icon(private2
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
                  SizedBox(
                    height: AppSizes.myHeight(context) / 40,
                  ),
                  Text(
                    "Yeni Şifre Tekrarı",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.myHeight(context) / 60),
                  ),
                  SizedBox(
                    height: AppSizes.myHeight(context) / 50,
                  ),
                  TextField(
                    obscureText: private3,
                    style: AppTextStyles.subText,
                    cursorColor: Appcolors.greenBackground,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF1B2B3A),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              private3 = !private3;
                            });
                          },
                          icon: Icon(private3
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
                ],
              ),
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 30,
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(AppSizes.myHeight(context) / 30),
          child: CustomButton(text: "Değişiklikleri Kaydet", onPressed: () {}),
        ));
  }
}
