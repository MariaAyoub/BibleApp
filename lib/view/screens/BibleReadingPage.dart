import 'package:flutter/material.dart';
import '../../data/models/bible_verse.dart';
import '../widgets/VerseTile.dart';

class BibleReadingPage extends StatelessWidget {
  final String bookName;
  final int chapterNumber;
  final List<BibleVerse> verses; // Updated to use BibleVerse objects

  BibleReadingPage({
    required this.bookName,
    required this.chapterNumber,
    required this.verses,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$bookName $chapterNumber'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.format_size),
            onPressed: () {
              // Action for changing font size (not implemented here)
            },
          ),
          IconButton(
            icon: Icon(Icons.audiotrack),
            onPressed: () {
              // Action for playing audio (not implemented here)
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: verses.length,
          itemBuilder: (context, index) {
            final verse = verses[index]; // Get the current BibleVerse object

            return VerseTile(
              verseNumber: verse.number, // Use verse number from BibleVerse
              verseText: verse.verse, // Use verse text from BibleVerse
              wordsWithAlternateMeanings: verse.wordsWithAlternateMeanings // Pass the alternate meanings if needed
            );
          },
        ),
      ),
    );
  }
}
