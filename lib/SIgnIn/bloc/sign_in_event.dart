part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInTextFieldChangeEvent extends SignInEvent {
  final String emailValue;
  final String passvalue;
  SignInTextFieldChangeEvent(this.emailValue, this.passvalue);
}

class SignInButtonEvent extends SignInEvent {
  final String email;
  final String password;
  SignInButtonEvent(this.email, this.password);
}
