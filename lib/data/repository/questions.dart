import '../models/question.dart';
import '../webService/questionsServices.dart';

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
