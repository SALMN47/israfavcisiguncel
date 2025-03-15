import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';

class ChatScreen4 extends StatelessWidget {
  final List<Message> messages = [
    Message("Hello, Alexia! I'm looking for an  laptop. Can you help me?",
        false, "18:00"),
    Message(
        "Of course, we have many options for laptops that you might like. Is there a specific model you prefer?",
        true,
        "18:02"),
    Message("I prefer macbook. Can you show me some options?", false, "18:04"),
    Message(
        "Certainly! I'll send you photos of some macbook we have available.",
        true,
        "18:06"),
    Message("", true, "18:06",
        imageUrl:
            "https://resim.epey.com/625247/m_apple-macbook-pro-13-3-m1-myd82tu-a-1.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B2B3A),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Appcolors.greenBackground),
        backgroundColor: Appcolors.blackBackgroundColor,
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/p2.jpg'),
                ),
                Positioned(
                    left: AppSizes.myWidth(context) / 15,
                    top: AppSizes.myHeight(context) / 30,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 6,
                    )),
              ],
            ),
            SizedBox(
              width: AppSizes.myWidth(context) / 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Joseph ',
                    style: TextStyle(
                        fontSize: AppSizes.myHeight(context) / 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text(
                  'Son Görülme: 2 saat önce',
                  style: TextStyle(
                      fontSize: AppSizes.myHeight(context) / 60,
                      color: Colors.grey),
                )
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              padding: EdgeInsets.all(AppSizes.myHeight(context) / 40),
              itemBuilder: (context, index) {
                return ChatBubble(messages[index]);
              },
            ),
          ),
          ChatInputField(),
          // SizedBox(
          //   height: AppSizes.myHeight(context) / 50,
          // ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final Message message;

  ChatBubble(this.message);

  @override
  Widget build(BuildContext context) {
    bool isBot = message.isBot;
    return Align(
      alignment: isBot ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: AppSizes.myHeight(context) / 100),
        child: Column(
          crossAxisAlignment:
              isBot ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            if (message.text.isNotEmpty)
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: isBot
                      ? Appcolors.greenBackground
                      : Appcolors.blackBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft:
                        isBot ? Radius.circular(0) : Radius.circular(15),
                    bottomRight:
                        isBot ? Radius.circular(15) : Radius.circular(0),
                  ),
                ),
                child: Text(
                  message.text,
                  style: TextStyle(
                      color: isBot ? Colors.black : Colors.white, fontSize: 16),
                ),
              ),
            if (message.imageUrl != null)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(message.imageUrl!, width: 200),
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Text(
                message.time,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// horizontal: AppSizes.myWidth(context) / 20,
class ChatInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSizes.myWidth(context) / 20,
        AppSizes.myWidth(context) / 30,
        AppSizes.myWidth(context) / 20,
        AppSizes.myWidth(context) / 15,
      ),
      color: Colors.grey[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: TextField(
              style: AppTextStyles.subText,
              cursorColor: Appcolors.greenBackground,
              decoration: InputDecoration(
                  hintText: " Mesajınızı yazınız...",
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
                  suffixIcon: Container(
                    width: AppSizes.myWidth(context) / 4,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.attach_file, color: Colors.grey),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.camera, color: Colors.grey),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )),
            ),
          ),
          SizedBox(
            width: AppSizes.myWidth(context) / 30,
          ),
          CircleAvatar(
            backgroundColor: Appcolors.greenBackground,
            child: IconButton(
              color: Colors.black,
              icon: Icon(Icons.send, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isBot;
  final String time;
  final String? imageUrl;

  Message(this.text, this.isBot, this.time, {this.imageUrl});
}
