import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/observer/observer_bloc.dart';
import 'package:todo_app/presentation/home/widgets/homepage_body.dart';
import 'package:todo_app/presentation/routes/router.gr.dart';
import 'package:todo_app/presentation/signup/signup_page.dart';

import '../../application/auth/auth_bloc/auth_bloc.dart';
import '../../injection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final observerBloc = sl<ObserverBloc>() ..add(ObserveAllEvent());
    return MultiBlocProvider(
      providers: [
        BlocProvider<ObserverBloc>(create: (context) => observerBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: (context, state) {
            if(state is AuthStateUnauthenticated){
              AutoRouter.of(context).push(const SignUpPageRoute());
            }
          })
        ], 
        child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed:() {
              BlocProvider.of<AuthBloc>(context).add(SignOutPressedEvent());
            } ,
            icon: const Icon(Icons.exit_to_app),),
          title: const Text('ToDo'),),
        body: const HomepageBody(),
      )),
    );
  }
}