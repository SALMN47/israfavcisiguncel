import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';

class sepetPage extends StatefulWidget {
  const sepetPage({super.key});

  @override
  State<sepetPage> createState() => _sepetPageState();
}

class _sepetPageState extends State<sepetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.blackBackgroundColor,
      appBar: AppBar(
        backgroundColor: Appcolors.blackBackgroundColor,
        iconTheme: const IconThemeData(color: Appcolors.greenBackground),
        title: Text(
          "Sepetim",
          style: AppTextStyles.headline1!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.myHeight(context) / 30),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: AppSizes.myHeight(context) / 50,
            ),
            TextField(
              style: AppTextStyles.subText,
              cursorColor: Appcolors.greenBackground,
              decoration: InputDecoration(
                hintText: "Sepetimde ara...",
                hintStyle: AppTextStyles.subText.copyWith(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF1B2B3A),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                      color: Appcolors.greenBackground, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                      color: Appcolors.greenBackground, width: 2),
                ),
                prefixIcon:
                    const Icon(Icons.search, color: Appcolors.greenBackground),
              ),
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: AppSizes.myWidth(context) / 2.3,
                  height: AppSizes.myHeight(context) / 4.5,
                  child: Card(
                    color: Color(0xFF1B2B3A),
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppSizes.myHeight(context) / 60,
                        ),
                        Image.asset("assets/ip5.png"),
                        Text("Iphone 15 Pro Max",
                            style: AppTextStyles.subText!.copyWith(
                                color: Colors.white,
                                fontSize: AppSizes.myHeight(context) / 70,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "̶R̶p̶2̶4̶.̶9̶9̶9̶.̶0̶0̶",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Spacer(),
                        Container(
                          child: Text(
                            style: TextStyle(color: Colors.white),
                            "10% OFF",
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      AppSizes.myHeight(context) / 30),
                                  bottomRight: Radius.circular(
                                      AppSizes.myHeight(context) / 30))),
                          height: 20,
                          width: AppSizes.myWidth(context) / 2.5,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: AppSizes.myWidth(context) / 2.3,
                  height: AppSizes.myHeight(context) / 4.5,
                  child: Card(
                    color: Color(0xFF1B2B3A),
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppSizes.myHeight(context) / 60,
                        ),
                        Container(
                            width: AppSizes.myWidth(context) / 4,
                            child: Image.asset("assets/ip2.png")),
                        Text(" Macbook Air M2",
                            style: AppTextStyles.subText!.copyWith(
                                color: Colors.white,
                                fontSize: AppSizes.myHeight(context) / 70,
                                fontWeight: FontWeight.bold)),
                        Text(
                          " R̶p̶1̶9̶.̶9̶9̶9̶.̶0̶0̶0",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Spacer(),
                        Container(
                          child: Text(
                            style: TextStyle(color: Colors.white),
                            "15% OFF",
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      AppSizes.myHeight(context) / 30),
                                  bottomRight: Radius.circular(
                                      AppSizes.myHeight(context) / 30))),
                          height: 20,
                          width: AppSizes.myWidth(context) / 2.5,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: CircleBorder(),
                          side: BorderSide(
                            color: Appcolors.greenBackground,
                            width: 1,
                          ),
                        ),
                        onPressed: () {},
                        child: Icon(Icons.remove,
                            color: Appcolors.greenBackground),
                      ),
                      Text("3",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: CircleBorder(),
                          side: BorderSide(
                            color: Appcolors.greenBackground,
                            width: 1,
                          ),
                        ),
                        onPressed: () {},
                        child:
                            Icon(Icons.add, color: Appcolors.greenBackground),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                    ],
                  ),
                  height: AppSizes.myHeight(context) / 30,
                  width: AppSizes.myWidth(context) / 2.7,
                ),
                Container(
                  height: AppSizes.myHeight(context) / 30,
                  width: AppSizes.myWidth(context) / 2.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: CircleBorder(),
                          side: BorderSide(
                            color: Appcolors.greenBackground,
                            width: 1,
                          ),
                        ),
                        onPressed: () {},
                        child: Icon(Icons.remove,
                            color: Appcolors.greenBackground),
                      ),
                      Text("2",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: CircleBorder(),
                          side: BorderSide(
                            color: Appcolors.greenBackground,
                            width: 1,
                          ),
                        ),
                        onPressed: () {},
                        child:
                            Icon(Icons.add, color: Appcolors.greenBackground),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: AppSizes.myWidth(context) / 2.3,
                  height: AppSizes.myHeight(context) / 4.5,
                  child: Card(
                    color: Color(0xFF1B2B3A),
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppSizes.myHeight(context) / 60,
                        ),
                        Image.asset("assets/ip5.png"),
                        Text("Iphone 15 Pro Max",
                            style: AppTextStyles.subText!.copyWith(
                                color: Colors.white,
                                fontSize: AppSizes.myHeight(context) / 70,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "̶R̶p̶2̶4̶.̶9̶9̶9̶.̶0̶0̶",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Spacer(),
                        Container(
                          child: Text(
                            style: TextStyle(color: Colors.white),
                            "10% OFF",
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      AppSizes.myHeight(context) / 30),
                                  bottomRight: Radius.circular(
                                      AppSizes.myHeight(context) / 30))),
                          height: 20,
                          width: AppSizes.myWidth(context) / 2.5,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: AppSizes.myWidth(context) / 2.3,
                  height: AppSizes.myHeight(context) / 4.5,
                  child: Card(
                    color: Color(0xFF1B2B3A),
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppSizes.myHeight(context) / 60,
                        ),
                        Container(
                            width: AppSizes.myWidth(context) / 4,
                            child: Image.asset("assets/ip2.png")),
                        Text(" Macbook Air M2",
                            style: AppTextStyles.subText!.copyWith(
                                color: Colors.white,
                                fontSize: AppSizes.myHeight(context) / 70,
                                fontWeight: FontWeight.bold)),
                        Text(
                          " R̶p̶1̶9̶.̶9̶9̶9̶.̶0̶0̶0",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Spacer(),
                        Container(
                          child: Text(
                            style: TextStyle(color: Colors.white),
                            "15% OFF",
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      AppSizes.myHeight(context) / 30),
                                  bottomRight: Radius.circular(
                                      AppSizes.myHeight(context) / 30))),
                          height: 20,
                          width: AppSizes.myWidth(context) / 2.5,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: CircleBorder(),
                          side: BorderSide(
                            color: Appcolors.greenBackground,
                            width: 1,
                          ),
                        ),
                        onPressed: () {},
                        child: Icon(Icons.remove,
                            color: Appcolors.greenBackground),
                      ),
                      Text("3",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: CircleBorder(),
                          side: BorderSide(
                            color: Appcolors.greenBackground,
                            width: 1,
                          ),
                        ),
                        onPressed: () {},
                        child:
                            Icon(Icons.add, color: Appcolors.greenBackground),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                    ],
                  ),
                  height: AppSizes.myHeight(context) / 30,
                  width: AppSizes.myWidth(context) / 2.7,
                ),
                Container(
                  height: AppSizes.myHeight(context) / 30,
                  width: AppSizes.myWidth(context) / 2.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: CircleBorder(),
                          side: BorderSide(
                            color: Appcolors.greenBackground,
                            width: 1,
                          ),
                        ),
                        onPressed: () {},
                        child: Icon(Icons.remove,
                            color: Appcolors.greenBackground),
                      ),
                      Text("2",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: CircleBorder(),
                          side: BorderSide(
                            color: Appcolors.greenBackground,
                            width: 1,
                          ),
                        ),
                        onPressed: () {},
                        child:
                            Icon(Icons.add, color: Appcolors.greenBackground),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 20,
            ),
            TextField(
              style: AppTextStyles.subText,
              cursorColor: Appcolors.greenBackground,
              decoration: InputDecoration(
                hintText: "Sepetimde ara...",
                hintStyle: AppTextStyles.subText.copyWith(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF1B2B3A),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                      color: Appcolors.greenBackground, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                      color: Appcolors.greenBackground, width: 2),
                ),
                prefixIcon:
                    const Icon(Icons.search, color: Appcolors.greenBackground),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
