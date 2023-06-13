import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.onTap, this.answer, {super.key});

  final Function() onTap;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(answer),
      ),
    );
  }
}
