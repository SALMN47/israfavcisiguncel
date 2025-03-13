import 'package:flutter/material.dart';
import 'package:israfavcisi/auth/login.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/backendservices/auth_services.dart';
import 'package:israfavcisi/homescreen.dart';
import 'package:israfavcisi/widgets/custombutton.dart';

class SignUp3 extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String gender;
  final String email;
  final String phone;
  final String address;

  const SignUp3({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.email,
    required this.phone,
    required this.address,
  }) : super(key: key);

  @override
  State<SignUp3> createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool private = true;
  bool privateConfirm = true;
  bool isVerified = false;
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.greenBackground,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Column(
        children: [
          Text(
            "\"Bir Adım, Büyük Bir Fark Yaratır!\"",
            textAlign: TextAlign.center,
            style: AppTextStyles.headline2!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(height: AppSizes.myHeight(context) / 90),
          Text(
            "🌍Küçük değişiklikler büyük sonuçlar doğurur. Tüketim yeteneklerini değiştir, dünyaya katkı sağla! ✨",
            textAlign: TextAlign.center,
            style: AppTextStyles.subText2,
          ),
          SizedBox(height: AppSizes.myHeight(context) / 60),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Appcolors.blackBackgroundColor,
              child: Card(
                  margin: EdgeInsets.zero,
                  color: Appcolors.blackBackgroundColor,
                  child: Container(
                    height: AppSizes.myHeight(context) / 1.6,
                    width: AppSizes.myWidth(context),
                    child: Column(
                      children: [
                        _buildLabel("Şifre"),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            controller: passwordController,
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
                                icon: Icon(
                                  private
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Appcolors.greenBackground,
                                ),
                              ),
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
                        _buildLabel("Şifre Tekrarı"),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            controller: confirmPasswordController,
                            obscureText: privateConfirm,
                            style: AppTextStyles.subText,
                            cursorColor: Appcolors.greenBackground,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    privateConfirm = !privateConfirm;
                                  });
                                },
                                icon: Icon(
                                  privateConfirm
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Appcolors.greenBackground,
                                ),
                              ),
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
                        Row(
                          children: [
                            Checkbox(
                              value: isVerified,
                              onChanged: (bool? value) {
                                setState(() {
                                  isVerified = value ?? false;
                                });
                              },
                              activeColor: Appcolors.greenBackground,
                            ),
                            Expanded(
                              child: Text(
                                'Gizlilik Politikasını ve Hüküm ve Koşulları kabul ediyorum',
                                style: AppTextStyles.subText,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.myHeight(context) / 40),
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
                              text: "Şimdi Kaydolun >",
                              onPressed: registerUser,
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.myHeight(context) / 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hesabınız var mı?",
                                style: AppTextStyles.subText),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Text(
                                " Giriş yap",
                                style: AppTextStyles.subText!.copyWith(
                                  color: Appcolors.greenBackground,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
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

  void registerUser() async {
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Lütfen şifre alanlarını doldurun.")),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Şifreler eşleşmiyor.")),
      );
      return;
    }

    if (!isVerified) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Lütfen gizlilik politikasını kabul edin.")),
      );
      return;
    }

    final result = await authService.registerUser(
      firstName: widget.firstName,
      lastName: widget.lastName,
      gender: widget.gender,
      email: widget.email,
      phone: widget.phone,
      address: widget.address,
      password: password,
    );

    if (result['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['message']),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
        ),
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['message']),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
