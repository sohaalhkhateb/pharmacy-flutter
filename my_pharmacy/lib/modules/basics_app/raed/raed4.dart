import 'package:flutter/material.dart';

class Raed4 extends StatefulWidget {
  const Raed4({super.key});

  @override
  State<Raed4> createState() => _Raed4State();
}
int count_num = 0;
class _Raed4State extends State<Raed4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Counter',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),),),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          "${count_num}",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              setState((){
                count_num++;
              });
              print(count_num);
            },
            child: Icon(Icons.add),),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                count_num--;
              });
              print(count_num);
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                count_num = 0;
              });
              print(count_num);
            },
            child:Icon(Icons.lock_reset),
          ),
        ],
      ),
    );;
  }
}

