// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:quiz_2/answer_button.dart';
import 'package:quiz_2/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
    currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: (Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 241, 181, 246),
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledANswers().map((answer) {
              return AnswerButton(answer, () {
                answerQuestion(answer);
              });
            })
            // AnswerButton(currentQuestion.answers[0], () {}),
            // const SizedBox(height: 5),
            // AnswerButton(currentQuestion.answers[1], () {}),
            // const SizedBox(height: 5),
            // AnswerButton(currentQuestion.answers[2], () {}),
            // const SizedBox(height: 5),
            // AnswerButton(currentQuestion.answers[3], () {}),
            
          ],
        )),
      ),
    );
  }
}
