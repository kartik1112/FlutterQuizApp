// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 249, 133, 241),
                    // color: isCorrectAnswer
                    //   : const Color.fromARGB(255, 249, 133, 241),
                    //   ? const Color.fromARGB(255, 150, 198, 241)
                    borderRadius: BorderRadius.circular(100),
      ),
                    child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          // textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            // backgroundColor: Colors.white,
                            fontSize: 16,
                        ),
                      ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          // textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 253, 225, 255)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.lato(
                              // fontSize: 15,
                              color: const Color.fromARGB(255, 202, 171, 252)),
                        ),
                        Text(
                            // textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                              // fontSize: 15,
                              color: const Color.fromARGB(255, 181, 254, 246),
                            ),
                            data['correct_answer'] as String),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
