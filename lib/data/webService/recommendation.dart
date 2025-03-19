import 'package:devloper_app/data/models/recommendation.dart';
import 'package:dio/dio.dart';
import 'package:devloper_app/constants/String.dart';

import '../../presentaion/screen/token_manger.dart';

class RecommendationWebServices {
  final Dio dio;

  RecommendationWebServices()
      : dio = Dio(BaseOptions(
          baseUrl: 'https://forsatech.onrender.com/',
          receiveDataWhenStatusError: true,
          connectTimeout: Duration(seconds: 60),
          receiveTimeout: Duration(seconds: 60),
        ));

  Future<List<Recommendation>> getRecommendation() async {
    try {
      String? token = await TokenManager.getAccessToken();

      if (token == null) {
        print("Error: No access token found");
        return [];
      }

      Response response = await dio.get(
        'resume/recommendations/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("Response data: ${response.data}");
        var data = response.data;
        if (data is Map<String, dynamic> &&
            data.containsKey('recommendations')) {
          final List<dynamic> recommendations = data['recommendations'];
          return recommendations
              .map((json) =>
                  Recommendation.fromJson(json as Map<String, dynamic>))
              .toList();
        } else {
          print("Error: Key 'recommendations' not found in response.");
        }
      } else {
        print("Error: Unexpected status code ${response.statusCode}");
        print("Response data: ${response.data}");
      }
    } catch (e) {
      print("Exception occurred: $e");
    }
    return [];
  }
}
