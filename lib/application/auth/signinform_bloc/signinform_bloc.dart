import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signinform_event.dart';
part 'signinform_state.dart';

class SigninformBloc extends Bloc<SigninformEvent, SigninformState> {
  SigninformBloc() : super(SigninformState(isSignIn: false, showValidationMessages: false)) {

    on<SignInWithEmailAndPasswordPressed>((event, emit) {
      // TODO: implement event handler
    });

    
    on<RegisterWithEmailAndPasswordPressed>((event, emit) {
      // TODO: implement event handler
    });
  }
}
