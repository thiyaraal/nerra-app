import 'package:equatable/equatable.dart';
enum FormStatus { idle, loading, success, failure }
class RegisterState extends Equatable{
  final String username;
  final String email;
  final String password;
  final FormStatus status;
  final String? errorMessage;

  const RegisterState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.status = FormStatus.idle,
    this.errorMessage,
  });

  RegisterState copyWith({
    String? username,
    String? email,
    String? password,
    FormStatus? status,
    String? errorMessage,
  }) {
    return RegisterState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [username, email, password, status, errorMessage];
}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {
  final String userId;
  final String name;
  final String token;

  const RegisterSuccess({
    required this.userId,
    required this.name,
    required this.token,
  });

  @override
  List<Object?> get props => [userId, name, token];
}
class RegisterValidationError extends RegisterState {
  final String message;

  const RegisterValidationError(this.message);

  @override
  List<Object?> get props => [message];
}
class RegisterFailure extends RegisterState {
  final String message;

  const RegisterFailure(this.message);

  @override
  List<Object?> get props => [message];
}
class RegisterError extends RegisterState {
  final String message;

  const RegisterError(this.message);

  @override
  List<Object?> get props => [message];
}