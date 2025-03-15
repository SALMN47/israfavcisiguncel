import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/widgets/custombutton.dart';

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
              children: [rowadd(context), rowadd(context)],
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
              children: [rowadd(context), rowadd(context)],
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 17,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: AppSizes.myWidth(context) / 15,
                    ),
                    Text("Kuponum",
                        style: AppTextStyles.subText!.copyWith(
                            color: Colors.white,
                            fontSize: AppSizes.myHeight(context) / 40,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: AppSizes.myHeight(context) / 150,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: AppSizes.myWidth(context) / 15,
                    ),
                    Container(
                      width: AppSizes.myWidth(context) / 1.7,
                      height: AppSizes.myHeight(context) / 15,
                      child: TextField(
                        style: AppTextStyles.subText,
                        cursorColor: Appcolors.greenBackground,
                        decoration: InputDecoration(
                          hintText: "ex: 28943",
                          hintStyle: AppTextStyles.subText
                              .copyWith(color: Colors.grey),
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
                          prefixIcon: const Icon(Icons.search,
                              color: Appcolors.greenBackground),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppSizes.myWidth(context) / 20,
                    ),
                    SizedBox(
                      width: AppSizes.myWidth(context) /
                          4, // Default genişlik: tam genişlik
                      height: AppSizes.myHeight(context) /
                          18, // Default yükseklik: 50
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.greenBackground,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "Uygula",
                          style: TextStyle(
                              fontSize: AppSizes.myHeight(context) / 60,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 20,
            ),
            Container(
                color: Color(0xFF1B2B3A),
                height: AppSizes.myHeight(context) / 8,
                width: AppSizes.myWidth(context),
                child: Row(
                  children: [
                    SizedBox(
                      width: AppSizes.myWidth(context) / 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppSizes.myHeight(context) / 100,
                        ),
                        Text(
                          'Toplam Fiyat',
                          style: TextStyle(
                              fontSize: AppSizes.myHeight(context) / 50,
                              color: Colors.grey),
                        ),
                        Text(
                          '7582₺',
                          style: TextStyle(
                              fontSize: AppSizes.myHeight(context) / 35,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: AppSizes.myWidth(context) / 5,
                    ),
                    Container(
                        width: AppSizes.myWidth(context) / 2.3,
                        child: CustomButton(
                            text: 'Şimdi Satın Al', onPressed: () {}))
                  ],
                )),
            SizedBox(
              height: AppSizes.myHeight(context) / 20,
            ),
          ],
        ),
      ),
    );
  }

  Row rowadd(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: AppSizes.myWidth(context) / 45,
        ),
        CircleAvatar(
          radius: AppSizes.myHeight(context) / 45,
          child: Center(
            child: IconButton(
                alignment: Alignment.center,
                onPressed: () {},
                icon: Icon(Icons.add),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Appcolors.greenBackground),
                )),
          ),
        ),
        SizedBox(
          width: AppSizes.myWidth(context) / 35,
        ),
        Text("2", style: TextStyle(color: Colors.white, fontSize: 20)),
        SizedBox(
          width: AppSizes.myWidth(context) / 35,
        ),
        CircleAvatar(
          radius: AppSizes.myHeight(context) / 45,
          child: Center(
            child: IconButton(
                alignment: Alignment.center,
                onPressed: () {},
                icon: Icon(Icons.remove),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Appcolors.greenBackground),
                )),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete),
          color: Colors.red,
        ),
      ],
    );
  }
}
