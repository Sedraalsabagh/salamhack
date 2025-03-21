import 'package:devloper_app/data/models/quiz.dart';
import 'package:dio/dio.dart';
import '../../constants/String.dart';


class QuestionsWebServices {
  final Dio dio;

  QuestionsWebServices()
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: Duration(seconds: 60),
          receiveTimeout: Duration(seconds: 60),
        ));


  Future<List<Question>> fetchQuestions(Map<String, dynamic> requestBody) async {
    try {
      Response response = await dio.post(
        'generate-questions/',
        data: requestBody,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201) {
        var data = response.data;
        if (data is Map<String, dynamic>) {
          if (data.containsKey('questions')) {
            final List<dynamic> questionsJson = data['questions'] as List<dynamic>;
            return questionsJson
                .map((json) => Question.fromJson(json as Map<String, dynamic>))
                .toList();
          } else {
            throw Exception("Response does not contain 'questions' key.");
          }
        } else if (data is List) {
          return data
              .map((json) => Question.fromJson(json as Map<String, dynamic>))
              .toList();
        } else {
          throw Exception('Unexpected response format: ${data.runtimeType}');
        }
      } else {
        throw Exception('Failed to load questions: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching questions: $e');
    }
  }
}
