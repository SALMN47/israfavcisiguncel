import 'package:flutter/material.dart';
import 'package:israfavcisi/auth/login.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/backendservices/auth_services.dart';
import 'package:israfavcisi/homescreen.dart';
import 'package:israfavcisi/widgets/custombutton2.dart';

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

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: Appcolors.greenBackground,
      body: Column(
        children: [
          Text(
            """ "Bir Adım, Büyük Bir Fark Yaratır!" """,
            textAlign: TextAlign.center,
            style: AppTextStyles.headline2!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(height: AppSizes.myHeight(context) / 60),
          Expanded(
            child: Card(
              color: Appcolors.blackBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Password Field
                    TextField(
                      controller: passwordController,
                      obscureText: private,
                      decoration: InputDecoration(
                        labelText: "Şifre",
                        suffixIcon: IconButton(
                          icon: Icon(private
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              private = !private;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      style: AppTextStyles.subText,
                    ),
                    SizedBox(height: 16),
                    // Confirm Password Field
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: privateConfirm,
                      decoration: InputDecoration(
                        labelText: "Şifre Tekrarı",
                        suffixIcon: IconButton(
                          icon: Icon(privateConfirm
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              privateConfirm = !privateConfirm;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      style: AppTextStyles.subText,
                    ),
                    SizedBox(height: AppSizes.myHeight(context) / 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Geri Dön Butonu
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
                        // Kayıt Butonu
                        CustomButton2(
                          text: "Şimdi Kaydolun >",
                          onPressed: registerUser,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hesabınız var mı?", style: AppTextStyles.subText),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(" Giriş yap",
                    style: AppTextStyles.subText!.copyWith(
                        color: Appcolors.greenBackground,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ],
      ),
    );
  }

  void registerUser() async {
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Lütfen şifre alanlarını doldurun.")));
      return;
    }
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Şifreler eşleşmiyor.")));
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
