part of 'authen_bloc.dart';

class AuthenState extends Equatable {
  const AuthenState({
    this.status = FormzStatus.pure,
    this.username = const Username_model.pure(),
    this.password = const Password_model.pure(),
  });

  final FormzStatus status;
  final Username_model username;
  final Password_model password;

  AuthenState copyWith({
    FormzStatus status,
    Username_model username,
    Password_model password,
  }) {
    return AuthenState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}
