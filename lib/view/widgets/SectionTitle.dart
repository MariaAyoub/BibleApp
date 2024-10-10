import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String subTitle;

  SectionTitle({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, 
      children: [
        if (title.isNotEmpty) ...[
          Text(
            title,
            textAlign: TextAlign.right, 
            style: TextStyle(
              fontSize: 22, 
              fontWeight: FontWeight.bold, 
              color: const Color.fromARGB(255, 11, 79, 134),
            ),
          ),
          
        ],
        Text(
          subTitle,
          // textAlign: TextAlign.right, 
          style: TextStyle(
            fontSize: 18, 
            color: const Color.fromARGB(255, 11, 79, 134),
          ),
        ),
        
      ],
    );
  }
}
