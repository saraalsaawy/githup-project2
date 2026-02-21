import 'package:flutter/material.dart';
import 'package:flutter_project2/constants/app_colors.dart';
import 'package:flutter_project2/extension/navigator.dart';
import 'package:flutter_project2/models/question_model.dart';
import 'package:flutter_project2/screens/result_screen.dart';
import 'package:flutter_project2/widgets/app_drawer.dart';
import 'package:flutter_project2/widgets/costom_app_bar.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  String? selectedAnswer;

  String? selectedLight;
  String? selectedWater;
  String? selectedDifficulty;

  final List<QuestionModel> questions = [
    QuestionModel(
      question: 'How much sunlight does your space get?',
      options: ['Low', 'Medium', 'Bright'],
    ),
    QuestionModel(
      question: 'How often can you water plants?',
      options: ['Rarely', 'Sometimes', 'Often'],
    ),
    QuestionModel(
      question: 'Do you prefer easy or advanced care?',
      options: ['Easy', 'Moderate', 'Advanced'],
    ),
  ];

  void nextQuestion() {
    if (selectedAnswer == null) return;

    if(currentQuestionIndex==0){
      selectedLight=selectedAnswer;
    }else if(currentQuestionIndex==1){
      selectedWater=selectedAnswer;
    }else if(currentQuestionIndex==2){
      selectedDifficulty=selectedAnswer;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
      });
    } else {
      Navigator.pushReplacement(
        context,
        context.push(ResultScreen(
          light: selectedLight!,
          water: selectedWater!,
          difficulty: selectedDifficulty!,
        )) 
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];
    return Scaffold(
      appBar: const CostomAppBar(),
      endDrawer: const AppDrawer(),

      body: Padding(
        padding: const EdgeInsetsGeometry.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1} of ${questions.length}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              question.question!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            ...question!.options!.map((option) {
              final isSelected = selectedAnswer == option;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected
                        ? AppColors.greenColor
                        : Colors.grey[200],
                    foregroundColor: isSelected ? Colors.white : Colors.black,
                    minimumSize: const Size(double.infinity, 55),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedAnswer = option;
                    });
                  },
                  child: Text(option),
                ),
              );
            }),

            const Spacer(),

            ElevatedButton(
              onPressed: selectedAnswer == null ? null : nextQuestion,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedAnswer == null
                        ? AppColors.greenColor
                        : Colors.grey[200],
                foregroundColor: selectedAnswer == null ? Colors.white : Colors.black,        
                minimumSize: const Size(double.infinity, 55),
              ),
              child: Text(
                currentQuestionIndex == questions.length - 1
                    ? 'Finish'
                    : 'Next',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
