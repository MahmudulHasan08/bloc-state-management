import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInTextFieldChangeEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        return emit(SingInErrorState("enter valid email"));
      } else if (event.passvalue.length < 8) {
        return emit(SingInErrorState("Please Enter valid password"));
      } else {
        emit(SingInvalidState());
      }
    });
    on<SignInButtonEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
