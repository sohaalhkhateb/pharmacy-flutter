import 'package:flutter/material.dart';
class Full extends StatefulWidget {
  const Full({super.key});
  @override
  State<Full> createState() => _FullState();
}

class _FullState extends State<Full> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  TextEditingController text1 = TextEditingController();
  int result = 0;
  String? text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('example of Textfield',
          style: TextStyle(
            color: Colors.white,
          ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: number1Controller,
              keyboardType: TextInputType.number,
              maxLines: 3,
              minLines: 2,
              maxLength: 10,
              decoration: InputDecoration(
                hintText: "Enter first number",
                hintStyle: const TextStyle(color: Colors.red,),
                suffixIcon: Icon(Icons.accessible_forward),
                labelText: 'abdoulrazak',
                filled: true,
                fillColor: Colors.lime.shade100,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 4.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0,),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: number2Controller,
              keyboardType: TextInputType.number,
              maxLines: 2,

              maxLength:10,
              decoration: InputDecoration(
                hintText: 'Enter second number',
                hintStyle: TextStyle(
                  color: Colors.brown,
                ),
                suffixIcon: Icon(Icons.lock),
                labelText: 'Start',
                labelStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                filled: true,
                fillColor: Colors.grey,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.lightBlue,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 4.0,
                    color: Colors.orangeAccent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0),),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            TextField(
              controller: text1,
              keyboardType: TextInputType.text,
              minLines: 1,
              maxLines: 2,
              maxLength: 20,
              decoration: InputDecoration(
                hintText: "enter your name:",
                hintStyle: TextStyle(
                  color: Colors.brown,
                ),
                filled: true,
                fillColor: Colors.greenAccent,
                labelText: 'soha',
                suffixIcon: Icon(Icons.account_circle_outlined),
                prefixIcon: Icon(Icons.abc),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 4.0,
                    color: Colors.indigo,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.deepOrangeAccent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
              ),


            ),
            IconButton.filled(onPressed: (){
              setState((){
                result = int.parse(number1Controller.text) + int.parse(number2Controller.text);
              });
              print(result);
            }, icon: Icon(Icons.add,),),
            SizedBox(
              height: 25.0,
            ),
            Text('$result'),
          ],
        ),),
    );
  }
}









