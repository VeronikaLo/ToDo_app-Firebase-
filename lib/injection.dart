import 'package:get_it/get_it.dart';

import 'application/auth/signupform_bloc/signupform_bloc.dart';


final sl = GetIt.I;  // sl = service locator

Future<void> init()async{
  
  // state management
  sl.registerFactory(() => SignupformBloc());
}