import 'package:flutter/material.dart';
import 'package:quizzler/Question.dart';

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

  List<Question> questionBank = [
    Question(q: 'The highest mountain is mount Everest', a: true),
    Question(q: 'Horses are only black', a: false),
    Question(q: 'Madrid is Spain\' Capital', a: true),
    Question(q: 'In human body 25 percent of bones are in the feet', a:true),
    Question(
        q:'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a:false),
    Question(q:'You can lead a cow down stairs but not up stairs.', a:false),
    Question(
        q:'The total surface area of two human lungs is approximately 70 square metres.',
        a:true),
    Question( q:'Google was originally called \"Backrub\".', a:true),
    Question(
        q:'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a:true),
    Question(
        q:'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a:true),
    Question(
        q:'No piece of square dry paper can be folded in half more than 7 times.',
        a:false),
  ];

  int questionNumber = 0;

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
              questionBank[questionNumber].questionText,
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
                setState(() {
                  if (questionBank[questionNumber].questionAnswer == true) {
                    scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                  } else {
                    scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                  }
                  if (questionBank.length == questionNumber + 1) {
                    questionNumber = 0;
                  } else {
                    questionNumber++;
                  }
                });
              },
              child: Text('True'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                setState(() {
                  if (questionBank[questionNumber].questionAnswer == false) {
                    scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                  } else {
                    scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                  }
                  print('questionBank.length = $questionBank.length ');
                  print('questionNumber = $questionNumber');
                  if (questionBank.length == questionNumber + 1) {
                    questionNumber = 0;
                  } else {
                    questionNumber++;
                  }
                });
              },
              child: Text('False'),
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
