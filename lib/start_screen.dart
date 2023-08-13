import 'package:adv_basics/main.dart';
import 'package:adv_basics/main_screen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({super.key});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  List<String> selectedAnswer = [];
  void chooseAnswer(String ans) {
    selectedAnswer.add(ans);
    if (selectedAnswer.length >= questions.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            chooseAnswer: selectedAnswer,
            restart: restart,
          ),
        ),
      );
    }
  }

  void restart() {
    setState(() {
      selectedAnswer = [];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyApp(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Learn flutter the fun way!!',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(onSelected: chooseAnswer),
                ),
              );
            },
            child: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
