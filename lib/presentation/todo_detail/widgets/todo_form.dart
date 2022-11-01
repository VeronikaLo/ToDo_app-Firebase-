import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/todo_detail/widgets/color_field.dart';

import '../../../application/todo/todoform/todoform_bloc.dart';

class TodoForm extends StatelessWidget {
  const TodoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    final textControllerTitle = TextEditingController();
    final textControllerBody = TextEditingController();

    late String body;
    late String title;

    String? validateBody(String? input) {
      if (input == null || input.isEmpty) {
        return "Please enter a description";
      } else if (input.length < 300) {
        body = input;
        return null;
      } else {
        return "Body text is too long";
      }
    }

    String? validateTitle(String? input) {
      if (input == null || input.isEmpty) {
        return "Please enter a title";
      } else if (input.length < 40) {
        title = input;
        return null;
      } else {
        return "Title is too long";
      }
    }


    return BlocConsumer<TodoformBloc, TodoformState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        textControllerTitle.text = state.todo.title;
        textControllerBody.text = state.todo.body;
      },
      builder: (context, state) {
        return  Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: formkey,
            autovalidateMode: state.showErrorMessages? AutovalidateMode.always : AutovalidateMode.disabled,
            child: ListView(
              children: [
                TextFormField(
                  validator: validateTitle,
                  controller: textControllerTitle,
                  cursorColor: Colors.white,
                  maxLength: 100,
                  maxLines: 2,
                  minLines: 1,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    counterText: '',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  validator: validateBody,
                  controller: textControllerBody,
                  cursorColor: Colors.white,
                  maxLength: 300,
                  maxLines: 8,
                  minLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Body',
                    counterText: '',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                  ),
                ),
                const SizedBox(height: 30,),
                ColorField(color: state.todo.color),

              ],)) ,
        );
      },
    );
  }
}
