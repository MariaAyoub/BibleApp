import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Import for TapGestureRecognizer

class VerseTile extends StatelessWidget {
  final int verseNumber;
  final String verseText;
  final Map<String, String>? wordsWithAlternateMeanings; // Updated to use map for alternate meanings

  VerseTile({
    required this.verseNumber,
    required this.verseText,
    this.wordsWithAlternateMeanings, // Include the alternate meanings map
  });

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textSpans = _buildTextSpans(verseText, context); // Pass context here

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 9, 82, 143),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Center(
            child: Text(
              '$verseNumber',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: textSpans,
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  List<TextSpan> _buildTextSpans(String verseText, BuildContext context) { // Accept context as parameter
    List<TextSpan> textSpans = [];
    // Split the verse into words
    List<String> words = verseText.split(' ');

    for (String word in words) {
      // Check if the word has an alternate meaning
      if (wordsWithAlternateMeanings != null && wordsWithAlternateMeanings!.containsKey(word)) {
        // If the word has an alternate meaning, create a clickable TextSpan
        textSpans.add(
          TextSpan(
            text: '$word ',
            style: TextStyle(color: const Color.fromARGB(255, 21, 79, 126), fontWeight: FontWeight.bold, fontSize: 18),
            recognizer: TapGestureRecognizer() // Add a gesture recognizer
              ..onTap = () {
                // Show a dialog with the alternate meaning
                _showAlternateMeaningDialog(context, word, wordsWithAlternateMeanings![word]!);
              },
          ),
        );
      } else {
        // If no alternate meaning, just add the word normally
        textSpans.add(
          TextSpan(
            text: '$word ',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 7, 7, 7)),
          ),
        );
      }
    }

    return textSpans;
  }
void _showAlternateMeaningDialog(BuildContext context, String word, String alternateMeaning) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog( // Use Dialog instead of AlertDialog for more customization
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0), // Add padding
          width: 300, // Set a fixed width (optional)
          child: Column(
            mainAxisSize: MainAxisSize.min, // Minimize size to content
            children: [
              Text(
                'معني الكلمة',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10), // Add space between title and content
              Text(
                '"$word": $alternateMeaning',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center, // Center the text
              ),
              SizedBox(height: 20), // Space before button
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

}
