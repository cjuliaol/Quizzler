import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizzPage(),
            ),
          ),
        ),
      ),
    );

class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Widget> scoreKeeper = [];

  QuizBrain quizBrain = QuizBrain();

  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
                context: context,
                title: "Info",
                desc: "You have reached out the end of the quiz.")
            .show();
        quizBrain.reset();
        scoreKeeper = [];
      } else {
        bool correctAnswer = quizBrain.getQuestionAnswer();

        if (correctAnswer == userPickedAnswer) {
          scoreKeeper.add(
            Icon(Icons.check, color: Colors.green),
          );
        } else {
          scoreKeeper.add(
            Icon(Icons.close, color: Colors.red),
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Text(
              quizBrain.getQuestionText(),
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
