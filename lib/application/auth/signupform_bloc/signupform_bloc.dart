import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signupform_event.dart';
part 'signupform_state.dart';

class SignupformBloc extends Bloc<SignupformEvent, SignupformState> {
  SignupformBloc() : super(SignupformState(isSubmitting: false, showValidationMessages: false)) {

    on<SignUpWithEmailAndPasswordPressed>((event, emit) {
      // TODO: implement event handler
    });

    
    on<RegisterWithEmailAndPasswordPressed>((event, emit) {
      // TODO: implement event handler
    });
  }
}
