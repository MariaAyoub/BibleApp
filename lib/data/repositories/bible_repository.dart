import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/bible_verse.dart';

class BibleRepository {
  final FirebaseFirestore firestore;

  BibleRepository({FirebaseFirestore? firebaseFirestore})
      : firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<BibleVerse>> getBibleVerses(String book, int chapter) {
    return firestore.collection('bible').doc(book).collection('chapters')
        .doc(chapter as String?).snapshots().map((snapshot) {
      return (snapshot.data()!['verses'] as List)
          .map((verse) => BibleVerse.fromMap(verse))
          .toList();
    });
  }
}
