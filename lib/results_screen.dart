import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers,required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers.isNotEmpty ? questions[i].answers[0] : 'No Answer', // Null kontrolü
        'user_answer': chosenAnswers[i] ?? 'No Answer' // Null kontrolü
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      // mumkun olan genislik qeder genislik istifade etmek ucun,
      child: Container(
        margin: const EdgeInsets.all(40),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
                 style: GoogleFonts.lato(
                   color: Colors.white,
                   fontSize: 20,
                   fontWeight: FontWeight.bold
                 ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(onPressed: onRestart,style: TextButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz'))
          ]),
        ),
    );
  }
}
