import 'package:flutter/material.dart';

class ResultSummary extends StatelessWidget {
  const ResultSummary(this.getSummary, {super.key});
  final List<Map<String, Object>> getSummary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: getSummary.map(
            (data) {
              return Container(
                margin: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(((data['question_index'] as int) + 1).toString()),
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.only(left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            data['question'] as String,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            data['user_Ans'] as String,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            data['correct_Ans'] as String,
                            style: const TextStyle(color: Colors.greenAccent),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
