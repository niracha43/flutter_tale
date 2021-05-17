import 'package:formz/formz.dart';

enum PasswordValidationError { empty }

class Password_model extends FormzInput<String, PasswordValidationError> {
  const Password_model.pure() : super.pure('');
  const Password_model.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError validator(String value) {
    return value.isNotEmpty == true ? null : PasswordValidationError.empty;
  }
}
