class BibleVerse {
  final String verse;
  final int number;
  final Map<String, String>? wordsWithAlternateMeanings;

  BibleVerse({
    required this.verse,
    required this.number,
    this.wordsWithAlternateMeanings,
  });

  factory BibleVerse.fromMap(Map<String, dynamic> data) {
    return BibleVerse(
      verse: data['verse'],
      number: data['number'],
      wordsWithAlternateMeanings: Map<String, String>.from(data['wordsWithAlternateMeanings'] ?? {}),
    );
  }
}
