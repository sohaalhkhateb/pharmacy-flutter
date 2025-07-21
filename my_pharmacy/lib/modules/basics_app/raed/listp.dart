import 'package:flutter/material.dart';
typedef listOfInt = List<int>;
class Listp extends StatelessWidget {
  final List<String> colorNameList = [
    'amber color',
    'blue color',
    'red color',
    'yellow color',
    'grey color',
  ];

  final List<Color> colorList = [
    Colors.amber,
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          color: Colors.red,
          child: const Text("Exercise6"),),
        centerTitle: true,
        leading: IconButton(onPressed: (){},
            icon: Icon(Icons.arrow_back,
            size: 21,),
        ),leadingWidth: 100.0,
        actions: [
          IconButton(
            color: Colors.yellow,
            onPressed: (){},
            icon: Icon(Icons.message,
            size: 30.0,),
            style: IconButton.styleFrom(
              iconSize: 30,
            ),
          ),
        ],
        ),
      body:
      Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient:   RadialGradient(
                colors: [Colors.red, Colors.green, Colors.blue],
                center: Alignment.center,
                radius: 1.0,
              ),
             // borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: const [
              BoxShadow(
              color: Colors.purple,
              offset: Offset(20,10),
              blurRadius: 5,
            ),
              ],
              border: Border.all(width: 5, color: Colors.redAccent),
              borderRadius: BorderRadius.circular(25),
            ),
            height: 300,
            width: 200,
            margin: EdgeInsets.all(50.0),
            padding: EdgeInsets.all(15.0),
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8,
              childAspectRatio: 3,mainAxisExtent: 70,),
              itemBuilder: (context, index) => Container(
                color: Colors.black,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                        side: BorderSide(width: 5, color: Colors.red)),
                    onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                         "HII , FROM item $index",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20),
                        ),
                    backgroundColor: Colors.black,
                    duration: Duration(seconds: 3),
                    showCloseIcon: true,
                    closeIconColor: Colors.red,
                    ));
                    },
                  child: Text('$index'),

              ),
              ),
              ),
          ),
          ElevatedButton(
            onPressed: (){},
            onLongPress: (){
              print('hello');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              elevation: 20,
              shadowColor: Colors.blue,
              padding: const EdgeInsets.all(20),
            ),
            child: const Text('ElevatedButton'),
          ),
          IconButton.filled(
              iconSize: 100,
                onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(backgroundColor:Colors.lime,
                  duration: Duration(seconds: 2),content: Text("example snackbar")));},
                icon: Icon(Icons.tv),),
    ],
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor: Colors.blue,
          tooltip: 'Increment',
          elevation: 20,
          hoverColor: Colors.amber,
          splashColor: Colors.purple,
          child: const Icon(Icons.add),

        ),








    );
  }
}
