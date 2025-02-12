import 'questions.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Questions> _questionBank = [
    Questions(q: '这个世界又蠢又笨。',a: true), 
    Questions(q: '外面的人足够聪明，能够理解复杂性。',a: false),
    Questions(q: '我讨厌所有人。', a: true),
    ];

    void nextQuestion(){
      if(_questionNumber < _questionBank.length - 1){
        _questionNumber ++;
      }
    }

    String getQuestionText(){
      return _questionBank[_questionNumber].questionText;
    }

    bool getCorrectAnswer(){
      return _questionBank[_questionNumber].questionAnswer;
    }

    bool isFinished(){
      if(_questionNumber == _questionBank.length - 1){
        return true;
      } else {
        return false;
      }
    }

    void reset(){
      _questionNumber = 0;
    }
}