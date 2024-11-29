import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameError { empty, length, format }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsernameError> {


  static final RegExp userRegExp = RegExp(
    r'^[a-zA-ZñÑ]{3,}$',
  );

  // Call super.pure to represent an unmodified form input.
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Username.dirty( super.value ) : super.dirty();


  String? get errorMessage {
    if ( isValid || isPure ) return null;

    if ( displayError == UsernameError.empty ) return 'El campo es requerido';
    if ( displayError == UsernameError.length ) return 'Mínimo 3 caracteres';
    if ( displayError == UsernameError.format ) return 'No es el formato correcto';

    return null;
  }


  // Override validator to handle validating a given input value.
  @override
  UsernameError? validator(String value) {

    if ( value.isEmpty || value.trim().isEmpty ) return UsernameError.empty;
    if ( value.length < 3 ) return UsernameError.length;
    if ( !userRegExp.hasMatch(value) ) return UsernameError.format;

    return null;
  }
}