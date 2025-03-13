part of 'auth_cubit.dart';

@immutable
sealed class AuthState {} // هاد ابستراكت كلاس لام اول الشي تعمل يوراثة

final class AuthInitial extends AuthState {}


class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final Map<String, dynamic> response;
  AuthSuccess(this.response);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}
