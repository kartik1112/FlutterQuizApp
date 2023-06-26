import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz, {super.key});
  
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                height: 300,
                color: const Color.fromARGB(169, 255, 255, 255),
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                "Learn Flutter the Fun Way...",
                style: TextStyle(
                  fontSize: 27,
                  color: Color.fromARGB(208, 255, 255, 255),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              OutlinedButton.icon(
                onPressed: startQuiz,
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(208, 255, 255, 255),
                ),
                icon: const Icon(Icons.arrow_circle_right_sharp ),
                label: Text(
                  "Start Quiz",
                  style: GoogleFonts.lato(
                    fontSize: 18
                  ),
                ),
              )
            ],
          );
  }
}