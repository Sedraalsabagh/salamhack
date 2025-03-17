import 'package:flutter/material.dart';

class AnswerList extends StatelessWidget {
  final List<String> answers;
  final Function(int) onAnswerSelected;

  const AnswerList({
    Key? key,
    required this.answers,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(answers.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
            ),
            onPressed: () {
              onAnswerSelected(index);
            },
            child: Text(
              answers[index],
              style: const TextStyle(fontSize: 18),
            ),
          ),
        );
      }),
    );
  }
}
