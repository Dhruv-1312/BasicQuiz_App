import 'package:flutter/material.dart';
import 'package:adv_basics/answer.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key,required this.onSelected});

  final Function(String ans) onSelected;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var ind = 0;
  void questionIndex(String ans) {
    widget.onSelected(ans);
    setState(() {
        ind = ind + 1;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[ind];
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              Text(
                currentQuestion.text,
                textAlign: TextAlign.center,
                style: GoogleFonts.rubikBubbles(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.getshuffledAns().map((answer) {
                return AnswerButton(answerText: answer, onTap:
                (){
                  questionIndex(answer);
                });
              })
              // AnswerButton(answerText: 'answer 1',onTap: (){},),
              // AnswerButton(answerText: 'answer 2',onTap: (){},)
            ],
          ),
        ),
      ),
    );
  }
}
