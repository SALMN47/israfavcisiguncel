import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/widgets/custombutton.dart';

class gorusPage extends StatefulWidget {
  const gorusPage({super.key});

  @override
  State<gorusPage> createState() => _gorusPageState();
}

class _gorusPageState extends State<gorusPage> {
  TextEditingController searchController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();
  TextEditingController feedbackController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.blackBackgroundColor,
      appBar: AppBar(
        backgroundColor: Appcolors.blackBackgroundColor,
        iconTheme: const IconThemeData(color: Appcolors.greenBackground),
        title: Text(
          "Görüşlerim",
          style: AppTextStyles.headline1!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: AppSizes.myHeight(context) / 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: AppSizes.myHeight(context) / 60,
              ),
              TextField(
                controller: searchController,
                style: AppTextStyles.subText,
                cursorColor: Appcolors.greenBackground,
                decoration: InputDecoration(
                  hintText: "Search Ratihn Here...",
                  hintStyle: AppTextStyles.subText.copyWith(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFF1B2B3A),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    // borderSide: const BorderSide(
                    //     color: Appcolors.greenBackground, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                        color: Appcolors.greenBackground, width: 2),
                  ),
                  prefixIcon: const Icon(Icons.search,
                      color: Appcolors.greenBackground),
                ),
              ),
              Card(
                color: Color(0xFF1B2B3A),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppSizes.myWidth(context) / 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: AppSizes.myWidth(context) / 7,
                        ),
                        Container(
                            width: AppSizes.myWidth(context) / 10,
                            height: 50,
                            child:
                                Image.asset(("assets/TELEFON AKSESUARI.jpeg"))),
                        SizedBox(
                          width: AppSizes.myWidth(context) / 20,
                        ),
                        Text(
                          "İphone 15 PRO MAX",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      " Rp 24.999.999",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.star,
                              color: Colors.yellowAccent,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.star,
                              color: Colors.yellowAccent,
                            )),
                        IconButton(onPressed: () {}, icon: Icon(Icons.star)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.star)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.star)),
                      ],
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Appcolors.blackBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Container(
                          height: AppSizes.myHeight(context) / 7,
                          child: TextFormField(
                            controller: feedbackController,
                            style: AppTextStyles.subText,
                            cursorColor: Appcolors.greenBackground,
                            decoration: InputDecoration(
                              hintText: "Feedback:",
                              hintStyle: AppTextStyles.subText
                                  .copyWith(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.myHeight(context) / 30,
                    ),
                    CustomButton(text: "Kaydet", onPressed: () {})
                  ],
                ),
              ),
              SizedBox(
                height: AppSizes.myHeight(context) / 20,
              ),
              Card(
                color: Color(0xFF1B2B3A),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppSizes.myWidth(context) / 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: AppSizes.myWidth(context) / 7,
                        ),
                        Container(
                            width: AppSizes.myWidth(context) / 10,
                            height: 50,
                            child:
                                Image.asset(("assets/AKILLI BİLEKLİK2.jpg"))),
                        SizedBox(
                          width: AppSizes.myWidth(context) / 20,
                        ),
                        Text(
                          "AKILLI BİLEKLİK",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      " Rp 32.999.999",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.star,
                              color: Colors.yellowAccent,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.star,
                              color: Colors.yellowAccent,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.star,
                              color: Colors.yellowAccent,
                            )),
                        IconButton(onPressed: () {}, icon: Icon(Icons.star)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.star)),
                      ],
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Appcolors.blackBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Container(
                          height: AppSizes.myHeight(context) / 7,
                          child: TextFormField(
                            controller: feedbackController2,
                            style: AppTextStyles.subText,
                            cursorColor: Appcolors.greenBackground,
                            decoration: InputDecoration(
                              hintText: "Feedback:",
                              hintStyle: AppTextStyles.subText
                                  .copyWith(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.myHeight(context) / 30,
                    ),
                    CustomButton(text: "Düzenle", onPressed: () {})
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
