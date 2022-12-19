part of 'pizza_bloc.dart';

//automatically created using bloc extension
abstract class PizzaEvent extends Equatable {
  const PizzaEvent();

  //passes the property to equatable to compare the state to the bloc is required , you pass what is in the constructor
  @override
  List<Object> get props => [];
}

//registered event number 1
class LoadPizzaCounter extends PizzaEvent {}

//registered event number 2
class AddPizza extends PizzaEvent {
  final Pizza pizza;
  const AddPizza(this.pizza);

  //passes the property to equatable to compare the state to the bloc is required , you pass what is in the constructor
  @override
  List<Object> get props => [pizza];
}

//registered event number 3
class RemovePizza extends PizzaEvent {
  final Pizza pizza;
  const RemovePizza(this.pizza);

  //passes the property to equatable to compare the state to the bloc is required , you pass what is in the constructor
  @override
  List<Object> get props => [pizza];
}
