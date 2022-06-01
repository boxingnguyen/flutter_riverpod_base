import 'package:form_field_validator/form_field_validator.dart';

class Validate {
  static final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
    // PatternValidator(r'(?=.*?[#?!@$%^&*-])',
    //     errorText: 'Passwords must have at least one special character')
  ]);

  static final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Enter a valid email address')
  ]);

  static FieldValidator<String?> repeatPasswordValidator(String input) {
    return MultiValidator(
        [MatchTextValidator(input, errorText: 're-enter wrong password')]);
  }
}

class MatchTextValidator extends TextFieldValidator {
  final String input;

  MatchTextValidator(this.input, {required String errorText})
      : super(errorText);

  @override
  bool isValid(String? value) {
    return input == value;
  }
}
