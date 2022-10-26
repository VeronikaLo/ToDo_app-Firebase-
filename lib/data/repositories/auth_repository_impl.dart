import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/core/failures/auth_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{

  final FirebaseAuth firebaseAuth;
  AuthRepositoryImpl({required this.firebaseAuth});

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({required String email, required String password}) {
    // TODO: implement registerWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({required String email, required String password}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }
}