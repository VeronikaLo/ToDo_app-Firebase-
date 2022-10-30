import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../core/failures/todo_failures.dart';
import '../../domain/entities/todo.dart';

part 'observer_event.dart';
part 'observer_state.dart';

class ObserverBloc extends Bloc<ObserverEvent, ObserverState> {
  ObserverBloc() : super(ObserverInitial()) {
    on<ObserverEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
