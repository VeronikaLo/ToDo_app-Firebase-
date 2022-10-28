import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/data/repositories/auth_repository_impl.dart';
import 'package:todo_app/domain/repositories/auth_repository.dart';

import 'application/auth/auth_bloc/auth_bloc.dart';
import 'application/auth/signupform_bloc/signupform_bloc.dart';


final sl = GetIt.I;  // sl = service locator

Future<void> init()async{
  
  // state management
  sl.registerFactory(() => SignupformBloc(authRepository: sl()));
   sl.registerFactory(() => AuthBloc(authRepository: sl()));

  // repo
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(firebaseAuth: sl()));

  // extern
  final firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);


}