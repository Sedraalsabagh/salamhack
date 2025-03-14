import 'package:devloper_app/constants/String.dart';
import 'package:dio/dio.dart';

import '../models/cvmodel.dart';

class CVWebServices {
  late Dio dio;

  CVWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
    );
    dio = Dio(options);
  }

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
      print(e);
      throw Exception('Error creating CV');
    }
  }
}
