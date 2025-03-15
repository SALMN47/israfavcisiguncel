import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/messages/message1.dart';
import 'package:israfavcisi/messages/message2.dart';
import 'package:israfavcisi/messages/message3.dart';
import 'package:israfavcisi/messages/message4.dart';
import 'package:israfavcisi/messages/message5.dart';

class Messagespage extends StatefulWidget {
  const Messagespage({super.key});

  @override
  State<Messagespage> createState() => _MessagespageState();
}

class _MessagespageState extends State<Messagespage> {
  TextEditingController searchController = TextEditingController();
  bool a = false;
  bool b = false;
  bool c = false;
  bool d = false;
  bool f = false;
  bool g = false;
  bool e = false;
  bool z = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Appcolors.greenBackground),
        title: Text(
          'Mesajlar',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.myHeight(context) / 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Appcolors.blackBackgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Divider(
              thickness: 2,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.myHeight(context) / 40,
                  vertical: AppSizes.myHeight(context) / 100),
              child: TextField(
                controller: searchController,
                style: AppTextStyles.subText,
                cursorColor: Appcolors.greenBackground,
                decoration: InputDecoration(
                  hintText: "Sohbetimde ara...",
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
                  prefixIcon: const Icon(Icons.search,
                      color: Appcolors.greenBackground),
                ),
              ),
            ),
            tile("assets/p1.jpg", "Ali Yılmaz",
                "Merhaba, siparişimi ne zaman alabilirim?", "12:30", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen5(),
                ),
              );
            }),
            tile("assets/p2.jpg", "Joseph ",
                "Ürünüm hasarlı geldi, ne yapmalıyım?", "11:45", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen4(),
                ),
              );
            }),
            tile("assets/p3.JPG", "Alexia ",
                "İade süreci hakkında bilgi alabilir miyim?", "10:15", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen3(),
                ),
              );
            }),
            tile("assets/p4.jpeg", "Ahmet Yıldız",
                "Ürünüm ne zaman kargoya verilecek?", "09:00", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen2(),
                ),
              );
            }),
            tile("assets/p5.jpg", "Fatma Koç",
                "Siparişimi iptal etmek istiyorum.", "08:30", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen1(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  GestureDetector tile(
    String image,
    String name,
    String message,
    String time,
    VoidCallback? press,
  ) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          e = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          e = false;
        });
      },
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0, vertical: AppSizes.myHeight(context) / 100),
        child: ListTile(
          tileColor: e ? Color(0xFF1B2B3A).withOpacity(1) : Colors.transparent,
          leading: CircleAvatar(
            backgroundImage: AssetImage(image),
          ),
          title: Text(
            name,
            style: AppTextStyles.subText,
          ),
          subtitle: Text(
            message,
            style: AppTextStyles.subText.copyWith(color: Colors.grey),
          ),
          trailing: Text(
            time,
            style: AppTextStyles.subText.copyWith(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
