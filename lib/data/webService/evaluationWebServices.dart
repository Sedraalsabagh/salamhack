import 'dart:io' show Platform;
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:devloper_app/data/models/evaluation.dart';
import '../../constants/String.dart';
import '../../presentaion/screen/token_manger.dart';

class ResumeWebServices {
  final Dio dio;

  ResumeWebServices()
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
        ));

  Future<ResumeEvaluationResult> evaluateResume({
    required String jobDescription,
    String? filePath,
    List<int>? fileBytes,
    String? fileName,
  }) async {
    try {
      FormData formData;
      if (kIsWeb) {
        if (fileBytes == null || fileName == null) {
          throw Exception('لم يتم اختيار الملف بشكل صحيح على الويب');
        }
        if (!fileName.toLowerCase().endsWith(".pdf")) {
          throw Exception("File format excpetion, support only PDF");
        }
        formData = FormData.fromMap({
          'job_description': jobDescription,
          'pdf_file': MultipartFile.fromBytes(
            fileBytes,
            filename: fileName,
            contentType: MediaType('application', 'pdf'),
          ),
        });
      } else {
        if (filePath == null || fileName == null) {
          throw Exception('لم يتم اختيار الملف بشكل صحيح على الهاتف/الكمبيوتر');
        }
        formData = FormData.fromMap({
          'job_description': jobDescription,
          'pdf_file':
              await MultipartFile.fromFile(filePath, filename: fileName),
        });
      }

      // TODO: get the token from shared-pref
      String? accessToken = await TokenManager.getAccessToken();
      if (accessToken == null) {
        print("Error: access token not found");
        throw Exception("access token not found");
      }

      final response = await dio.post(
        'resume/evaluation-resume/',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return ResumeEvaluationResult.fromJson(response.data);
      } else {
        print("❌ Server Error: ${response.data}");
        throw Exception(
            'فشل تقييم السيرة الذاتية. كود الاستجابة: ${response.statusCode}');
      }
    } catch (e) {
      if (e is DioException) {
        print("❌ Dio Error: ${e.response?.data}");
        print("❌ Status Code: ${e.response?.statusCode}");
      } else {
        print("❌ Unknown Error: $e");
      }
      throw Exception('خطأ أثناء تقييم السيرة الذاتية: $e');
    }
  }
}
