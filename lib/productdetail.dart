import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _currentImageIndex = 0;
  int _selectedVariantIndex = 0;
  int _selectedStorageIndex = 0;
  int _quantity = 1; // Add for quantity tracking

  // Helper methods for responsive values
  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  double getResponsiveWidth(double percentage) => screenWidth * percentage;
  double getResponsiveHeight(double percentage) => screenHeight * percentage;
  double getResponsiveFontSize(double percentage) => screenWidth * percentage;
  double getResponsiveSpacing(double percentage) => screenWidth * percentage;

  // Commonly used responsive values
  double get defaultPadding => getResponsiveWidth(0.04);
  double get defaultSpacing => getResponsiveWidth(0.02);
  double get defaultIconSize => getResponsiveWidth(0.06);
  double get defaultBorderRadius => getResponsiveWidth(0.02);

  @override
  Widget build(BuildContext context) {
    // Calculate responsive values
    final double imageSectionHeight = getResponsiveHeight(0.3);
    final double thumbnailHeight = getResponsiveHeight(0.1);

    List<String> imageUrls = [
      widget.product['imageUrl'],
      widget.product['imageUrl'],
      widget.product['imageUrl'],
      widget.product['imageUrl'],
      widget.product['imageUrl'],
    ];

    // Define storage options
    final List<String> storageOptions = ['256 GB', '512 GB', '1 TB'];

    return Scaffold(
      backgroundColor: Appcolors.blackBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Appcolors.blackBackgroundColor,
        title: Text(
          widget.product['productName'],
          style: TextStyle(
            color: Colors.white,
            fontSize: getResponsiveFontSize(0.05),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              widget.product['isFavorite']
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
              size: defaultIconSize,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.greenAccent,
            size: defaultIconSize,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: imageSectionHeight,
                    child: PageView.builder(
                      itemCount: imageUrls.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentImageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imageUrls[index],
                          fit: BoxFit.fitHeight,
                          height: getResponsiveHeight(0.25),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: defaultSpacing),

                  // Image indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(imageUrls.length, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: getResponsiveWidth(0.01),
                        ),
                        width: getResponsiveWidth(0.02),
                        height: getResponsiveWidth(0.02),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentImageIndex == index
                              ? Colors.greenAccent
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: defaultSpacing),

                  // Thumbnail gallery
                  SizedBox(
                    height: thumbnailHeight,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentImageIndex = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: getResponsiveWidth(0.012),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _currentImageIndex == index
                                    ? Colors.greenAccent
                                    : Colors.transparent,
                                width: getResponsiveWidth(0.005),
                              ),
                              borderRadius: BorderRadius.circular(
                                defaultBorderRadius,
                              ),
                            ),
                            child: Image.asset(
                              imageUrls[index],
                              width: getResponsiveWidth(0.15),
                              height: getResponsiveWidth(0.15),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getResponsiveSpacing(0.04)),

            // Product title and rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product['productName'],
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(0.045),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                      size: defaultIconSize,
                    ),
                    SizedBox(width: getResponsiveSpacing(0.01)),
                    Text(
                      widget.product['rating'].toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getResponsiveFontSize(0.045),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: defaultSpacing),

            // Pricing
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.product['price'].toString()} ${widget.product['currency']}',
                      style: TextStyle(
                        fontSize: getResponsiveFontSize(0.05),
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.grey,
                        decorationThickness: 2.0,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                    if (widget.product['discountedPrice'] != null)
                      Text(
                        'İndirimli Fiyat: ${widget.product['discountedPrice'].toString()} ${widget.product['currency']}',
                        style: TextStyle(
                          fontSize: getResponsiveFontSize(0.045),
                          fontWeight: FontWeight.w600,
                          color: Colors.greenAccent,
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                // Quantity selector
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_quantity > 1) _quantity--;
                        });
                      },
                      child: Icon(
                        Icons.remove,
                        color: Appcolors.greenBackground,
                        size: defaultIconSize,
                      ),
                    ),
                    SizedBox(width: getResponsiveSpacing(0.02)),
                    Text(
                      '$_quantity',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getResponsiveFontSize(0.045),
                      ),
                    ),
                    SizedBox(width: getResponsiveSpacing(0.02)),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _quantity++;
                        });
                      },
                      child: Icon(
                        Icons.add,
                        color: Appcolors.greenBackground,
                        size: defaultIconSize,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: getResponsiveSpacing(0.04)),

            // Color & Variant Section
            Text(
              'Renk & Varyant',
              style: TextStyle(
                fontSize: getResponsiveFontSize(0.04),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: defaultSpacing),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(imageUrls.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedVariantIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: getResponsiveWidth(0.01),
                    ),
                    padding: EdgeInsets.all(getResponsiveWidth(0.01)),
                    decoration: BoxDecoration(
                      color: _selectedVariantIndex == index
                          ? Colors.greenAccent.withOpacity(0.3)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                    child: Image.asset(
                      imageUrls[index],
                      width: getResponsiveWidth(0.125),
                      height: getResponsiveWidth(0.125),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: getResponsiveSpacing(0.04)),

            // Storage Section
            Text(
              'Depolama',
              style: TextStyle(
                fontSize: getResponsiveFontSize(0.04),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: defaultSpacing),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  storageOptions.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: defaultSpacing),
                    child: _buildStorageOption(
                      storageOptions[index],
                      index == _selectedStorageIndex,
                      index,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: getResponsiveSpacing(0.04)),

            // Description
            Text(
              'Açıklama:',
              style: TextStyle(
                fontSize: getResponsiveFontSize(0.045),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: defaultSpacing),
            Text(
              widget.product['description'],
              style: TextStyle(
                color: Colors.white,
                fontSize: getResponsiveFontSize(0.04),
              ),
            ),
            SizedBox(height: getResponsiveSpacing(0.04)),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1B2B3A),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: getResponsiveHeight(0.01),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Handle buy now action
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: getResponsiveHeight(0.01),
                    ),
                    decoration: BoxDecoration(
                      color: Appcolors.greenBackground,
                      borderRadius: BorderRadius.circular(
                        getResponsiveWidth(0.06),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Şimdi Satın Al',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getResponsiveFontSize(0.04),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: getResponsiveWidth(0.025)),
              IconButton(
                icon: Icon(
                  Icons.chat,
                  color: Appcolors.greenBackground,
                  size: defaultIconSize,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Appcolors.greenBackground,
                  size: defaultIconSize,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Updated storage option builder
  Widget _buildStorageOption(String text, bool isSelected, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedStorageIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getResponsiveWidth(0.04),
          vertical: getResponsiveHeight(0.01),
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.greenAccent : Colors.transparent,
          borderRadius: BorderRadius.circular(getResponsiveWidth(0.05)),
          border: Border.all(color: Colors.greenAccent),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.greenAccent,
            fontWeight: FontWeight.bold,
            fontSize: getResponsiveFontSize(0.035),
          ),
        ),
      ),
    );
  }
}
