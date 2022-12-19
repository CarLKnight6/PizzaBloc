part of 'pizza_bloc.dart';

abstract class PizzaState extends Equatable {
  const PizzaState();

  @override
  List<Object> get props => [];
}

//iniitilized the state of the bloc
class PizzaInitial extends PizzaState {}

//load the state of the bloc
class PizzaLoaded extends PizzaState {
  final List<Pizza> pizzas;

  const PizzaLoaded({required this.pizzas});

  @override
  List<Object> get props => [pizzas];
}
