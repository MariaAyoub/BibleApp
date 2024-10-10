import 'package:flutter/material.dart';
import '../widgets/BibleGrid.dart';
import '../widgets/ContinueReadingSection.dart';
import '../widgets/SectionTitle.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> oldTestamentBooks = [
      {"title": "التكوين", "image": "genesis.png"},
      {"title": "الخروج", "image": "exodus.png"},
      {"title": "اللاويين", "image": "leviticus.png"},
      // Add more books
    ];
    List<Map<String, String>> audioBooks = [
      {"title": "التكوين", "image": "genesis.png"},
      {"title": "الخروج", "image": "exodus.png"},
      {"title": "اللاويين", "image": "leviticus.png"},
      // Add more books
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Bible App'),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl, 
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Continue Reading Section
                // ContinueReadingSection(lastChapter: 'رومية 8'),
                // SizedBox(height: 20),

                // Old Testament Section
                SectionTitle(title: 'اقرأ الكتاب المقدس', subTitle:''),
                SectionTitle(title: '', subTitle: 'العهد القديم'),
                SizedBox(height: 5),
                BibleGrid(books: oldTestamentBooks , Type: "read",),
                SizedBox(height: 20),
               
                // Listen to Bible Section
                SectionTitle(title: 'استمع إلى الكتاب المقدس', subTitle:''),
                SectionTitle(title: '', subTitle: 'العهد القديم'),
                SizedBox(height: 5),
                BibleGrid(books: audioBooks , Type: "listen",),
               
                // Watch to Bible Section
                SectionTitle(title: 'شاهد إلى الكتاب المقدس', subTitle:''),
                SectionTitle(title: '', subTitle: 'العهد القديم'),
                SizedBox(height: 5),
                BibleGrid(books: audioBooks , Type: "watch",),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
