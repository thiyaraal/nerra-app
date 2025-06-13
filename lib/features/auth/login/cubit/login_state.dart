import 'package:equatable/equatable.dart';

enum FormStatus { idle, loading, success, failure }

class LoginState extends Equatable {
  final String email;
  final String password;
  final FormStatus status;
  final String? errorMessage;

  const LoginState({
    this.email = '',
    this.password = '',
    this.status = FormStatus.idle,
    this.errorMessage,
  });

  LoginState copyWith({
    String? email,
    String? password,
    FormStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password, status, errorMessage];
}
class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;
  const LoginSuccess(this.token);

  @override
  List<Object?> get props => [token];
}

class LoginValidationError extends LoginState {
  final String message;
  const LoginValidationError(this.message);

  @override
  List<Object?> get props => [message];
}

class LoginFailure extends LoginState {
  final String message;
  const LoginFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class LoginError extends LoginState {
  final String error;
  const LoginError(this.error);

  @override
  List<Object?> get props => [error];
}
