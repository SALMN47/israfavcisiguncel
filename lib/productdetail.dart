import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.blackBackgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
          )
        ],
        iconTheme: const IconThemeData(color: Appcolors.greenBackground),
        backgroundColor: Colors.transparent,
        title: Text(
          " Ürün Detayı",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              //     itemCount: _imageUrls.length,
              itemBuilder: (context, index) {
//return Image.network(_imageUrls[index], fit: BoxFit.cover);
              },
            ),
          ),
          SizedBox(height: 16),
          // SmoothPageIndicator(
          //   controller: _pageController,
          //   count: _imageUrls.length,
          //   effect: ExpandingDotsEffect(
          //     activeDotColor: Colors.blue,
          //     dotHeight: 8,
          //     dotWidth: 8,
          //   ),
          // ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
