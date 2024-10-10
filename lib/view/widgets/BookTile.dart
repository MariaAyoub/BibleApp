import 'package:flutter/material.dart';
import '../../data/models/bible_verse.dart';
import '../screens/BibleListeningPage.dart';
import '../screens/BibleReadingPage.dart';
import '../screens/BibleVideoPage.dart';

class BookTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final String Type ;

  BookTile({required this.title, required this.imagePath ,  required this.Type});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(Type == "read"){
          // Navigate to the BibleReadingPage when tapped
           Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BibleReadingPage(
              bookName: title,
              chapterNumber: 1, 
              verses: _getSampleVerses(), 
            ),
          ),
        );
        }
        else if(Type == "listen"){
          // Navigate to the BibleListeningPage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BibleListeningPage(
                bookName: title,
                chapterNumber: 1, // Default to Chapter 1 or modify as needed
              ),
            ),
          );


        }
        else if(Type == "watch"){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BibleVideoPage(
                videoUrl: 'https://video-cdn.youversionapi.com/36240/ar/high.webm', // Replace with your video URL
                title: 'Title of the Video',
              ),
            ),
          );
        }
       
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/$imagePath'), // Image path
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // This is just simulated sample data for the Bible verses
  List<BibleVerse> _getSampleVerses() {
    return [
      BibleVerse(
        verse: "في البدء خلق الله السماوات والأرض.",
        number: 1,
       
      ),
      BibleVerse(
        verse: "وكانت الأرض خربة وخالية وعلى وجه الغمر ظلمة.",
        number: 2,
        wordsWithAlternateMeanings: {
          "خربة": "خلاء",
        },
      ),
      BibleVerse(
        verse: "وقال الله: ليكن نور، فكان نور.",
        number: 3,
      ),
      BibleVerse(
        verse: "ورأى الله النور أنه حسن، وفصل الله بين النور والظلمة.",
        number: 4,
      ),
      BibleVerse(
        verse: "ودعا الله النور نهاراً والظلمة دعاها ليلاً.",
        number: 5,
      ),
      // Add more verses as needed
    ];
  }
}
