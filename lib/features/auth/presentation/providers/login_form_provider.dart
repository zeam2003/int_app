import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:int_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:int_app/features/shared/shared.dart';

//! 3 - StateNotifierProvider - consume afuera
final loginFormProvider = StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  final loginUserCallback = ref.watch(authProvider.notifier).loginUser;
  return LoginFormNotifier(
    loginUserCallback: loginUserCallback
  );
});



//! 2 - Como implementamos un notifier
class LoginFormNotifier extends StateNotifier<LoginFormState> {

  final Function(String, String) loginUserCallback;
  LoginFormNotifier({
    required this.loginUserCallback,
  }): super(LoginFormState());

/*   onEmailChange( String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([newEmail, state.password, state.user])
    );
  } */

  onPasswordChange( String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([newPassword, state.username])
    );
  }

  onUsernameChange( String value ) {
    final newUsername = Username.dirty(value);
    state = state.copyWith(
      username: newUsername,
      isValid: Formz.validate([newUsername, state.password])
    );
  }
 
  onFormSubmit() async {
    _touchedEveryField();
    if(!state.isValid) return;
    state = state.copyWith(isPosting: true);
    //print(state.isPosting);
    //print(state);
    if(state.isFormPosted == true ) {
      print('Esta en true');
    }
    await loginUserCallback(state.username.value, state.password.value);
    state = state.copyWith(isPosting: false);
  }

  _touchedEveryField() {
    //final email    = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final username     = Username.dirty(state.username.value);

    state = state.copyWith(
      isFormPosted: true,
      //email: email,
      username: username,
      password: password,
      isValid: Formz.validate([username, password])
    );
  }
  
}


//! 1 - State de este provider

class LoginFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Username username;
  // final Email email;
  final Password password;

  LoginFormState({
    this.isPosting = false, 
    this.isFormPosted = false, 
    this.isValid = false, 
    //this.email = const Email.pure(), 
    this.username = const Username.pure(),
    this.password = const Password.pure()
  });

  LoginFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    //Email? email,
    Username? username,
    Password? password
  }) => LoginFormState(
    isPosting: isPosting ?? this.isPosting,
    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
    username: username ?? this.username,
   //email: email ?? this.email,
    password: password ?? this.password
  );


  @override
  String toString() {
    return '''
    LoginFormState:
      isPosting: $isPosting
      isFormPosted: $isFormPosted
      isValid: $isValid
      username: $username
      password: $password
  ''';
  }
  
}
