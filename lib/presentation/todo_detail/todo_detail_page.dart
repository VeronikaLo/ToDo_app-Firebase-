import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/todo/todoform/todoform_bloc.dart';
import '../../core/failures/todo_failures.dart';
import '../../domain/entities/todo.dart';
import '../../injection.dart';
import '../routes/router.gr.dart';

class TodoDetail extends StatelessWidget {
  final Todo? todo;
  const TodoDetail({super.key, required this.todo});

  String _mapFailureToMessage(TodoFailure todoFailure) {
    switch (todoFailure.runtimeType) {
      case InsufficientPermissions:
        return "You have not the permissions to do that";
      case UnexpectedFailure:
        return "Something went wrong";

      default:
        return "Something went wrong";
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocProvider(
      create: (context) =>
          sl<TodoformBloc>()..add(InitializeTodoDetailPage(todo: todo)),
      child: BlocListener<TodoformBloc, TodoformState>(
        listenWhen: (p, c) => p.failureOrSuccessOption != c.failureOrSuccessOption , //liste only when we get changesn in failureOrSuccessOption 
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () => (){}, 
            (eitherFailureOrSuccess) => eitherFailureOrSuccess.fold(
              (failure) => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(_mapFailureToMessage(failure)),
                          backgroundColor: Colors.redAccent)), 
              (unit) => Navigator.of(context).popUntil(  // popUntil -> remove all pages untill ..Homepage
                      (route) => route.settings.name == HomePageRoute.name)));
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(todo == null ? 'Create  ToDo' : 'Edit  ToDo'),
            centerTitle: true,
          ),
          body: const Placeholder(),
        ),
      ),
    );
  }
}
