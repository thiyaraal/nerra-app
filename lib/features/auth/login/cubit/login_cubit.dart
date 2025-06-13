import 'package:bloc/bloc.dart';
import 'package:narra_apps/core/utils/shared_prefrences.dart';
import 'package:narra_apps/features/auth/login/services/login_service.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void emailChanged(String email) {
    emit(
      state.copyWith(email: email, status: FormStatus.idle, errorMessage: null),
    );
  }

  void passwordChanged(String password) {
    emit(
      state.copyWith(
        password: password,
        status: FormStatus.idle,
        errorMessage: null,
      ),
    );
  }

  Future<void> submit() async {
    if (state.email.trim().isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          errorMessage: 'Email tidak boleh kosong',
        ),
      );
      return;
    }
    if (state.password.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          errorMessage: 'Password tidak boleh kosong',
        ),
      );
      return;
    }

    emit(state.copyWith(status: FormStatus.loading, errorMessage: null));
    try {
    
      final result = await LoginService.login(
        username: state.email.trim(),
        password: state.password,
      );
      final token = result['token'] as String;

      await SharedPrefsHelper.setToken(token);
      print('Token disimpan: $token');

      await SharedPrefsHelper.setLoggedIn(true);

      emit(state.copyWith(status: FormStatus.success));
      print('Login berhasil: $token');
    } catch (e) {
      final msg = e is String ? e : 'Terjadi kesalahan tak terduga.';
      emit(state.copyWith(status: FormStatus.failure, errorMessage: msg));
    }
  }
}
