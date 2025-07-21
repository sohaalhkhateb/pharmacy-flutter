import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Raed extends StatelessWidget {
  const Raed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Hiii!!!",
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          wordSpacing: 3.0,
        )),
        leading:const Icon(
            Icons.arrow_back_ios_new,
          size: 25.0,
          color: Colors.black,
        ),
        actions: [
          IconButton(onPressed: (){
            print('hi iconButton');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'should write a message',
                  style: TextStyle(
                    color: Colors.white,),
                ),
                backgroundColor: Colors.black,
                duration:
                Duration(seconds: 2),
                showCloseIcon: true,
                closeIconColor: Colors.red,
              ),
            );
          },
              icon: Icon(Icons.search,
            color: Colors.amber,
             size: 35.0,
              ),
            tooltip: "this is action",
          ),
        ],
      ),

      body:
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            //color: Colors.blueGrey,
           height: 300,
           width: 200,
            //alignment: Alignment.center,
            margin: EdgeInsets.all(25.0),
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.teal,
              image: const DecorationImage(
                  image: AssetImage('assets/images/Male_35764.png'),
              fit: BoxFit.cover,),
            border: Border.all(
              color: Colors.red,
              width: 4.0,
            ),
              borderRadius: BorderRadius.all(Radius.circular(25)),
              boxShadow: const[
                BoxShadow(
                  color: Colors.purple,
                  offset: Offset(22.0,22.0),
                  blurRadius: 16.0,
                ),
    ],
              gradient: LinearGradient(colors: [
                Colors.red,Colors.green,Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,),
            ),

            child: Column(
              children: [
                const Text(
                  'Look!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.error,
                    size: 50.0,
                    color: Colors.red,),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  iconSize: 50,
                  hoverColor: Colors.greenAccent,
                  highlightColor: Colors.teal,
                  shadowColor: Colors.black,

                ),),
                SizedBox(
                  height: 10.0,
                ),
                IconButton.filled(
                  padding: EdgeInsets.all(30),
                    iconSize: 0.3,
                    style: IconButton.styleFrom(
                      side: BorderSide(
                        width: 4.0,
                        color: Colors.redAccent,
                      ),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.pink,
                      hoverColor: Colors.deepOrange,
                      highlightColor: Colors.greenAccent,
                      elevation: 40.0,
                      shadowColor: Colors.red,
                    ),
                    onPressed: (){},
                    icon: Icon(Icons.lock,
                    size: 30.0,),)
              ],
            ),
              ),

        ],
      ),


      floatingActionButton: FloatingActionButton(
          onPressed: (){
            print('hello soha');
          }),

    );
  }
}

