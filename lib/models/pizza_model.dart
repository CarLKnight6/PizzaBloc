import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

//extend the model to the equatable
class Pizza extends Equatable {
  //create required constructors
  final String id;
  final String name;
  final Image image;

  const Pizza({required this.id, required this.name, required this.image});

//pass the properties from the constructors the the equatable override is required
  @override
  List<Object?> get props => [id, name, image];

//created a static data
  static List<Pizza> pizzas = [
    Pizza(id: '0', name: 'Pizza', image: Image.asset('images/pizza.jpg')),
    Pizza(
        id: '1',
        name: 'Pizza Pepperoni',
        image: Image.asset('images/pizzapepperoni.jpg'))
  ];
}
