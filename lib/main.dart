import 'package:flutter/material.dart';

import 'package:flutter_practice/result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _question = const [
    {
      'questionText': 'What is your favorite color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answer': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answer': [
        {'text': 'Max', 'score': 3},
        {'text': 'Ram', 'score': 3},
        {'text': 'Hari', 'score': 3},
        {'text': 'Shyam', 'score': 3},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _question.length) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "My First App",
          ),
        ),
        body: _questionIndex < _question.length
            ? Quiz(
                answerQuestion: () => _answerQuestion,
                questionIndex: _questionIndex,
                question: _question,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
