import 'package:flutter/material.dart';
import 'package:israfavcisi/constants/appconstants.dart';

class dilpage extends StatefulWidget {
  const dilpage({super.key});

  @override
  State<dilpage> createState() => _dilpageState();
}

class _dilpageState extends State<dilpage> {
  TextEditingController searchController = TextEditingController();
  String selectedLanguage = "Türkçe";
  List<String> languages = [
    "Türkçe",
    "English",
    "Français",
    "Español",
    "Deutsch",
    "Italiano",
    "Português",
    "Русский",
    "中文",
  ];

  List<String> filteredLanguages = [];

  @override
  void initState() {
    super.initState();
    filteredLanguages = _languageListExcludingSelected();
  }

  List<String> _languageListExcludingSelected() {
    return languages.where((lang) => lang != selectedLanguage).toList();
  }

  void _filterLanguages(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredLanguages = _languageListExcludingSelected();
      } else {
        filteredLanguages = languages
            .where((lang) =>
                lang.toLowerCase().contains(query.toLowerCase()) &&
                lang != selectedLanguage)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.blackBackgroundColor,
      appBar: AppBar(
        backgroundColor: Appcolors.blackBackgroundColor,
        iconTheme: const IconThemeData(color: Appcolors.greenBackground),
        title: Text(
          "Dil Seçimi",
          style: AppTextStyles.headline1!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: AppSizes.myHeight(context) / 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Arama kutucuğu
            TextField(
              controller: searchController,
              onChanged: _filterLanguages,
              style: AppTextStyles.subText,
              cursorColor: Appcolors.greenBackground,
              decoration: InputDecoration(
                hintText: "Dil ara...",
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
                prefixIcon:
                    const Icon(Icons.search, color: Appcolors.greenBackground),
              ),
            ),
            const SizedBox(height: 20),
            // Seçili dili gösteren ListTile
            ListTile(
              leading:
                  const Icon(Icons.check, color: Appcolors.greenBackground),
              title: Text(
                selectedLanguage,
                style: AppTextStyles.subText,
              ),
              tileColor: const Color(0xFF1B2B3A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            // Diğer dilleri gösteren kaydırılabilir liste
            Expanded(
              child: ListView.separated(
                itemCount: filteredLanguages.length,
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                ),
                itemBuilder: (context, index) {
                  final lang = filteredLanguages[index];
                  return ListTile(
                    title: Text(
                      lang,
                      style: AppTextStyles.subText,
                    ),
                    tileColor: const Color(0xFF1B2B3A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      setState(() {
                        selectedLanguage = lang;
                        searchController.clear();
                        filteredLanguages = _languageListExcludingSelected();
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
