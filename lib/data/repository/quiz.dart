import 'package:devloper_app/data/models/quiz.dart';
import 'package:devloper_app/data/webService/quizWebServices.dart';

class QuestionsRepository {
  final QuestionsWebServices questionsWebServices;

  QuestionsRepository({required this.questionsWebServices});

  Future<List<Question>> fetchQuestions(Map<String, dynamic> requestBody) async {
    try {
      return await questionsWebServices.fetchQuestions(requestBody);
    } catch (e) {
      throw Exception("Error fetching questions: $e");
    }
  }
  
}
