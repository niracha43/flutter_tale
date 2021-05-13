import 'package:formz/formz.dart';

enum UsernameValidationError { empty }

class Username_model extends FormzInput<String, UsernameValidationError> {
  const Username_model.pure() : super.pure('');
  const Username_model.dirty([String value = '']) : super.dirty(value);

  @override
  UsernameValidationError? validator(String value) {
    return value.isNotEmpty == true ? null : UsernameValidationError.empty;
  }
}
