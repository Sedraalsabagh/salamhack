import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import '../models/convertcvmodel.dart';
import 'dart:typed_data';

class ResumeWebService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://forsatech.onrender.com';

  Future<ResumeModel> convertResume(
      Uint8List fileBytes, String fileName) async {
    String endpoint = "$baseUrl/resume/convert-resume/";

    FormData formData = FormData.fromMap({
      'pdf_file': MultipartFile.fromBytes(
        fileBytes,
        filename: fileName,
        contentType: MediaType('application', 'pdf'),
      ),
    });

    final response = await _dio.post(endpoint, data: formData);

    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.data);
      return ResumeModel.fromJson(response.data['data']);
    } else {
      throw Exception(
          "Failed to convert resume. Status code: ${response.statusCode}");
    }
  }
}
