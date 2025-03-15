import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String currentFilter = 'Tümü';

  // Örnek bildirimler
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Siparişiniz Hazırlanıyor',
      'body': '#12345 numaralı siparişiniz hazırlanmaya başladı.',
      'date': '2024-03-20',
      'type': 'Siparişlerim',
      'imageUrl': 'https://picsum.photos/200',
    },
    {
      'title': 'Yeni Kupon Kazandınız!',
      'body': '50 TL değerinde indirim kuponu hesabınıza tanımlandı.',
      'date': '2024-03-19',
      'type': 'Kuponlarım',
      'imageUrl': 'https://picsum.photos/201',
    },
    {
      'title': 'Hafta Sonu Kampanyası',
      'body': 'Bu hafta sonu tüm ürünlerde %25 indirim fırsatını kaçırmayın!',
      'date': '2024-03-18',
      'type': 'Kampanyalar',
      'imageUrl': 'https://picsum.photos/202',
    },
    {
      'title': 'Siparişiniz Teslim Edildi',
      'body': '#12344 numaralı siparişiniz teslim edildi. Afiyet olsun!',
      'date': '2024-03-17',
      'type': 'Siparişlerim',
      'imageUrl': 'https://picsum.photos/203',
    },
  ];

  List<Map<String, dynamic>> getFilteredNotifications() {
    if (currentFilter == 'Tümü') return notifications;
    return notifications
        .where((notif) => notif['type'] == currentFilter)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredNotifications = getFilteredNotifications();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bildirimler'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var filter in [
                    'Tümü',
                    'Siparişlerim',
                    'Kuponlarım',
                    'Kampanyalar'
                  ])
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: FilterChip(
                        label: Text(filter),
                        selected: currentFilter == filter,
                        onSelected: (bool selected) {
                          setState(() => currentFilter = filter);
                        },
                        selectedColor: Colors.green[100],
                        checkmarkColor: Colors.green[700],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: filteredNotifications.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.notifications_off,
                            size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          '${currentFilter} kategorisinde bildirim bulunmamaktadır.',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredNotifications.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      final notification = filteredNotifications[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  notification['imageUrl'],
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                    width: 60,
                                    height: 60,
                                    color: Colors.grey[200],
                                    child: Icon(Icons.image,
                                        color: Colors.grey[400]),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      notification['title'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      notification['body'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          notification['date'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.green[50],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            notification['type'],
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.green[700],
                                            ),
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
        ],
      ),
    );
  }
}
