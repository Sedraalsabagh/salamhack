import 'package:devloper_app/data/models/auth.dart';
import 'package:dio/dio.dart';
import '../../constants/String.dart';

class AuthWebServices {
  late Dio dio;

  AuthWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true, // بالفيديو حطها منشان تصليح الاغلاط
      connectTimeout: Duration(seconds: 60), // وقت الاتصال
      receiveTimeout: Duration(seconds: 60), // وقت الاستجابة
    );
    dio = Dio(options);
  }

  // الفانكشن الاول من شان تسجيل حساب
  Future<Map<String, dynamic>> signUp(AuthModel authModel) async {
    try {
      Response response = await dio.post("signUp/",
          data: authModel.toJson(),
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
          ));

      return response.data;
    } catch (e) {
      print(" $e");
      throw Exception("error");
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      Response response = await dio.post(
        "/login",
        data: {
          "email": email,
          "password": password,
        },
      );

      return response.data;
    } catch (e) {
      print(" $e");
      throw Exception("error");
    }
  }
}
