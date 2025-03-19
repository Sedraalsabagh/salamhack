import 'dart:io' show Platform;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:devloper_app/data/models/evaluation.dart';
import '../../constants/String.dart'; 

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
        // في الويب
        if (fileBytes == null || fileName == null) {
          throw Exception('لم يتم اختيار الملف بشكل صحيح على الويب');
        }
        formData = FormData.fromMap({
          'job_description': jobDescription,
          'pdf_file': MultipartFile.fromBytes(
            fileBytes,
            filename: fileName,
          ),
        });
      } else {
        if (filePath == null) {
          throw Exception('لم يتم اختيار الملف بشكل صحيح على الهاتف/الكمبيوتر');
        }
        formData = FormData.fromMap({
          'job_description': jobDescription,
          'pdf_file': await MultipartFile.fromFile(filePath),
        });
      }
String accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQzNjY5Njg3LCJpYXQiOjE3NDIzNzM2ODcsImp0aSI6ImU3NjYwZTJjZGQyMDQ4YmFhZDhkZWFhNDkwMzcyZjYyIiwidXNlcl9pZCI6OX0.DTUfSzLzPOzdYqx23qM3tQjC0OZ3_lQ1_Z7DNwErgk0";
      final response = await dio.post(
        'resume/evaluation-resume/', 
        data: formData,
        options: Options(
          headers: {
           'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return ResumeEvaluationResult.fromJson(response.data);
      } else {
        throw Exception('فشل تقييم السيرة الذاتية. كود الاستجابة: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('خطأ أثناء تقييم السيرة الذاتية: $e');
    }
  }
}
