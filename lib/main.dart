import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/answer_model.dart';
import 'models/quize_model.dart';
import 'answer.dart';
import './question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;
  int _totalScore = 0;

  late List<QuizeModel> _data;

  Future<void> loadData() async {
    var data = await rootBundle.loadString("assets/data.json");
    final splitedData = json.decode(data)["quiz"];

    setState(() {
      _data =
          splitedData.map<QuizeModel>((e) => QuizeModel.fromJson(e)).toList();
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void _chooseQuesions(int newScore) {
    setState(() {
      _totalScore += newScore;
      _index = _index + 1;
    });
  }

  void _refreshQuiz() {
    setState(() {
      _index = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: _index < _data.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Question(_data[_index].question!.text!),
                  ...(_data[_index].answer as List<AnswerModel>).map(
                    (answer) {
                      return Answer(() {
                        if (answer.isCorrect!) {
                          _chooseQuesions(_data[_index].question!.score!);
                        } else {
                          _chooseQuesions(0);
                        }
                      }, answer.text!);
                    },
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "You did it !",
                      style: TextStyle(
                          color: _totalScore > 90 ? Colors.green : Colors.red,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$_totalScore Points",
                      style: TextStyle(
                          color: _totalScore > 90 ? Colors.green : Colors.red,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton.icon(
                      onPressed: _refreshQuiz,
                      label: const Text(
                        "Refresh",
                        style: TextStyle(fontSize: 20),
                      ),
                      icon: const Icon(
                        Icons.refresh,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
