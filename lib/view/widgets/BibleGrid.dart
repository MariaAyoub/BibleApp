import 'BookTile.dart';
import 'package:flutter/material.dart';


class BibleGrid extends StatelessWidget {
  final List<Map<String, String>> books;
  final String Type  ;
  BibleGrid({required this.books ,required this.Type });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: books.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Three books in each row
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return BookTile(
          title: books[index]['title']!,
          imagePath: books[index]['image']!,
          Type: Type,
        );
      },
    );
  }
}