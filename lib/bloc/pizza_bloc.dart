import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/pizza_model.dart';

part 'pizza_event.dart';
part 'pizza_state.dart';

//automatically created using bloc extension
class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc() : super(PizzaInitial()) {
    //first event created
    on<LoadPizzaCounter>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const PizzaLoaded(pizzas: <Pizza>[]));
    });

    //second event created
    on<AddPizza>((event, emit) {
      if (state is PizzaLoaded) {
        final state = this.state as PizzaLoaded;
        emit(PizzaLoaded(pizzas: List.from(state.pizzas)..add(event.pizza)));
      }
    });

    //third event created
    on<RemovePizza>((event, emit) {
      //condition
      if (state is PizzaLoaded) {
        //updating the state of the bloc
        final state = this.state as PizzaLoaded;

        //performing the logic via emit function
        emit(PizzaLoaded(pizzas: List.from(state.pizzas)..remove(event.pizza)));
      }
    });
  }
}
