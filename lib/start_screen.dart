import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StartScreen extends StatelessWidget {
  const StartScreen( this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 300,color: const Color.fromARGB(150,255,255,255)),//ikinci yol ama en duzgunu budu

          // Opacity(// sekil seffafligini ayarliyir// cox performans isteyir deye bundan eslinde qacinmaq lazimdir
          //   opacity: 0.5,
          //   child: Image.asset('assets/images/quiz-logo.png', width: 300),
          // ),
          const SizedBox(height: 80),
           Text(
            'Learn Flutter The Fun Way',
            style: GoogleFonts.lato
              (color: Colors.white,
               fontSize: 24,
               fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 80,
          ),
          OutlinedButton.icon(
              onPressed: () {
                startQuiz();
              },
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz')),
        ],
      ),
    );
  }
}
