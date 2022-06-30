part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SingInvalidState extends SignInState {}

class SingInErrorState extends SignInState {
  final String errorMessag;
  SingInErrorState(this.errorMessag);
}

class SignInLoadingState extends SignInState {}
