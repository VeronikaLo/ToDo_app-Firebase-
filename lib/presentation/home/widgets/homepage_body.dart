import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/observer/observer_bloc.dart';


class HomepageBody extends StatelessWidget {
  const HomepageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocBuilder<ObserverBloc, ObserverState>(
      builder: (context, state) {
        if(state is ObserverInitial){
          return Container();

        } else if(state is ObserverLoading){
          return Center(child: CircularProgressIndicator(color: themeData.colorScheme.tertiary) ,);

        } else if(state is ObserverFailure){
          return const Center(child: Text('FAILURE'),);

        } else if(state is ObserverSuccess){
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index){
              final todo = state.todos[index];
              return Container(
                margin: const EdgeInsets.all(4),
                color: Colors.green,
                height: 50,
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
