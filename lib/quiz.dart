import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var currentScreen = 'start-screen';
  final List<String> answeredQuestions = [];

  void startQuiz() {
    setState(() {
      currentScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    setState(() {
      answeredQuestions.add(answer);
    });

    if (answeredQuestions.length == questions.length) {
      setState(() {
        currentScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      answeredQuestions.clear();
      currentScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(startQuiz);

    if (currentScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectedAnswer: chooseAnswer,
      );
    }

    if (currentScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        choosenAnswers: answeredQuestions,
        onRestartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 130, 74, 226),
                Color.fromARGB(255, 79, 44, 140)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
