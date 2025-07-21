import 'package:flutter/material.dart';
import 'dart:math';
class Raed3 extends StatelessWidget {
  Raed3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.sunny,color: Colors.red,size: 45,
    ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: [
          IconButton(onPressed: (){},
              tooltip: 'soha',
              icon: const Icon(Icons.tv, color: Colors.white,
              )
          ),

        ],
    ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        height: 450,
        width: 400,
        child: Icon(Icons.accessible),
        decoration: BoxDecoration(
          gradient: const RadialGradient(colors: [Colors.green, Colors.red, Colors.yellow],

          ),
          borderRadius: BorderRadius.horizontal(right: Radius.circular(27),),
        ),

      ),
    );
  }
}
