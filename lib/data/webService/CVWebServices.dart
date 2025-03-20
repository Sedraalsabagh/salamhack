import 'package:devloper_app/constants/String.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class CVWebServices {
  final Dio dio;

  CVWebServices()
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: Duration(seconds: 60),
          receiveTimeout: Duration(seconds: 60),
        ));

  Future<Map<String, dynamic>> createCV(Map<String, dynamic> cvJson) async {
    Map<String, dynamic> test_data = {
      "email": "safaabouzaid2@gmail.com",
      "username": "safa_abouzaid21",
      "phone": "0912345678",
      "location": "Damascus, Syria",
      "linkedin_link": "https://www.linkedin.com/in/safaabouzaid/",
      "education": [
        {
          "degree": "",
          "institution": "Al-Sham Private University",
          "start_date": "2021",
          "end_date": "2025",
          "description":
              "Focused on software engineering, machine learning, and backend development."
        }
      ]
    };
    try {
      Response response = await dio.post(
        '/resume/generate-resume/',
        data:
            // test_data,
            jsonEncode(cvJson),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      print("\n ------- \n${cvJson} \n -------- \n");
      print("Response Data: ${response.data}");
      return response.data;
    } on DioError catch (dioError) {
      print("DioError: ${dioError.message}");
      if (dioError.response != null) {
        print("Response Error Data: ${dioError.response?.data}");
      }
      throw Exception('Failed to create CV: ${dioError.message}');
    } catch (e) {
      print("Unexpected Error: $e");
      throw Exception('Unexpected error occurred');
    }
  }
}
