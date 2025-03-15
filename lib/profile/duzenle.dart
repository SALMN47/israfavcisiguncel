import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:israfavcisi/constants/appconstants.dart';
import 'package:israfavcisi/profile/upload.dart';
import 'package:israfavcisi/widgets/custombutton.dart';

class duzenlePage extends StatefulWidget {
  const duzenlePage({super.key});

  @override
  State<duzenlePage> createState() => _duzenlePageState();
}

class _duzenlePageState extends State<duzenlePage> {
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

  String? _selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.blackBackgroundColor,
      appBar: AppBar(
        backgroundColor: Appcolors.blackBackgroundColor,
        title: const Text(
          'Profil Düzenle',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          color: Appcolors.greenBackground,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: AppSizes.myHeight(context) / 18,
                    child: Icon(Icons.person),
                  ),
                ),
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Appcolors.greenBackground,
                        borderRadius: BorderRadius.circular(10)),
                    width: AppSizes.myWidth(context) / 10,
                    height: AppSizes.myHeight(context) / 23,
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        _showPicker();
                      },
                    ),
                  ),
                  top: AppSizes.myHeight(context) / 15,
                  right: AppSizes.myWidth(context) / 2.8,
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 50,
            ),
            area(context, 'First Name'),
            area(context, 'Last Name'),
            area(context, 'Gender '),
            area(context, 'Birthday'),
            area(context, 'Email'),
            area(context, 'Phone Number'),
            area(context, 'Address'),
            SizedBox(
              height: AppSizes.myHeight(context) / 40,
            ),
            CustomButton(text: 'Save Changes', onPressed: () {}),
            SizedBox(
              height: AppSizes.myHeight(context) / 10,
            ),
          ],
        ),
      ),
    );
  }

  Padding area(BuildContext context, String text) {
    if (text.trim() == "Gender") {
      return Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSizes.myHeight(context) / 60),
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 70,
            ),
            DropdownButtonFormField<String>(
              value: _selectedGender,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
              decoration: InputDecoration(
                  fillColor: const Color(0xFF1B2B3A),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Appcolors.greenBackground))),
              dropdownColor: const Color(0xFF1B2B3A),
              items: const [
                DropdownMenuItem(
                  value: "Male",
                  child: Text("Male", style: TextStyle(color: Colors.white)),
                ),
                DropdownMenuItem(
                  value: "Female",
                  child: Text("Female", style: TextStyle(color: Colors.white)),
                ),
                DropdownMenuItem(
                  value: "Other",
                  child: Text("Other", style: TextStyle(color: Colors.white)),
                ),
              ],
              onChanged: (String? newValue) {
                // Seçilen değeri state'e aktarıyoruz.
                setState(() {
                  _selectedGender = newValue;
                });
              },
            ),
          ],
        ),
      );
    } else if (text.trim() == "Birthday") {
      return Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSizes.myHeight(context) / 60),
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 70,
            ),
            TextFormField(
              readOnly: true,
              cursorColor: Appcolors.greenBackground,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  // Seçilen tarihi uygun formatta gösterebilirsiniz.
                }
              },
              decoration: InputDecoration(
                  fillColor: const Color(0xFF1B2B3A),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Appcolors.greenBackground))),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSizes.myHeight(context) / 60),
            ),
            SizedBox(
              height: AppSizes.myHeight(context) / 70,
            ),
            TextFormField(
              cursorColor: Appcolors.greenBackground,
              decoration: InputDecoration(
                  fillColor: const Color(0xFF1B2B3A),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Appcolors.greenBackground))),
            ),
          ],
        ),
      );
    }
  }
}
