// lib/screens/quiz_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/quiz_cubit.dart';
import '../../data/repository/questions.dart';
import '../../data/webService/questionsServices.dart';
import '../screen/widget/question_card.dart';
import '../screen/widget/answer_list.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionsRepository = QuestionsRepository(
      questionsWebServices: QuestionsWebServices(),
    );

    return BlocProvider(
      create: (_) =>
          QuizCubit(questionsRepository: questionsRepository)..fetchQuiz(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MCQ Quiz'),
        ),
        body: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            if (state is QuizInitial || state is QuizLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuizLoaded) {
              return _buildQuizContent(context, state);
            } else if (state is QuizError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text("Unknown state"));
          },
        ),
      ),
    );
  }

  Widget _buildQuizContent(BuildContext context, QuizLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: Column(
          key: ValueKey<int>(state.currentQuestionIndex),
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QuestionCard(question: state.currentQuestion.questionText),
            const SizedBox(height: 20),
            AnswerList(
              answers: state.currentQuestion.answers,
              onAnswerSelected: (selectedIndex) {
                context.read<QuizCubit>().selectAnswer(selectedIndex);
              },
            ),
          ],
        ),
      ),
    );
  }
}
