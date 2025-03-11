import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/profile/degistir.dart';
import 'package:israfavcisi/profile/dil.dart';
import 'package:israfavcisi/profile/duzenle.dart';

class Profile1 extends StatefulWidget {
  const Profile1({super.key});

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.blackBackgroundColor,
      appBar: AppBar(
        backgroundColor: Appcolors.blackBackgroundColor,
        title: const Text(
          'Profilim',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          color: Appcolors.greenBackground,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: AppSizes.myHeight(context) / 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF1B2B3A)),
                width: AppSizes.myWidth(context) / 1.1,
                height: AppSizes.myHeight(context) / 10,
                child: Row(
                  children: [
                    SizedBox(
                      width: AppSizes.myWidth(context) / 20,
                    ),
                    CircleAvatar(
                      backgroundColor: Appcolors.greenBackground,
                      radius: AppSizes.myHeight(context) / 35,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    SizedBox(
                      width: AppSizes.myWidth(context) / 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'NAME',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: AppSizes.myHeight(context) / 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'name@gmail.com',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: AppSizes.myHeight(context) / 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Appcolors.greenBackground,
                          borderRadius: BorderRadius.circular(10)),
                      width: AppSizes.myWidth(context) / 8,
                      height: AppSizes.myHeight(context) / 20,
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const duzenlePage(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: AppSizes.myWidth(context) / 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          height(context, 60),
          Row(
            children: [
              width(context, 20),
              Text(
                'Diğer Ayarlar',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.myHeight(context) / 40),
              )
            ],
          ),
          list(context, 'Favorilerim', Icons.favorite_outline, () {}),
          list(context, 'Görüşlerim', Icons.star_outline, () {}),
          list(context, 'Tarih', Icons.date_range_outlined, () {}),
          list(context, 'Dil', Icons.flag_outlined, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const dilpage(),
              ),
            );
          }),
          list(context, 'Şifreyi Değiştir', Icons.key_rounded, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const degistirPage()));
          }),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Divider(
              color: Colors.grey,
              thickness: 0.5,
              //  height: AppSizes.myHeight(context) / 90,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app_sharp,
              color: Colors.red,
            ),
            title: Text(
              'Çıkış ',
              style: TextStyle(
                  color: Colors.red, fontSize: AppSizes.myHeight(context) / 50),
            ),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.red),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  ListTile list(
      BuildContext context, String text, IconData icon, VoidCallback fun1) {
    return ListTile(
      leading: Icon(
        icon,
        color: Appcolors.greenBackground,
      ),
      title: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: AppSizes.myHeight(context) / 50),
      ),
      trailing: IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Appcolors.greenBackground,
          ),
          color: Appcolors.greenBackground,
          onPressed: fun1),
    );
  }

  SizedBox height(BuildContext context, int a) {
    return SizedBox(
      height: AppSizes.myHeight(context) / a,
    );
  }

  SizedBox width(BuildContext context, int b) {
    return SizedBox(
      width: AppSizes.myWidth(context) / b,
    );
  }
}
