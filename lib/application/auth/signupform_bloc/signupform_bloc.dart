import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/core/failures/auth_failures.dart';
import 'package:todo_app/domain/repositories/auth_repository.dart';

part 'signupform_event.dart';
part 'signupform_state.dart';

class SignupformBloc extends Bloc<SignupformEvent, SignupformState> {
  final AuthRepository authRepository;

  SignupformBloc({required this.authRepository}) : super(SignupformState(
    isSubmitting: false, 
    showValidationMessages: false, 
    authFailureOrSuccessOption: none(),
    )) {

    on<SignUpWithEmailAndPasswordPressed>((event, emit) async{
      
      if(event.password == null || event.email == null){
        emit(state.copyWith(isSubmitting: false, showValidationMessages: true)); // or if without copyWith:  emit(SignupformState(isSubmitting: false, showValidationMessages: true));

      }else{
        emit(state.copyWith(isSubmitting: true, showValidationMessages: false)); // emit(SignupformState(isSubmitting: true, showValidationMessages: false));
        final failureOrSuccess = await authRepository.signInWithEmailAndPassword(email: event.email!, password: event.password!);
        emit(state.copyWith(isSubmitting: false, authFailureOrSuccessOption: optionOf(failureOrSuccess)));
      }


    });

    

    on<RegisterWithEmailAndPasswordPressed>((event, emit) async{
      
      if(event.password == null || event.email == null){
        emit(state.copyWith(isSubmitting: false, showValidationMessages: true)); // emit(SignupformState(isSubmitting: false, showValidationMessages: true));

      }else{
        emit(state.copyWith(isSubmitting: true, showValidationMessages: false)); //emit(SignupformState(isSubmitting: true, showValidationMessages: false));
        final failureOrSuccess = await authRepository.registerWithEmailAndPassword(email: event.email!, password: event.password!);
        emit(state.copyWith(isSubmitting: false, authFailureOrSuccessOption: optionOf(failureOrSuccess)));
      }


    });
  }
}
