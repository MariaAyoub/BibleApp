import 'package:flutter/material.dart';

class ContinueReadingSection extends StatelessWidget {
  final String lastChapter;

  ContinueReadingSection({required this.lastChapter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(Icons.book, size: 40),
        title: Text(
          'استكمل قراءتك',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text('آخر أصحاح مفتوح: $lastChapter'),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
