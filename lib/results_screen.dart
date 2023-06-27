// import 'dart:f fi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_2/data/questions.dart';
import 'package:quiz_2/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({required this.restartQuiz, super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answerd $numCorrectQuestions out of $numTotalQuestions questions correctly..!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: const Color.fromARGB(255, 247, 201, 255)
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // const Text("List of answers and questions"),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 66, 29, 168)
              ),
              icon: const Icon(Icons.restart_alt_rounded),
              onPressed: restartQuiz,
              label: const Text("Restart Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
