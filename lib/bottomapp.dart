import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/homescreen.dart';
import 'package:israfavcisi/profile/profile1.dart';
import 'package:israfavcisi/profile/profileup.dart';
import 'package:israfavcisi/sepet.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolors.greenBackground,
        child: Icon(Icons.qr_code),
        onPressed: () {},
        shape: CircleBorder(),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Add your pages here
          HomeScreen(),
          Container(color: Colors.blue), // Gifts page
          sepetPage(),

          ProfileScreen(), // Profile page
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   shape: CircleBorder(),
      //   backgroundColor: Appcolors.greenBackground,
      //   onPressed: () {},
      //   child: const Icon(Icons.qr_code),
      // ),
      bottomNavigationBar: BottomAppBar(
        padding:
            EdgeInsets.symmetric(horizontal: AppSizes.myHeight(context) / 100),
        height: AppSizes.myHeight(context) / 15,
        color: Color(0xFF1B2B3A),
        notchMargin: 0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.explore,
                color: _selectedIndex == 1 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: _selectedIndex == 2 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 3 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
