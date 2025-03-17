import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String question;

  const QuestionCard({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          question,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
