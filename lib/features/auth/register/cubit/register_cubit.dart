import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:narra_apps/features/auth/register/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  void usernameChanged(String username) {
    emit(
      state.copyWith(
        username: username,
        status: FormStatus.idle,
        errorMessage: 'Username tidak boleh kosong',
      ),
    );
  }

  void emailChanged(String email) {
    emit(
      state.copyWith(email: email, status: FormStatus.idle, errorMessage: 'Email tidak boleh kosong'),
    );
  }

  void passwordChanged(String password) {
    emit(
      state.copyWith(
        password: password,
        status: FormStatus.idle,
        errorMessage: 'Password tidak boleh kosong',
      ),
    );
  }

  Future<void> submit() async {
    if (state.username.trim().isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          errorMessage: 'Username tidak boleh kosong',
        ),
      );
      return;
    }
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
      await Future.delayed(const Duration(seconds: 2));
      print('Registering user: ${state.username}, ${state.email}, ${state.password}');

      emit(state.copyWith(status: FormStatus.success));
      print('Registration successful');
    } catch (e) {
      print('Registration failed: $e');
      final msg = e is String ? e : 'Terjadi kesalahan tak terduga.';
      emit(state.copyWith(status: FormStatus.failure, errorMessage: msg));
    }
  }
}
