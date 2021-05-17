import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:mobile_project/models/password_model.dart';
import 'package:mobile_project/models/username_model.dart';
import 'package:mobile_project/service/auth_service.dart';

part 'authen_event.dart';
part 'authen_state.dart';

class AuthenBloc extends Bloc<AuthenEvent, AuthenState> {
  AuthenBloc() : super(AuthenState());

  @override
  Stream<AuthenState> mapEventToState(
    AuthenEvent event,
  ) async* {
    if (event is LoginUsernameChanged) {
      yield _mapUsernameChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    }
  }

  AuthenState _mapUsernameChangedToState(
    LoginUsernameChanged event,
    AuthenState state,
  ) {
    final username = Username_model.dirty(event.username);
    return state.copyWith(
      username: username,
      status: Formz.validate([state.password, username]),
    );
  }

  AuthenState _mapPasswordChangedToState(
    LoginPasswordChanged event,
    AuthenState state,
  ) {
    final password = Password_model.dirty(event.password);
    return state.copyWith(
      password: password,
      status: Formz.validate([password, state.username]),
    );
  }

  Stream<AuthenState> _mapLoginSubmittedToState(
    LoginSubmitted event,
    AuthenState state,
  ) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        // await _authenticationRepository.logIn(
        //   username: state.username.value,
        //   password: state.password.value,
        // );
        //  await AuthService().signin(state.username.value, state.password.value);
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      } on Exception catch (_) {
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
