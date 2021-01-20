import 'package:quizzler/question.dart';

class QuizBrain {

  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question( 'The highest mountain is mount Everest',  true),
    Question('Horses are only black',  false),
    Question( 'Madrid is Spain\'s Capital', true),
    Question( 'In human body 25 percent of bones are in the feet', true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question( 'Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
  ];

  void nextQuestion() {

    if ( _questionNumber < _questionBank.length -1 ) {
      _questionNumber ++;
    }

  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer( ) {
    return _questionBank[_questionNumber].questionAnswer;
  }


}