import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/pizza_bloc.dart';
import 'package:flutter_bloc_test/models/pizza_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var intValue = Random().nextInt(10); // Value is >= 0 and < 10.

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('THE PIZZA BLOC'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        //create a blocbuilder with the bloc you want to read and its state
        child: BlocBuilder<PizzaBloc, PizzaState>(
          builder: (context, state) {
            //if the bloc is still initializing return a loading indicator
            if (state is PizzaInitial) {
              return const CircularProgressIndicator();
            }
            // if the state of the bloc is loaded , meaning the data is received then return the lenght of the data or whatever you need
            if (state is PizzaLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${state.pizzas.length}'),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          for (int index = 0;
                              index < state.pizzas.length;
                              index++)
                            //just randomly placing the pizza images
                            Positioned(
                                left: Random().nextInt(200).toDouble(),
                                right: Random().nextInt(400).toDouble(),
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: state.pizzas[index].image,
                                ))
                        ]),
                  ),
                ],
              );
            } else {
              //if something went wrong display this one
              return const Text('Something went wrong');
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: () {
                //this is how we update the bloc's state via click of the button , the bloc is calling the addpizza event and passing the static model 0
                context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[0]));
              },
              child: const Icon(Icons.local_pizza)),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: () {
                // the bloc is calling the removepizza event and removing the pizza model 0
                context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[0]));
              },
              child: const Icon(Icons.local_pizza)),
        ],
      ),
    );
  }
}
