import 'package:flutter/material.dart';
import 'package:israfavcisi/adreslerim.dart';
import 'package:israfavcisi/profile/profile1.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int favoriteCount = 0;
  int addressCount = 0;
  String firstName = '';
  String lastName = '';

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profilim'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(1),
          child: Column(
            children: [
              // Profile Header
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile1()));
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                '$firstName $lastName',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Fırsat Avcısı',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 24),
              // İlk sıra: Siparişlerim ve Beğendiklerim
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Siparişlerim',
                      '3 Aktif',
                      Icons.shopping_bag_outlined,
                      Colors.orange,
                      context,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      'Beğendiklerim',
                      '$favoriteCount Ürün',
                      Icons.favorite_border_outlined,
                      Colors.pink,
                      context,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // İkinci sıra: Adreslerim ve CO2 Tasarrufu
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Adreslerim',
                      '$addressCount Adres',
                      Icons.location_on_outlined,
                      Colors.blue,
                      context,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             PercentIndicatorScreen()));
                      },
                      child: _buildStatCard(
                        'CO2 Tasarrufu',
                        '125 kg',
                        Icons.eco,
                        Colors.green,
                        context,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Üçüncü sıra: Tasarruf Edilen Enerji ve Para
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => enerjS()));
                      },
                      child: _buildStatCard(
                        'Tasarruf Edilen\nEnerji',
                        '230 kWh',
                        Icons.bolt,
                        Colors.orange,
                        context,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      'Tasarruf Edilen\nPara',
                      '₺450',
                      Icons.attach_money,
                      Colors.blue,
                      context,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Dördüncü sıra: Fırsatlar ve Kuponlarım
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Fırsatlar',
                      '5 Yeni',
                      Icons.local_offer_outlined,
                      Colors.purple,
                      context,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      'Kuponlarım',
                      '2 Aktif',
                      Icons.card_giftcard_outlined,
                      Colors.red,
                      context,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
    BuildContext context,
  ) {
    double cardWidth = (MediaQuery.of(context).size.width - 48) / 2;

    String displayValue = value;
    if (title == 'Beğendiklerim') {
      displayValue = '$favoriteCount Ürün';
    }

    Widget cardContent = SizedBox(
      width: cardWidth,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Text(
                displayValue,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (title == 'Beğendiklerim') {
      return InkWell(
        onTap: () => Navigator.pushNamed(context, '/favorites'),
        child: cardContent,
      );
    } else if (title == 'Siparişlerim') {
      return InkWell(
        onTap: () => Navigator.pushNamed(context, '/orders'),
        child: cardContent,
      );
    } else if (title == 'Adreslerim') {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Adreslerim(), // Replace with your actual address page widget
            ),
          );
        },
        child: cardContent,
      );
    } else if (title == 'Kuponlarım') {
      return InkWell(
        onTap: () => Navigator.pushNamed(context, '/coupons'),
        child: cardContent,
      );
    }
    return cardContent;
  }
}
