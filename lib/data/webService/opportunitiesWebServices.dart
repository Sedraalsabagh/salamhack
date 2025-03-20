import 'package:devloper_app/data/models/Job_opportunities.dart';
import 'package:dio/dio.dart';

class JobWebServices {
  final Dio dio;

  JobWebServices()
      : dio = Dio(BaseOptions(
          baseUrl: 'https://forsatech.onrender.com/resume/jobs/',
          receiveDataWhenStatusError: true,
          connectTimeout: Duration(seconds: 60),
          receiveTimeout: Duration(seconds: 60),
        ));

  Future<List<Job>> fetchJobs() async {
    try {
      // نفترض أن API يعيد البيانات باستخدام GET
      Response response = await dio.get('');
      if (response.statusCode == 200) {
        var data = response.data;
        if (data is List) {
          // تحويل بيانات JSON إلى List<Job>
          return data
              .map((json) => Job.fromJson(json as Map<String, dynamic>))
              .toList();
        } else {
          throw Exception('Unexpected response format: ${data.runtimeType}');
        }
      } else {
        throw Exception('Failed to load jobs: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching jobs: $e');
    }
  }
}
