import 'package:email_validator/email_validator.dart';

String? emailValidator(String? value) {
  const String emailNotValidMessage = 'Email not valid';
  if (value == null || !EmailValidator.validate(value)) {
    return emailNotValidMessage;
  }
}