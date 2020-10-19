import 'question.dart';

class QuizBrain {
  int _Qnumber = 0;
  void nextquestion() {
    if (_Qnumber < _Qbank.length - 1) {
      _Qnumber++;
    }
  }

  List<Question> _Qbank = [
    Question(questionText: 'your name is shivanshu', questionAnswer: true),
    Question(questionText: 'your surname is jain', questionAnswer: false),
    Question(questionText: 'you live in jaipur', questionAnswer: true),
    Question(questionText: 'you study in kota', questionAnswer: false),
    Question(questionText: 'you are in sir MVIT college', questionAnswer: true),
    Question(questionText: 'you are in 4th year', questionAnswer: false),
    Question(questionText: 'your cgpa is 8.4', questionAnswer: true),
    Question(questionText: 'your college is in banglore', questionAnswer: true),
  ];
  String getquestiontext() {
    return _Qbank[_Qnumber].questionText;
  }

  bool getanswer() {
    return _Qbank[_Qnumber].questionAnswer;
  }

  int len() {
    return _Qbank.length;
  }

  void cl() {
    _Qnumber = 0;
  }

  bool isFinished() {
    if (_Qnumber == _Qbank.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}
