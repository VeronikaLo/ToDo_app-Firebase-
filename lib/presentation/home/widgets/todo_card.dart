import 'package:flutter/material.dart';
import '../../../domain/entities/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Card(
      elevation: 16,
      color: todo.color.color,
      child: ListTile(
        leading: Checkbox(
          value: todo.done,
          onChanged: (_){}, ) ,
        title:  Text(
          todo.title,
          style: themeData.textTheme.headline1!.copyWith(fontSize: 18, fontWeight: FontWeight.bold), 
        ),
      ),
    );
  }
}