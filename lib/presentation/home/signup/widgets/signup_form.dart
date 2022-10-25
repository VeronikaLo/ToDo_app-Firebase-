import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);
    return Form(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 80,),
          Text('Welcome', 
          textAlign: TextAlign.center,
          style: themeData.textTheme.headline1!.copyWith(
            fontSize: 50,
            fontWeight: FontWeight.w500,
            letterSpacing: 4,
          )),
          const SizedBox(height: 20,),
          Text('Please register or sign in', 
          textAlign: TextAlign.center,
          style: themeData.textTheme.headline1!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 4,
          )),
          const SizedBox(height: 80,),
          TextFormField(
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              labelText: 'E-mail',
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            cursorColor: Colors.white,
            obscureText: true, // hides input
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          )
        ], ),);
  }
}