class AuthModel {
  final String email;
  final String password;
  final String? username;
  final String? confirmPassword;

  AuthModel({
    required this.email,
    required this.password,
    this.username,
    this.confirmPassword,
  });


  // هي تأكيدي منها مابعرف اذا صح من ارسال الى السيرفر لازم تعمل جيسون
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "username": username,
      "confirmPassword": confirmPassword,
    };
  }
 //                        هي الباك عم يرجعلك وكمان انت بدك تحويلي لجيسون
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json["email"],
      password: json["password"],
      username: json["username"],
      confirmPassword: json["confirmPassword"],
    );
  }
}
