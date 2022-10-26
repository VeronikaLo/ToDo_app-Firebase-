part of 'signupform_bloc.dart';

class SignupformState{
  final bool isSubmitting;
  final bool showValidationMessages;

  SignupformState({required this.isSubmitting, required this.showValidationMessages});

  // If we have a lot of params, it's easer to use  .copyWith()
  SignupformState copyWith({
  bool? isSubmitting,
  bool? showValidationMessages,
  }) {
    return SignupformState(
      isSubmitting: isSubmitting ?? this.isSubmitting, 
      showValidationMessages: showValidationMessages ?? this.showValidationMessages );
  }

  
}




