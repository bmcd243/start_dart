import 'package:flutter/material.dart';

import 'quiz.dart'
import './result.dart'

// void main() {
// runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var questions;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    } else {
      print("We have no more!");
    }

    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print("Answer chosen");
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    //context is the object
    final _questions = const [
      {
        'questionText': 'What\'s your favourite colour?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1}
        ],
      },
      {
        'What\'s your favourite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephany', 'Lion'],
      },
      {
        'Who\'s your favourite instructor?',
        'answers': ['Ben', 'Steve', 'Jack', 'Liam'],
      },
    ];

    var dummy = ['Hello'];
    dummy.add('Max');
    print(dummy);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
          body: _questionIndex < _questions.length
          ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions
          )
          :Result(),
      ),
    );
  }
}
