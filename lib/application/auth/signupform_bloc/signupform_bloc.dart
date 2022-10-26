import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signupform_event.dart';
part 'signupform_state.dart';

class SignupformBloc extends Bloc<SignupformEvent, SignupformState> {
  SignupformBloc() : super(SignupformState(isSubmitting: false, showValidationMessages: false)) {

    on<SignUpWithEmailAndPasswordPressed>((event, emit) {
      
      if(event.password == null || event.email == null){
        emit(state.copyWith(isSubmitting: false, showValidationMessages: true)); // or if without copyWith:  emit(SignupformState(isSubmitting: false, showValidationMessages: true));

      }else{
        emit(state.copyWith(isSubmitting: true, showValidationMessages: false)); // emit(SignupformState(isSubmitting: true, showValidationMessages: false));
        // TODO: trigger auth
      }


    });

    

    on<RegisterWithEmailAndPasswordPressed>((event, emit) {
      
      if(event.password == null || event.email == null){
        emit(state.copyWith(isSubmitting: false, showValidationMessages: true)); // emit(SignupformState(isSubmitting: false, showValidationMessages: true));

      }else{
        emit(state.copyWith(isSubmitting: true, showValidationMessages: false)); //emit(SignupformState(isSubmitting: true, showValidationMessages: false));
        // TODO: trigger auth
      }


    });
  }
}
