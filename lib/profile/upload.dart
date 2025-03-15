import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUploader extends StatefulWidget {
  @override
  _PhotoUploaderState createState() => _PhotoUploaderState();
}

class _PhotoUploaderState extends State<PhotoUploader> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Galeriden Seç"),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("Kamera ile Çek"),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fotoğraf Yükleme")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(_image!,
                    width: 200, height: 200, fit: BoxFit.cover)
                : Icon(Icons.image, size: 100, color: Colors.grey),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _showPicker,
              icon: Icon(Icons.upload),
              label: Text("Fotoğraf Yükle"),
            ),
          ],
        ),
      ),
    );
  }
}
