import 'package:flutter/material.dart';

import '../../domain/entities/todo.dart';

class TodoDetail extends StatelessWidget {
  final Todo? todo;
  const TodoDetail({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  Text(todo == null
        ? 'Create todo'
        : 'Edit todo'), 
        centerTitle: true,
      ),
      body: const Placeholder(),
    );
  }
}