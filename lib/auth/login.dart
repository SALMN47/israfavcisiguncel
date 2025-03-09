import 'package:flutter/material.dart';
import 'package:israfavcisi/auth/reset.dart';
import 'package:israfavcisi/auth/signup.dart';
import 'package:israfavcisi/backendservices/auth_services.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/widgets/custombutton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool private = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
            height: AppSizes.myHeight(context) / 20,
          ),
          text2(),
          SizedBox(
            height: AppSizes.myHeight(context) / 30,
          ),
          Expanded(
            child: Container(
              color: Appcolors.blackBackgroundColor,
              width: AppSizes.myWidth(context),
              child: Card(
                color: Appcolors.blackBackgroundColor,
                child: Container(
                  height: AppSizes.myHeight(context) / 1.6,
                  width: AppSizes.myWidth(context) * 1.2,
                  child: Column(
                    children: [
                      text11(),
                      field1(),
                      text12(),
                      field2(),
                      SizedBox(
                        height: AppSizes.myHeight(context) / 40,
                      ),
                      CustomButton(
                        text: "Login",
                        onPressed: () async {
                          String email = emailController.text.trim();
                          String password = passwordController.text.trim();

                          if (email.isEmpty || password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text("Lütfen e-posta ve şifre girin.")),
                            );
                            return;
                          }

                          AuthService authService = AuthService();
                          final result =
                              await authService.loginUser(email, password);

                          if (result["success"]) {
                            // Giriş başarılıysa SnackBar göster
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text("Giriş başarılı! Hoş geldiniz 🎉"),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 2),
                              ),
                            );

                            // Kullanıcıyı yönlendir (Örneğin ana sayfaya "/home" yönlendirebilirsiniz)
                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.pushReplacementNamed(context, "/home");
                            });
                          } else {
                            // Giriş başarısızsa hata mesajı göster
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(result["message"]),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: AppSizes.myHeight(context) / 40,
                      ),
                      text13(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => resetpage()));
                        },
                        child: Text(
                          " Forgot Password?",
                          style: AppTextStyles.subText!.copyWith(
                              color: Appcolors.greenBackground,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: AppSizes.myHeight(context) / 80,
                      ),
                      text14(context),
                      SizedBox(
                        height: AppSizes.myHeight(context) / 130,
                      ),
                      googlebutton(context),
                      SizedBox(
                        height: AppSizes.myHeight(context) / 100,
                      ),
                      facebookbutton(context),
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
          "Dont't have an account? ",
          style: AppTextStyles.subText,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: Text(
            " Sign Up",
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
        controller: passwordController, // Burada ekledik!
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
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: emailController,
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
          Text(" Email",
              style:
                  AppTextStyles.subText!.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Text text2() => Text("🔓 Haydi başlayalım!");

  Text text1() {
    return Text(""" "Daha az harcayarak daha çok kazan"  """,
        textAlign: TextAlign.center,
        style: AppTextStyles.headline2!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 25));
  }
}
