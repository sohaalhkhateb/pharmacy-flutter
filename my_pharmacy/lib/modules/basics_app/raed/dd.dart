import 'package:flutter/material.dart';
class MainPage extends StatelessWidget{
  MainPage({super.key});
  final List<String> courses = <String>['Dart','Java','Python','C++'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Exercise'),centerTitle: courses[0]=='Dart',),
      body:courses.length==4?
      Container(color: Colors.green,width: 200,height: 250,
        ):
          IconButton(iconSize: 150, onPressed:(){},icon:const Icon(Icons.message))

    );
  }
}