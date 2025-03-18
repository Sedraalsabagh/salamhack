class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class LoginResponse {
  final String accessToken;
  final String refreshToken;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    // تحقق من وجود القيم قبل استخدامها
    if (json['access'] == null || json['refresh'] == null) {
      throw Exception('Invalid response data');
    }
    return LoginResponse(
      accessToken: json['access'] ?? '', // إذا كانت null يتم استخدام قيمة فارغة
      refreshToken:
          json['refresh'] ?? '', // إذا كانت null يتم استخدام قيمة فارغة
    );
  }
}
