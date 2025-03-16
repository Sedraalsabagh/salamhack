import 'package:devloper_app/constants/String.dart';
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
        '/createCV',
        data: cvModel.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      return response.data;
    } catch (e) {
      print("Error: $e");
      throw Exception('Error creating CV');
    }
  }
}
