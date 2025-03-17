import 'package:bloc/bloc.dart';
import '../../data/models/question.dart';
import '../../data/repository/questions.dart';

abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<Question> questions;
  final int currentQuestionIndex;
  final List<int> userAnswers;

  QuizLoaded({
    required this.questions,
    this.currentQuestionIndex = 0,
    List<int>? userAnswers,
  }) : userAnswers = userAnswers ?? [];

  Question get currentQuestion => questions[currentQuestionIndex];
}

class QuizError extends QuizState {
  final String message;
  QuizError({required this.message});
}

class QuizCubit extends Cubit<QuizState> {
  final QuestionsRepository questionsRepository;

  QuizCubit({required this.questionsRepository}) : super(QuizInitial());

  Future<void> fetchQuiz() async {
    emit(QuizLoading());
    try {
      // Construct the request body as required by the backend.
      final Map<String, dynamic> requestBody = {
        "job_field": "Flutter developer",
      };

      final questions = await questionsRepository.fetchQuestions(requestBody);
      emit(QuizLoaded(questions: questions));
    } catch (e) {
      emit(QuizError(message: e.toString()));
    }
  }
  void selectAnswer(int answerIndex) {
    final currentState = state;
    if (currentState is QuizLoaded) {
      final updatedAnswers = List<int>.from(currentState.userAnswers)
        ..add(answerIndex);
      final nextIndex = currentState.currentQuestionIndex + 1;

      if (nextIndex < currentState.questions.length) {
        emit(QuizLoaded(
          questions: currentState.questions,
          currentQuestionIndex: nextIndex,
          userAnswers: updatedAnswers,
        ));
      } else {
        // All questions answered. You can choose to either
        // show a final result screen or remain in this state
        // while including additional calculated info.
        // For now, we re-emit the same loaded state.
        emit(QuizLoaded(
          questions: currentState.questions,
          currentQuestionIndex: currentState.currentQuestionIndex,
          userAnswers: updatedAnswers,
        ));
      }
    }
  }
}
