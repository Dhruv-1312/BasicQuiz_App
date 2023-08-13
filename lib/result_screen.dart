import 'dart:convert';

import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.chooseAnswer, required this.restart});
  final void Function() restart;

  final List<String> chooseAnswer;

  final List<Map<String, Object>> summaryData = [];

  List<Map<String, Object>> getSummary() {
    for (int i = 0; i < chooseAnswer.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_Ans': questions[i].answers[0],
        'user_Ans': chooseAnswer[i],
      });
    }
    return summaryData;
  }

  int score() {
    int count = 0;
    for (int i = 0; i < questions.length; i++) {
      if (chooseAnswer[i] == questions[i].answers[0]) {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    final newResdata = getSummary();
    final url = Uri.https(
        'flutter-adv-basics-default-rtdb.firebaseio.com', 'User_response.json');
    http.post(
      url,
      headers: {'content-type': 'ResponseAns/json'},
      body: jsonEncode(newResdata),
    );
    int p = score();
    int total = questions.length;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 16, 203, 109),
              Color.fromARGB(255, 107, 15, 168),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You Answered $p Questions Correctly out of $total',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              ResultSummary(newResdata),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.restart_alt_sharp),
                  TextButton(
                    onPressed: restart,
                    child: const Text('Restart Quiz!!'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
