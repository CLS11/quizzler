import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


QuizBrain quizBrain = QuizBrain();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List for the scoreboard
  List<Widget> scoreKeeper =  [
    // const Icon(
    //   Icons.check,
    //   color: Colors.green,
    //  ),
    // const Icon(
    //   Icons.close,
    //   color: Colors.red,
    //  ),
  ];

  void checkAnswer(bool userPickedAnswer){
    
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState((){
      if(quizBrain.isFinished() == true){
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'End of the quiz',
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if(userPickedAnswer == correctAnswer){
          scoreKeeper.add(
            const Icon (
              Icons.check,
              color: Colors.green,
            )
          );
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            )
          );
        }
      }
      quizBrain.nextQuestion();
    });
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'QUIZ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 67, 191, 212),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               Expanded(
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 67, 191, 212),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      checkAnswer(true);
                  },
                    child: const Text(
                      'TRUE',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      checkAnswer(false);
                  },
                    child: const Text(
                      'FALSE',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Row(
                children: scoreKeeper,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
