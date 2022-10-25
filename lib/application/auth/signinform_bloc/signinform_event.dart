part of 'signinform_bloc.dart';

@immutable
abstract class SigninformEvent {}

// we have 2 events: sign in and registration

class SignInWithEmailAndPasswordPressed extends SigninformEvent{
  final String email;
  final String password;

  SignInWithEmailAndPasswordPressed({required this.email, required this.password});
}


class RegisterWithEmailAndPasswordPressed extends SigninformEvent{
  final String email;
  final String password;

  RegisterWithEmailAndPasswordPressed({required this.email, required this.password});
}
