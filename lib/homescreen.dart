import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';

class Category {
  final String name;
  final IconData icon;
  final List<String> subcategories;

  Category({
    required this.name,
    required this.icon,
    required this.subcategories,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _remainingTime = 900; // 15 minutes in seconds
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer(); // Start the timer when the widget is initialized
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          timer.cancel(); // Stop the timer when it reaches zero
        }
      });
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  final List<String> _secondSliderImages = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
  ];

  final List<String> _advertisementImages = [
    'assets/z1.png',
    'assets/z2.png',
    'assets/z3.png',
    'assets/z4.png',
  ];
  final List<Map<String, String>> fastCategories = [
    {'image': 'assets/restoran.jpg', 'name': 'Restoran'},
    {'image': 'assets/sepet.png', 'name': 'Hızlı Market'},
    {'image': 'assets/kıyafet.png', 'name': 'Kıyafet'},
    {'image': 'assets/beyazesya.png', 'name': 'Beyaz Eşya'},
    {'image': 'assets/hediye.png', 'name': 'Hediyelik Eşsya'},
  ];

  final List<Category> categories = [
    Category(
      name: 'Supermarket',
      icon: Icons.shopping_cart,
      subcategories: [
        'Ev ve Temizlik',
        'Gıda',
        'Kişisel Bakım',
        'Sağlık ve Spor',
        'Petshop',
        'Bebek Bakımı',
      ],
    ),
    Category(
      name: 'Kozmetik',
      icon: Icons.face,
      subcategories: [
        'Makyaj',
        'Parfüm ve Deodorant',
        'Cilt Bakımı',
        'Saç Bakımı',
      ],
    ),
  ];

  // Define different product lists for each section
  final List<Map<String, dynamic>> specialProducts = [
    {
      'id': '1',
      'imageUrl': 'assets/bebekbakim.jpg',
      'description': '''
    - Premium kalite bebek bakım seti.
    - Cilt dostu, alerji yapmayan ürünler.
    - Bebeklerin günlük bakım ihtiyaçları için ideal.
    - Dermatolojik olarak test edilmiştir.
    - İçeriğinde şampuan, bebek losyonu, bebek yağı ve daha fazlası yer alır.
    ''',
      'shortDescription': 'Bebek Bakım Seti Premium',
      'productName': 'Bebek Bakım Seti',
      'price': 299.99,
      'discountedPrice': 249.99, // Add discounted price
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.8,
      'isFavorite': false,
      'seller': 'Ebebek',
    },
    {
      'id': '2',
      'imageUrl': 'assets/gunluk.webp',
      'description': '''
    - Günlük kullanım için rahat ve şık ayakkabı.
    - Yüksek kaliteli deri malzeme.
    - Hafif ve dayanıklı taban yapısı.
    - Farklı renk seçenekleri mevcut.
    - Her mevsime uygun tasarım.
    ''',
      'shortDescription': 'Erkek Günlük Sneaker',
      'productName': 'Günlük Ayakkabı',
      'price': 599.99,
      'discountedPrice': 499.99, // Add discounted price
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.5,
      'isFavorite': false,
      'seller': 'Nike',
    },
    {
      'id': '3',
      'imageUrl': 'assets/bebekaraba.webp',
      'description': '''
    - Travel sistem bebek arabası.
    - Kolayca araç koltuğuna dönüşebilir.
    - Yüksek güvenlik standartlarına uygun.
    - Kompakt şekilde katlanabilir.
    - Renk seçenekleriyle her zevke hitap eder.
    ''',
      'shortDescription': 'Travel Sistem Bebek Arabası',
      'productName': 'Bebek Arabası',
      'price': 4999.99,
      'discountedPrice': 3999.99, // Add discounted price
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.9,
      'isFavorite': false,
      'seller': 'Chicco',
    },
    {
      'id': '4',
      'imageUrl': 'assets/tulum.jpg',
      'description': '''
    - Kışlık bebek tulumu.
    - Yumuşak, sıcak tutan iç doku.
    - Çocukların rahatça hareket edebilmesi için tasarlandı.
    - Bebeklerin cilt dostu kumaşlardan üretilmiştir.
    - Su geçirmez özellikte.
    ''',
      'shortDescription': 'Kışlık Bebek Tulumu',
      'productName': 'Bebek Tulum',
      'price': 199.99,
      'discountedPrice': 149.99, // Add discounted price
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.7,
      'isFavorite': false,
      'seller': 'LC Waikiki',
    },
  ];

  final List<Map<String, dynamic>> bestSellers = [
    {
      'id': '5',
      'imageUrl': 'assets/bebekbez.jpg',
      'description': '''
    - Premium bebek bezi paketi.
    - Yüksek emiş gücü ile gece boyunca kuru tutar.
    - Yumuşak dokusu ile bebeklerin cildine dosttur.
    - Elastik bel bandı sayesinde rahat kullanım.
    - Nefes alabilen kumaş yapısı.
    ''',
      'shortDescription': 'Premium Bebek Bezi Paketi',
      'productName': 'Bebek Bezi',
      'price': 189.99,
      'discountedPrice': 149.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.8,
      'isFavorite': false,
      'seller': 'Pampers',
    },
    {
      'id': '6',
      'imageUrl': 'assets/klasik.jpg',
      'description': '''
    - Şık ve klasik deri ayakkabı.
    - Yüksek kaliteli deri malzeme.
    - Nefes alabilir iç yapı.
    - Şık tasarımı ile her ortamda rahatlıkla kullanılabilir.
    - Uzun ömürlü kullanım için sağlam taban.
    ''',
      'shortDescription': 'Erkek Klasik Deri Ayakkabı',
      'productName': 'Klasik Ayakkabı',
      'price': 799.99,
      'discountedPrice': 699.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.6,
      'isFavorite': false,
      'seller': 'Derimod',
    },
    {
      'id': '7',
      'imageUrl': 'assets/bebeksandalye.jpeg',
      'description': '''
    - Portatif mama sandalyesi.
    - Kolayca katlanabilir ve taşıma çantası ile gelir.
    - 5 noktadan sabitleme kemeri ile güvenlidir.
    - Farklı renk seçenekleri mevcut.
    - Ayarlanabilir yükseklik.
    ''',
      'shortDescription': 'Portatif Mama Sandalyesi',
      'productName': 'Mama Sandalyesi',
      'price': 699.99,
      'discountedPrice': 599.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.7,
      'isFavorite': false,
      'seller': 'Chicco',
    },
    {
      'id': '8',
      'imageUrl': 'assets/patik.jpeg',
      'description': '''
    - Yumuşak bebek patik seti.
    - Renkli ve şık tasarım.
    - Bebeklerin ilk adımlarında rahatlık sağlar.
    - El yapımı, organik pamuklu kumaş.
    - Esnek ve rahat hareket özgürlüğü.
    ''',
      'shortDescription': 'Bebek Patik Seti',
      'productName': 'Bebek Patik',
      'price': 89.99,
      'discountedPrice': 69.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.5,
      'isFavorite': false,
      'seller': 'Handmade',
    },
  ];

  final List<Map<String, dynamic>> newProducts = [
    {
      'id': '9',
      'imageUrl': 'assets/yenidogan.jpg',
      'description': '''
    - Yenidoğan bebek için 10'lu set.
    - İçeriğinde bebek tulumu, şapka, eldiven ve daha fazlası bulunur.
    - Pamuklu kumaş, bebeklerin cildine dost.
    - Farklı renk seçenekleri ile bebekler için şık kombinler.
    - Rahat giyilebilir ve kolayca yıkanabilir.
    ''',
      'shortDescription': 'Hastane Çıkışı 10lu Set',
      'productName': 'Yenidoğan Set',
      'price': 399.99,
      'discountedPrice': 349.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.9,
      'isFavorite': false,
      'seller': 'LC Waikiki',
    },
    {
      'id': '10',
      'imageUrl': 'assets/spor.webp',
      'description': '''
    - Erkeğe özel spor ayakkabı.
    - Yüksek konforlu taban yapısı.
    - Nefes alabilir malzeme ile terlemeyi engeller.
    - Farklı renk seçenekleri.
    - Her türlü spor ve günlük kullanım için idealdir.
    ''',
      'shortDescription': 'Erkek Spor Ayakkabı',
      'productName': 'Spor Ayakkabı',
      'price': 899.99,
      'discountedPrice': 799.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.7,
      'isFavorite': false,
      'seller': 'Nike',
    },
  ];

  final List<Map<String, dynamic>> discountProducts = [
    {
      'id': '11',
      'imageUrl': 'assets/bot.webp',
      'description': '''
    - Yüksek kalite erkek Chelsea bot.
    - Klasik tasarım, rahat kullanım.
    - Su geçirmez özellikte, kış aylarında mükemmel.
    - İç kısmı sıcak tutan astar ile donatılmıştır.
    - Uzun ömürlü ve sağlam taban.
    ''',
      'shortDescription': 'Erkek Chelsea Bot',
      'productName': 'Bot',
      'price': 499.99,
      'discountedPrice': 399.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.6,
      'isFavorite': false,
      'seller': 'Derimod',
    },
    {
      'id': '12',
      'imageUrl': 'assets/bebekotokoltuk.webp',
      'description': '''
    - 0-13 kg bebekler için oto koltuğu.
    - Yüksek güvenlik standartlarına uygun.
    - 5 noktalı emniyet kemeri sistemi.
    - Kolayca takılıp çıkarılabilir.
    - Yumuşak, bebek dostu kumaş.
    ''',
      'shortDescription': '0-13 kg Oto Koltuğu',
      'productName': 'Oto Koltuğu',
      'price': 1299.99,
      'discountedPrice': 999.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.8,
      'isFavorite': false,
      'seller': 'Chicco',
    },
  ];

  final List<Map<String, dynamic>> ek1 = [
    {
      'id': '13',
      'imageUrl': 'assets/ek1.png',
      'description': '''
    - Hic kullanilmamis.
    - Yeni basim.
    - jelatini ustunde.
  
    ''',
      'shortDescription': 'Calculus 1 soru bankasi',
      'productName': 'Calculus 1',
      'price': 320.00,
      'discountedPrice': 270.00,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.9,
      'isFavorite': false,
      'seller': 'Kanguru Kitapevi',
    },
    {
      'id': '14',
      'imageUrl': 'assets/ek2.png',
      'description': '''
    - Yüksek kalite tras makinesi.
    - Minimal tasarım, rahat kullanım.
    - Yuksek hassasiyet.
    - Uzun ömürlü ve sağlam material.
    ''',
      'shortDescription': 'Philips tras makinesi',
      'productName': 'Tras Makinesi',
      'price': 499.99,
      'discountedPrice': 349.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.6,
      'isFavorite': false,
      'seller': 'Kardesler Elektronik',
    },
    {
      'id': '15',
      'imageUrl': 'assets/ek3.png',
      'description': '''
    - Az kullanilmis  Az kullanılmış ses hoparlörü
    - minimal tasarım.
    - yüksek ses kalitesi.
    - Uzun batarya ömrü.
    - Kaliteli material.
    ''',
      'shortDescription': 'Anker Ses Hoparlörü',
      'productName': 'Ses Hoparlörü',
      'price': 749.99,
      'discountedPrice': 499.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.9,
      'isFavorite': false,
      'seller': 'Kardesler Elektronik',
    },
  ];
  final List<Map<String, dynamic>> ek2 = [
    {
      'id': '16',
      'imageUrl': 'assets/ek4.png',
      'description': '''
    - Az kullanilmis  outdoor ayakkabi.
    - konforlu tasarım.
    - Su gecirmez.
    - Isi yalitimi.
    - Kaliteli material.
    ''',
      'shortDescription': 'Salomon Outdoor Ayakkabi',
      'productName': 'Outdoor Ayakkabi',
      'price': 1199.99,
      'discountedPrice': 999.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.9,
      'isFavorite': false,
      'seller': 'Salomon Turkey',
    },
    {
      'id': '17',
      'imageUrl': 'assets/ek5.png',
      'description': '''
    - Erkek Esofman.
    - 100/100 pamuk.
    - Hic kullanilmamis.
    - Slim Fit kalip.
   
    ''',
      'shortDescription': 'Under Armour Erkek Esofman',
      'productName': 'Erkek esofman',
      'price': 449.99,
      'discountedPrice': 399.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.9,
      'isFavorite': false,
      'seller': 'Envej Tekstil',
    },
    {
      'id': '18',
      'imageUrl': 'assets/ek6.png',
      'description': '''
    - Erkek Eşofman.
    - 100/100 pamuk.
    - Hic kullanılmamis.
    - Slim Fit kalıp.
   
    ''',
      'shortDescription': 'Under Armour Erkek Eşofman',
      'productName': 'Erkek eşofman',
      'price': 449.99,
      'discountedPrice': 399.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.9,
      'isFavorite': false,
      'seller': 'Envej Tekstil',
    },
  ];
  final List<Map<String, dynamic>> ek3 = [
    {
      'id': '19',
      'imageUrl': 'assets/ek7.png',
      'description': '''
    - Erkek Esofman.
    - 100/100 pamuk.
    - Hic kullanilmamis.
    - Slim Fit kalip.
   
    ''',
      'shortDescription': 'Under Armour Erkek Eşofman',
      'productName': 'Erkek eşofman',
      'price': 449.99,
      'discountedPrice': 399.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.9,
      'isFavorite': false,
      'seller': 'Envej Tekstil',
    },
    {
      'id': '20',
      'imageUrl': 'assets/ek8.png',
      'description': '''
    - Erkek Klasik Saat.
    - Otomatik Mekanizma.
    - Hic kullanilmamis.
    - Celik kordon.
   
    ''',
      'shortDescription': 'Lorus Otomatik Saat',
      'productName': 'Erkek Saat',
      'price': 2499.99,
      'discountedPrice': 2199.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.4,
      'isFavorite': false,
      'seller': 'Ersa Saat',
    },
    {
      'id': '21',
      'imageUrl': 'assets/ek9.png',
      'description': '''
    - Hizli Sarj Cihazi.
    - 30 w Hizli Sarj Imkani .
    - Jelatini Acilmamis.
    
   
    ''',
      'shortDescription': 'Essantial Hızlı Şarj',
      'productName': 'Hızlı Şarj Cihazı',
      'price': 399.99,
      'discountedPrice': 299.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.0,
      'isFavorite': false,
      'seller': 'Dostlar Elektronik',
    },
  ];
  final List<Map<String, dynamic>> ek4 = [
    {
      'id': '22',
      'imageUrl': 'assets/ek10.png',
      'description': '''
    - Kablosuz Sarj Cihazi.
    - 18 w Hizli Sarj Imkani .
    - 0 Ayarinda.
    
   
    ''',
      'shortDescription': ' Hizli kablosuz Sarj',
      'productName': 'Kablosuz Sarj Cihazi',
      'price': 599.99,
      'discountedPrice': 499.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.0,
      'isFavorite': false,
      'seller': 'Dostlar Elektronik',
    },
    {
      'id': '23',
      'imageUrl': 'assets/ek11.png',
      'description': '''
    -  RGB SES BOMBASI.
    - Uzun calma suresi .
    - 0 Ayarinda.
    
   
    ''',
      'shortDescription': 'Soundcore  RGB ses bombasi',
      'productName': 'RGB Ses Bombasi',
      'price': 599.99,
      'discountedPrice': 499.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.0,
      'isFavorite': false,
      'seller': 'Dostlar Elektronik',
    },
    {
      'id': '24',
      'imageUrl': 'assets/ek12.png',
      'description': '''
    - Nato Kayis Saat Kordonu.
    - Geri Donustrulurmus Material.
    - Kullanilmamis.
    
   
    ''',
      'shortDescription': ' Casio Nato Kayis Saat Kordonu',
      'productName': 'Nato Kayis',
      'price': 399.99,
      'discountedPrice': 299.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.0,
      'isFavorite': false,
      'seller': 'Ersa Saat',
    },
  ];
  final List<Map<String, dynamic>> ek5 = [
    {
      'id': '25',
      'imageUrl': 'assets/ek5.png',
      'description': '''
    - Erkek Esofman.
    - 100/100 pamuk.
    - Hic kullanilmamis.
    - Slim Fit kalip.
   
    ''',
      'shortDescription': 'Under Armour Erkek Esofman',
      'productName': 'Erkek esofman',
      'price': 449.99,
      'discountedPrice': 399.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.9,
      'isFavorite': false,
      'seller': 'Envej Tekstil',
    },
    {
      'id': '26',
      'imageUrl': 'assets/ek10.png',
      'description': '''
    - Kablosuz Sarj Cihazi.
    - 18 w Hizli Sarj Imkani .
    - 0 Ayarinda.
    
   
    ''',
      'shortDescription': 'Xiami  Hizli kablosuz Sarj',
      'productName': 'Kablosuz Sarj Cihazi',
      'price': 599.99,
      'discountedPrice': 499.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.0,
      'isFavorite': false,
      'seller': 'Dostlar Elektronik',
    },
    {
      'id': '27',
      'imageUrl': 'assets/ek7.png',
      'description': '''
    - Erkek Esofman.
    - 100/100 pamuk.
    - Hic kullanilmamis.
    - Slim Fit kalip.
   
    ''',
      'shortDescription': 'Under Armour Erkek Esofman',
      'productName': 'Erkek esofman',
      'price': 449.99,
      'discountedPrice': 399.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.9,
      'isFavorite': false,
      'seller': 'Envej Tekstil',
    },
  ];

  final List<Map<String, dynamic>> ek6 = [
    {
      'id': '28',
      'imageUrl': 'assets/ek2.png',
      'description': '''
    - Yüksek kalite tras makinesi.
    - Minimal tasarım, rahat kullanım.
    - Yuksek hassasiyet.
    - Uzun ömürlü ve sağlam material.
    ''',
      'shortDescription': 'Philips tras makinesi',
      'productName': 'Tras Makinesi',
      'price': 499.99,
      'discountedPrice': 349.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.6,
      'isFavorite': false,
      'seller': 'Kardesler Elektronik',
    },
    {
      'id': '29',
      'imageUrl': 'assets/ek8.png',
      'description': '''
    - Erkek Klasik Saat.
    - Otomatik Mekanizma.
    - Hic kullanilmamis.
    - Celik kordon.
   
    ''',
      'shortDescription': 'Lorus Otomatik Saat',
      'productName': 'Erkek Saat',
      'price': 2499.99,
      'discountedPrice': 2199.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.4,
      'isFavorite': false,
      'seller': 'Ersa Saat',
    },
    {
      'id': '30',
      'imageUrl': 'assets/ek11.png',
      'description': '''
    -  RGB SES BOMBASI.
    - Uzun calma suresi .
    - 0 Ayarinda.
    
   
    ''',
      'shortDescription': 'Soundcore  RGB ses bombasi',
      'productName': 'RGB Ses Bombasi',
      'price': 599.99,
      'discountedPrice': 499.99,
      'currency': '₺',
      'isAvailable': true,
      'rating': 4.0,
      'isFavorite': false,
      'seller': 'Dostlar Elektronik',
    },
  ];
  Widget _buildFastCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: AppSizes.myWidth(context) / 20,
          alignment: WrapAlignment.center,
          children: fastCategories.map((category) {
            return Container(
              width: AppSizes.myWidth(context) /
                  4, // you can also adjust this value responsively
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      category['image']!,
                      width: AppSizes.myWidth(context) / 6,
                      height: AppSizes.myHeight(context) / 13,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: AppSizes.myHeight(context) / 100),
                  Text(
                    category['name']!,
                    style: TextStyle(
                      fontSize: AppSizes.myHeight(context) / 70,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildProductSection(
      String title, List<Map<String, dynamic>> products) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        // Define a breakpoint for desktop/tablet screens.
        final isDesktop = screenWidth > 800;
        // For desktops, we might want three cards per row.
        // For mobile, we stick with the original fixed size.
        final cardWidth =
            isDesktop ? (screenWidth - 48) / 3 : 180; // 48 for padding/margins
        final cardHeight = isDesktop ? 300 : 250; // Adjust height as needed

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: isDesktop ? 20.0 : 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: AppSizes.myHeight(context) / 50),
            SizedBox(
              height: cardHeight.toDouble(),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ProductDetail(product: product),
                      //   ),
                      // );
                    },
                    child: Container(
                      width: AppSizes.myWidth(context) / 2,
                      margin: EdgeInsets.only(
                          right: AppSizes.myHeight(context) / 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // The image container
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(8),
                              ),
                              child: Image.asset(
                                product['imageUrl'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          // Product details
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['productName'],
                                  style: TextStyle(
                                    fontSize: isDesktop ? 16.0 : 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    height: AppSizes.myHeight(context) / 100),
                                Row(
                                  children: [
                                    Text(
                                      '${product['currency']}${product['price'].toString()}',
                                      style: TextStyle(
                                        fontSize: isDesktop ? 16.0 : 14,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    if (product['discountedPrice'] != null)
                                      Text(
                                        '${product['currency']}${product['discountedPrice'].toString()}',
                                        style: TextStyle(
                                          fontSize: isDesktop ? 16.0 : 14,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed the drawer property entirely.
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Instead of opening a drawer, navigate to the CategoryScreen.
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const CategoryScreen(),
            //   ),
            // );
          },
        ),
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Ne aramıştınız?',
              prefixIcon: const Icon(Icons.search),
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              Navigator.pushNamed(context, '/messages');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => NotificationPage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topslide(),
            _buildFastCategories(),
            firstSlider(),
            flashindirim(context),
            secondSlider(),
            SizedBox(height: AppSizes.myHeight(context) / 30),
            _buildProductSection('En Çok Satanlar', bestSellers),
            AspectRatio(
              aspectRatio: 16 / 6, // Adjust ratio as needed
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  "assets/6.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildProductSection('Yeni Ürünler', newProducts),
            AspectRatio(
              aspectRatio: 16 / 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  "assets/banner4.jpg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildProductSection('Fırsat Ürünleri', discountProducts),
            _buildProductSection('Son Eklenenler', ek1),
            AspectRatio(
              aspectRatio: 16 / 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  "assets/10.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildProductSection('Erkek Tekstil', ek2),
            _buildProductSection('Cevrenedikler', ek3),
            AspectRatio(
              aspectRatio: 16 / 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  "assets/banner5.jpg",
                  width: double.infinity,
                ),
              ),
            ),
            _buildProductSection('En Güncel', ek4),
            AspectRatio(
              aspectRatio: 16 / 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  "assets/banner6.jpg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildProductSection('Hoşuna Gidecekler', ek5),
            _buildProductSection('Son Gezdiklerin', ek6),
            AspectRatio(
              aspectRatio: 16 / 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  "assets/banner4.jpg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            topslide(),
          ],
        ),
      ),
    );
  }

  Widget flashindirim(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Define breakpoints for responsiveness.
        final isDesktop = constraints.maxWidth > 800;
        final isTablet =
            constraints.maxWidth > 400 && constraints.maxWidth <= 800;

        // Adjust the overall container height based on the device type.
        final containerHeight = isDesktop ? 400.0 : (isTablet ? 370.0 : 350);

        // For product cards within the flash discount section:
        final cardWidth = isDesktop
            ? (constraints.maxWidth > 1200
                ? (1200.0 - 48) / 3
                : (constraints.maxWidth - 48) / 3)
            : 180;
        final listHeight = isDesktop ? 350.0 : (isTablet ? 300.0 : 250);

        // Set a maximum container width for full screen (for example, 1200 pixels).
        final maxContainerWidth =
            constraints.maxWidth > 1200 ? 1200.0 : constraints.maxWidth;

        return Center(
          // Center and constrain the container to a maximum width.
          child: Container(
            width: maxContainerWidth,
            height: AppSizes.myHeight(context) / 2.5,
            margin: EdgeInsets.symmetric(vertical: isDesktop ? 24.0 : 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isDesktop ? 12.0 : 8),
              gradient: const LinearGradient(
                colors: [Colors.green, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: isDesktop ? 10.0 : 5),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: isDesktop ? 16.0 : 16),
                  child: Row(
                    children: [
                      Text(
                        'Flash indirimler!',
                        style: TextStyle(
                          fontSize: isDesktop ? 24.0 : (isTablet ? 22.0 : 20),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        margin: EdgeInsets.only(left: isDesktop ? 12.0 : 8),
                        color: Colors.white,
                        child: Text(
                          _formatTime(_remainingTime),
                          style: TextStyle(
                            fontSize: isDesktop ? 20.0 : (isTablet ? 18.0 : 16),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: isDesktop ? 10.0 : 8),
                SizedBox(
                  height: AppSizes.myHeight(context) / 3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding:
                        EdgeInsets.symmetric(horizontal: isDesktop ? 16.0 : 16),
                    itemCount: specialProducts.length,
                    itemBuilder: (context, index) {
                      final product = specialProducts[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         ProductDetail(product: product),
                          //   ),
                          // );
                        },
                        child: Container(
                          width: AppSizes.myWidth(context) / 2,
                          margin: EdgeInsets.only(right: isDesktop ? 16.0 : 16),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(isDesktop ? 12.0 : 8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: isDesktop ? 8.0 : 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(isDesktop ? 12.0 : 8),
                                  ),
                                  child: Image.asset(
                                    product['imageUrl'],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(isDesktop ? 12.0 : 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product['productName'],
                                      style: TextStyle(
                                        fontSize: isDesktop ? 16.0 : 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: isDesktop ? 6.0 : 4),
                                    Row(
                                      children: [
                                        Text(
                                          '${product['currency']}${product['price'].toString()}',
                                          style: TextStyle(
                                            fontSize: isDesktop ? 16.0 : 14,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        SizedBox(width: isDesktop ? 12.0 : 8),
                                        if (product['discountedPrice'] != null)
                                          Text(
                                            '${product['currency']}${product['discountedPrice'].toString()}',
                                            style: TextStyle(
                                              fontSize: isDesktop ? 16.0 : 14,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                //   SizedBox(height: isDesktop ? 16.0 : 16),
              ],
            ),
          ),
        );
      },
    );
  }

  CarouselSlider topslide() {
    final List<String> images = [
      "assets/banner1.jpg",
      "assets/banner2.jpg",
      "assets/banner3.jpg"
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 100, // Match height with secondSlider
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
      ),
      items: images.map((item) {
        return Builder(
          builder: (context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.error),
                    );
                  },
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  CarouselSlider firstSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: AppSizes.myHeight(context) / 2.5,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
      items: _advertisementImages.map((item) {
        return Builder(
          builder: (context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  CarouselSlider secondSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 100,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
      items: _secondSliderImages.map((item) {
        return Builder(
          builder: (context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
