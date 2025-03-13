import 'package:flutter/material.dart';
import 'package:israfavcisi/auth/signup3.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/widgets/custombutton.dart';

class SignUp2 extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String gender;

  const SignUp2({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.gender,
  }) : super(key: key);

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

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
                        _buildLabel("E-mail"),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            controller: emailController,
                            style: AppTextStyles.subText,
                            cursorColor: Appcolors.greenBackground,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                    color: Appcolors.greenBackground, width: 2),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: AppSizes.myHeight(context) / 40),
                        _buildLabel("Telefon"),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            controller: phoneController,
                            style: AppTextStyles.subText,
                            cursorColor: Appcolors.greenBackground,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                    color: Appcolors.greenBackground, width: 2),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: AppSizes.myHeight(context) / 40),
                        _buildLabel("Adres"),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            controller: addressController,
                            style: AppTextStyles.subText,
                            cursorColor: Appcolors.greenBackground,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                    color: Appcolors.greenBackground, width: 2),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: AppSizes.myHeight(context) / 30),
                        Row(
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: const CircleBorder(),
                                side: BorderSide(
                                    color: Appcolors.greenBackground, width: 2),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back,
                                  color: Appcolors.greenBackground),
                            ),
                            SizedBox(width: AppSizes.myWidth(context) / 20),
                            CustomButton(
                              text: "İlerleyin",
                              onPressed: () {
                                if (emailController.text.isEmpty ||
                                    phoneController.text.isEmpty ||
                                    addressController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Lütfen tüm alanları doldurun.")),
                                  );
                                  return;
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp3(
                                      firstName: widget.firstName,
                                      lastName: widget.lastName,
                                      gender: widget.gender,
                                      email: emailController.text.trim(),
                                      phone: phoneController.text.trim(),
                                      address: addressController.text.trim(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.myHeight(context) / 30),
                      ],
                    ),
                  )),
            ),
          ),
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

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 8, 0),
      child: Row(
        children: [
          Text(text,
              style:
                  AppTextStyles.subText!.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
