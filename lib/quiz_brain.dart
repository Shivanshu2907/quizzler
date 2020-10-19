import 'question.dart';

class QuizBrain {
  int _Qnumber = 0;
  void nextquestion() {
    if (_Qnumber < _Qbank.length - 1) {
      _Qnumber++;
    }
  }

  List<Question> _Qbank = [
    Question(q: 'your name is shivanshu', a: true),
    Question(q: 'your surname is jain', a: false),
    Question(q: 'you live in jaipur', a: true),
    Question(q: 'you study in kota', a: false),
    Question(q: 'you are in sir MVIT college', a: true),
    Question(q: 'you are in 4th year', a: false),
    Question(q: 'your cgpa is 8.4', a: true),
    Question(q: 'your college is in banglore', a: true),
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
