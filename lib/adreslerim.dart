import 'package:flutter/material.dart';

class Adreslerim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adreslerim'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdresDuzenleSayfasi()),
              );
            },
            child: Text(
              'Adres Ekle  ',
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Row(
              children: [
                Icon(Icons.location_city),
                SizedBox(width: 8),
                Text('Adres Adı'),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text('Gökhan Cafer Kılıçarslan'),
                Text('0551 ***** 3'),
                Text('Sütlüce İstanbul'),
                Text('Ahmet sokak faruk caddesi no 38 daire 3'),
                Text('Bağcılar İstanbul'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdresDuzenleSayfasi()),
                );
              },
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.location_city),
                SizedBox(width: 8),
                Text('Adres Adı'),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text('Gökhan Cafer Kılıçarslan'),
                Text('0551 ***** 3'),
                Text('Sütlüce İstanbul'),
                Text('Ahmet sokak faruk caddesi no 38 daire 3'),
                Text('Bağcılar İstanbul'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdresDuzenleSayfasi()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AdresDuzenleSayfasi extends StatefulWidget {
  @override
  _AdresDuzenleSayfasiState createState() => _AdresDuzenleSayfasiState();
}

class _AdresDuzenleSayfasiState extends State<AdresDuzenleSayfasi> {
  final _formKey = GlobalKey<FormState>();

  // Ortak text field stilini tanımlayalım
  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey[700]),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.green, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      filled: true,
      fillColor: Colors.grey.shade50,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adres Düzenle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                "İletişim Bilgileri",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 16),
              TextFormField(decoration: _buildInputDecoration('Ad')),
              SizedBox(height: 16),
              TextFormField(decoration: _buildInputDecoration('Soyad')),
              SizedBox(height: 16),
              TextFormField(decoration: _buildInputDecoration('Cep Telefonu')),
              SizedBox(height: 16),
              Text(
                "Adres Bilgileri",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                items: ['İstanbul']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {},
                decoration: _buildInputDecoration('İl'),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                items: ['Ümraniye']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {},
                decoration: _buildInputDecoration('İlçe'),
              ),
              SizedBox(height: 16),
              TextFormField(decoration: _buildInputDecoration('Mahalle')),
              SizedBox(height: 16),
              TextFormField(
                decoration: _buildInputDecoration('Adres'),
                maxLines: 3, // Adres için daha fazla satır
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Radio(
                      fillColor: MaterialStateProperty.all(Colors.green),
                      value: 'Şahıs',
                      groupValue: 'Şahıs',
                      onChanged: (value) {}),
                  Text('Şahıs'),
                  Radio(
                      value: 'Kurumsal',
                      groupValue: 'Şahıs',
                      onChanged: (value) {}),
                  Text('Kurumsal'),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Formu kaydet
                    Navigator.pop(context); // Önceki sayfaya geri dön
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Kaydet',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
