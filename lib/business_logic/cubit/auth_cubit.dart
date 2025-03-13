import 'package:bloc/bloc.dart';
import 'package:devloper_app/data/repository/auth.dart';
import 'package:meta/meta.dart';
import '../../data/models/auth.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository
      authRepository; // اول ماتعملي اوبجكت من كلاس مو ابستراكت لازم

  AuthCubit(this.authRepository)
      : super(AuthInitial()); // عند this حطيتي الكونستراكتر

  // List<>
  // لتسجيل حساب
  Future<void> signUp(AuthModel authModel,
      {required String email,
      required String username,
      required String password}) async {
    emit(AuthLoading());
    try {
      final response = await authRepository.signUp(authModel);
      emit(AuthSuccess(response));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // هي منشان login
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final response = await authRepository.login(email, password);
      emit(AuthSuccess(response));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
