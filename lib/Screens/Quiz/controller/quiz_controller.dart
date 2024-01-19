import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysaiph/Screens/Quiz/model/question_model.dart';
import 'package:mysaiph/Screens/Quiz/screens/result_screen/result_screen.dart';
import 'package:mysaiph/Screens/Quiz/screens/welcome_screen.dart';

class QuizController extends GetxController{
  String name = '';
  //question variables
  int get countOfQuestion => _questionsList.length;
  final List<QuestionModel> _questionsList = [
    QuestionModel(
      id: 1,
      question:
      "Quel groupe sanguin est nommé le généreux ? ",
      answer: 1,
      options: [' O-', ' AB+', ' HH'],
    ),
    QuestionModel(
      id: 2,
      question: "Quel insecte transmet la maladie de Lyme ?",
      answer: 1,
      options: [' La tique', ' La punaise', ' Le poux'],
    ),
    QuestionModel(
      id: 3,
      question: "Quel sont les symptômes de piqure d'abeille chez les personnes qui y sont allergiques ?",
      answer: 2,
      options: [' Démangeaison', ' Rougeur', ' Difficulté respiratoire  '],
    ),
    QuestionModel(
      id: 4,
      question: "Quel os ne possèdent pas les bébés quand ils naissent ?",
      answer: 1,
      options: [' Rotule', ' Fémur', ' Tibia'],
    ),
    QuestionModel(
      id: 5,
      question: "Combien de dents possède l'homme à l'age adulte ?",
      answer: 3,
      options: ['32', '28', '36'],
    ),
    QuestionModel(
      id: 6,
      question: "Comment se nomme un trou dans la dent ?",
      answer: 2,
      options: [' Carie', ' Gingivite', ' Inflammation'],
    ),
    QuestionModel(
      id: 7,
      question: "Quelle matière est usuellement utilisée dans les dentifrices ?",
      answer: 3,
      options: [' Fluor', ' Charbon', ' Sel'],
    ),
    QuestionModel(
      id: 8,
      question: "Quel est le volume de sang total d'un adulte ?",
      answer: 3,
      options: [' 7 litres', ' 5 litres', ' 4 litres'],
    ),
    QuestionModel(
      id: 9,
      question: "Combien de semaine environ dure la grossesse de la femme?",
      answer: 2,
      options: [' 40', ' 32', ' 55'],
    ),
    QuestionModel(
      id: 10,
      question: "Quelle est la température normale du corps humain ? ",
      answer: 1,
      options: [' 37', ' 37,5', ' 38.2'],
    ),
    QuestionModel(
      id: 11,
      question: "Qu'est-ce qui peut provoquer un aplatissement du diaphragme ? ",
      answer: 1,
      options: [' Gonflement des poumons', ' Bâillement', ' Éternuement'],
    ),
    QuestionModel(
      id: 12,
      question: "Combien de muscles y a- t- il dans le corps humain ? ",
      answer: 1,
      options: [' 800', ' 600', ' 1100'],
    ),
    QuestionModel(
      id: 13,
      question: "Quels types de cellules sanguines sont responsables de la coagulation ? ",
      answer: 1,
      options: [' Plaquettes', ' Globules blancs', ' Globules rouges'],
    ),
    QuestionModel(
      id: 14,
      question: "Quel est l’organe qui sécrète l’insuline ?",
      answer: 1,
      options: [' Pancréas', ' Le foie', ' Les reins'],
    ),
    QuestionModel(
      id: 15,
      question: "Quelle est la forme des cellules sanguines ? ",
      answer: 1,
      options: [' Cercle', ' Anneau', ' Rectangle'],
    ),
    QuestionModel(
      id: 16,
      question: "Quels types de cellules trouve-t-on dans le cerveau ? ",
      answer: 1,
      options: [' Globules rouges', ' Cellules épithéliales', ' Cellules nerveuses'],
    ),
    QuestionModel(
      id: 17,
      question: "Quels sont les plus gros organes du corps humain ? ",
      answer: 1,
      options: ['Foie', ' Peau', 'Rate'],
    ),
    QuestionModel(
      id: 18,
      question: "Quel est le plus gros os du corps humain ? ",
      answer: 1,
      options: [' Fémur', ' Os pelvien', ' Os du crâne'],
    ),
    QuestionModel(
      id: 19,
      question: "Combien d’os y a -t- il dans le crâne humain ? ",
      answer: 1,
      options: [' 22', ' 33', ' 44'],
    ),
    QuestionModel(
      id: 20,
      question: "Combien de papilles gustatives y a -t- il dans la langue humaine ? ",
      answer: 1,
      options: [' 10 000', ' 20 000', ' 30 000'],
    ),
    QuestionModel(
      id: 21,
      question: "Quel est le premier symptôme à rechercher chez un patient qui tousse ? ",
      answer: 1,
      options: [' Douleur thoracique', ' Fièvre', ' Écoulement nasal'],
    ),


  ];

  List<QuestionModel> get questionsList => [..._questionsList];


  bool _isPressed = false;


  bool get isPressed => _isPressed; //To check if the answer is pressed


  double _numberOfQuestion = 1;


  double get numberOfQuestion => _numberOfQuestion;


  int? _selectAnswer;


  int? get selectAnswer => _selectAnswer;


  int? _correctAnswer;


  int _countOfCorrectAnswers = 0;


  int get countOfCorrectAnswers => _countOfCorrectAnswers;

  //map for check if the question has been answered
  final Map<int, bool> _questionIsAnswerd = {};


  //page view controller
  late PageController pageController;

  //timer
  Timer? _timer;


  final maxSec = 15;


  final RxInt _sec = 15.obs;


  RxInt get sec => _sec;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    resetAnswer();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  //get final score
  double get scoreResult {
    return _countOfCorrectAnswers * 100 / _questionsList.length;
  }

  void checkAnswer(QuestionModel questionModel, int selectAnswer) {
    _isPressed = true;

    _selectAnswer = selectAnswer;
    _correctAnswer = questionModel.answer;

    if (_correctAnswer == _selectAnswer) {
      _countOfCorrectAnswers++;
    }
    stopTimer();
    _questionIsAnswerd.update(questionModel.id, (value) => true);
    Future.delayed(const Duration(milliseconds: 500)).then((value) => nextQuestion());
    update();
  }

  //check if the question has been answered
  bool checkIsQuestionAnswered(int quesId) {
    return _questionIsAnswerd.entries
        .firstWhere((element) => element.key == quesId)
        .value;
  }

  void nextQuestion() {
    if (_timer != null || _timer!.isActive) {
      stopTimer();
    }

    if (pageController.page == _questionsList.length - 1) {
      Get.offAndToNamed(ResultScreen.routeName);
    } else {
      _isPressed = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);

      startTimer();
    }
    _numberOfQuestion = pageController.page! + 2;
    update();
  }

  //called when start again quiz
  void resetAnswer() {
    for (var element in _questionsList) {
      _questionIsAnswerd.addAll({element.id: false});
    }
    update();
  }

  //get right and wrong color
  Color getColor(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Colors.green.shade700;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Colors.red.shade700;
      }
    }
    return Colors.white;
  }

  //het right and wrong icon
  IconData getIcon(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Icons.done;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Icons.close;
      }
    }
    return Icons.close;
  }

  void startTimer() {
    resetTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_sec.value > 0) {
        _sec.value--;
      } else {
        stopTimer();
        nextQuestion();
      }
    });
  }

  void resetTimer() => _sec.value = maxSec;

  void stopTimer() => _timer!.cancel();
  //call when start again quiz
  void startAgain() {
    _correctAnswer = null;
    _countOfCorrectAnswers = 0;
    resetAnswer();
    _selectAnswer = null;
    Get.offAllNamed(WelcomeScreen.routeName);
  }
}
