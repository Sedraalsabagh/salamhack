import 'package:bloc/bloc.dart';
import 'package:devloper_app/data/models/quiz.dart';
import 'package:devloper_app/data/repository/quiz.dart';


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

  Future<void> fetchQuiz({
    required String title,
    required String requiredSkill,
    required String description,
  }) async {
    emit(QuizLoading());
    try {
      // بناء جسم الطلب باستخدام الحقول الثلاثة المدخلة من قبل المستخدم.
      final Map<String, dynamic> requestBody = {
  "title": title,
  "required_skills": requiredSkill,
  "description": description,
};

      final questions = await questionsRepository.fetchQuestions(requestBody);
      emit(QuizLoaded(questions: questions));
    } catch (e) {
      emit(QuizError(message: "Failed to fetch quiz: ${e.toString()}"));
    }
  }

  // void selectAnswer(int answerIndex) {
  //   final currentState = state;
  //   if (currentState is QuizLoaded) {
  //     final updatedAnswers = List<int>.from(currentState.userAnswers)
  //       ..add(answerIndex);
  //     final nextIndex = currentState.currentQuestionIndex + 1;

  //     if (nextIndex < currentState.questions.length) {
  //       emit(QuizLoaded(
  //         questions: currentState.questions,
  //         currentQuestionIndex: nextIndex,
  //         userAnswers: updatedAnswers,
  //       ));
  //     } else {
  //       // يمكن هنا عرض نتيجة الاختبار أو إعادة عرض السؤال الأخير مع تحديث الإجابات.
  //       emit(QuizLoaded(
  //         questions: currentState.questions,
  //         currentQuestionIndex: currentState.currentQuestionIndex,
  //         userAnswers: updatedAnswers,
  //       ));
  //     }
  //   }
  // }
  void selectAnswerForQuestion(int questionIndex, int answerIndex) {
  final currentState = state;
  if (currentState is QuizLoaded) {
    // انسخ الـ userAnswers الحالية
    final updatedAnswers = List<int>.from(currentState.userAnswers);

    // إذا كانت قائمة الإجابات أقصر من عدد الأسئلة، أكملها بـ -1
    while (updatedAnswers.length < currentState.questions.length) {
      updatedAnswers.add(-1);
    }

    // حدِّث إجابة السؤال المحدد
    updatedAnswers[questionIndex] = answerIndex;

    // أعد إصدار الحالة مع التحديث الجديد
    emit(QuizLoaded(
      questions: currentState.questions,
      currentQuestionIndex: currentState.currentQuestionIndex,
      userAnswers: updatedAnswers,
    ));
  }
}

}
