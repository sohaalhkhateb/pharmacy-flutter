import 'package:flutter/material.dart';

class Raed2 extends StatelessWidget {
  Raed2({super.key});

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Title",
          ),
          centerTitle: true,
          leading: Icon(Icons.arrow_back),
          actions: [
            IconButton(
              onPressed: () {
                print('hello action');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                        'this is SnackBar',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                  duration: Duration(seconds: 2),
                    backgroundColor: Colors.black,
                    showCloseIcon: true,
                    closeIconColor: Colors.red,
                  ),

                );
              },
              icon: Icon(
                Icons.search,
                size: 35.0,
                color: Colors.yellowAccent,
              ),
              style: IconButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            )
          ],
        ),
        body: ListView.builder(
           //padding: EdgeInsets.all(10),
          itemBuilder: (context, index) => Container(
            color: colorList[index],
            child: Text(colorNameList[index]),
          ),
          itemCount: colorNameList.length,
        ),
    );
  }
}
