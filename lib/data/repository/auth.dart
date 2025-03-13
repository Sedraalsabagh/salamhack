// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:devloper_app/data/models/auth.dart';
import 'package:devloper_app/data/webService/auth.dart';

class AuthRepository {
  late final AuthWebServices authWebServices;

  AuthRepository({required this.authWebServices});

  Future<Map<String, dynamic>> signUp(AuthModel authModel) async {
    try {
      final response = await authWebServices.signUp(authModel);
      return response;
    } catch (e) {
      throw Exception("$e");
    }
  }

  //
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await authWebServices.login(email, password);
      return response;
    } catch (e) {
      throw Exception("$e");
    }
  }
}
