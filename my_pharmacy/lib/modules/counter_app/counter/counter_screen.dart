import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

// state less contain one class provide widget

// state ful contain classes

// 1. first class provide widget
// 2. second class provide state from this widget

class CounterScreen extends StatelessWidget {

  //1. constructor
  //2. init state
  //3. build

  @override
  Widget build(BuildContext context)
  {

    return BlocProvider<CounterCubit>(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
         listener: (BuildContext context, CounterStates state) {
           if(state is CounterMinusState) {
             //print('minus state ${state.counter}');
           }
           if(state is CounterPlusState) {
             //print('plus state ${state.counter}');
           }
         },
        builder:  (BuildContext context, CounterStates state)
        {
           return Scaffold(
             appBar: AppBar(
               backgroundColor: Colors.blue,
               title: Text(
                 'Counter',
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
             ),
             body: Center(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   TextButton(
                       onPressed: ()
                       {
                         CounterCubit.get(context).minus();
                       },
                       child: Text(
                         'MINUS',
                       ),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(
                       horizontal: 20.0,
                     ),
                     child: Text(
                       '${CounterCubit.get(context).counter}',
                       style: TextStyle(
                         fontSize: 50.0,
                         fontWeight: FontWeight.w900,
                       ),
                     ),
                   ),
                   TextButton(
                       onPressed: ()
                       {
                         CounterCubit.get(context).plus();
                       },
                       child: Text(
                         'PLUS',
                       ),
                   ),
                 ],
               ),
             ),
           );
        },
      ),
    );
  }
}
