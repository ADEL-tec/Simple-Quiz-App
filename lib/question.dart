import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question(this.question, {super.key});

  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      color: const Color.fromARGB(78, 56, 216, 61),
      padding: const EdgeInsets.all(10),
      child: Text(
        question,
        style: const TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 248, 46, 32),
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic),
        textAlign: TextAlign.center,
      ),
    );
  }
}
