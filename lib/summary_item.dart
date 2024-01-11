import 'package:flutter/material.dart';
import 'package:quiz_app/question_index.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.itemData});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData['answer'] == itemData['correct_answer'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIndex(
              questionIndex: itemData['question_index'] as int,
              isCorrect: isCorrectAnswer),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(itemData['answer'] as String,
                    style: TextStyle(color: Colors.green.shade300)),
                Text(itemData['correct_answer'] as String,
                    style: TextStyle(color: Colors.red.shade300)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
