import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List for the questions
  List<String> questions= const [
    '这个世界又蠢又笨。',
    '外面的人足够聪明，能够理解复杂性。',
    '我讨厌所有人。',
  ];
  //List for the scoreboard
  List<Widget> scoreKeeper =  [
    const Icon(
      Icons.check,
      color: Colors.green,
     ),
    const Icon(
      Icons.close,
      color: Colors.red,
     ),
  ];
  //Creating a tracker to track the question number
  var questionNumber = 0;
  @override
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
                    questions[questionNumber],
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
                      minimumSize: const Size(10, 10),
                    ),
                    onPressed: () {
                      setState(() {
                      //   scoreKeeper.add(
                      //   const Icon(
                      //     Icons.check,
                      //     color: Colors.green,
                      //   ),
                      // );
                      if(questionNumber < questions.length - 1){
                        questionNumber++;
                       }
                    });
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
                      minimumSize: const Size(10, 10),
                    ),
                    onPressed: () {
                      setState(() {
                      //   scoreKeeper.add(
                      //   const Icon(
                      //     Icons.close,
                      //     color: Colors.red,
                      //   ),
                      // );
                      if(questionNumber < questions.length - 1){
                        questionNumber++;
                       }
                    });
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
