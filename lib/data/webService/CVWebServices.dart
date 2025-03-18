import 'package:devloper_app/constants/String.dart'; // تأكد من كتابة string.dart بحروف صغيرة
import 'package:dio/dio.dart';
import '../models/cvmodel.dart';

class CVWebServices {
  final Dio dio;

  CVWebServices()
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: Duration(seconds: 60),
          receiveTimeout: Duration(seconds: 60),
        ));

  Future<Map<String, dynamic>> createCV(CVModel cvModel) async {
    try {
      Response response = await dio.post(
        '/resume/generate-resume/',
        data: cvModel.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

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
