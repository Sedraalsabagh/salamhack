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

  Map<String, dynamic> filteredcvJson = {};
  for (var entry in cvJson.entries) {
    var key = entry.key;
    var value = entry.value;

    if (value is Map<String, dynamic>) {
      var filteredNested = await createCV(value);
      if (filteredNested.isNotEmpty) {
        filteredcvJson[key] = filteredNested;
      }
    } else if (value != null) {
      filteredcvJson[key] = value;
    }
  }

    print("\n \n --> in services layer \n \n");
    print("-->> ${jsonEncode(filteredcvJson)} <<--");
    try {
      Response response = await dio.post(
        '/resume/generate-resume/',
        data:
            // test_data_post_man,
            jsonEncode(filteredcvJson),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      print("\n ------- \n${filteredcvJson} \n -------- \n");
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
