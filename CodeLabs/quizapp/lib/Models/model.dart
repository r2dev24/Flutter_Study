import 'dart:math' as math;

class Question {
  final String question;
  final List<String> possibleAnswers;
  final int correctAnswer;
  Question(this.question, this.possibleAnswers, this.correctAnswer);
}

class QuestionBank {
  final List<Question> _questions = _createQuestions();

  bool get hasNextQuestion => _questions.isNotEmpty;
  int get remainingQuestions => _questions.length;

  Question? getRandomQuestion() {
    //Check Empty
    if (_questions.isEmpty) {
      return null;
    }

    //Question Index
    var i = math.Random().nextInt(_questions.length);
    //Questions
    var question = _questions[i];

    //Remove Questions
    _questions.removeAt(i);
    
    return question;
  }
}

List<Question> _createQuestions() {
  return [
    //Q1
    Question(
      'What class used to create custom explicit animations in Flutter?',
      [
        //Answers
        'AnimationController',
        'AnimatedWidget',
        'AnimatedBuilder',
        'Tween',
      ],
      0,
    ),
    //Q2
    Question(
      'Which widget is used to rebuild its child whenever an animation changes?',
      [
        //Answers
        'AnimatedContainer',
        'AnimatedBuilder',
        'AnimatedSwitcher',
        'AnimatedOpacity',
      ],
      1,
    ),
    //Q3
    Question(
      //Answers
      'What class is used to define the start and end values for an animation?',
      [
        'Tween',
        'Curve',
        'AnimationController',
        'AnimatedWidget',
      ],
      0,
    ),
  ];
}