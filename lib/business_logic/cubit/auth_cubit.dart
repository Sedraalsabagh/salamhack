import 'package:bloc/bloc.dart';
import 'package:devloper_app/business_logic/cubit/auth_state.dart';
import 'package:devloper_app/data/repository/auth.dart';
import '../../data/models/auth.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final request = LoginRequest(email: email, password: password);
      final response = await authRepository.login(request);
      emit(AuthSuccess(response));
    } catch (e) {
      emit(AuthFailure(e.toString())); // إعادة الرسالة المُفصّلة للخطأ
      print("Login failed: $e"); // طباعة الخطأ
    }
  }
}
