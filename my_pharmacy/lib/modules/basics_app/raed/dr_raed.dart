import 'package:flutter/material.dart';

class Dr_Raed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text(
            'Hii !!',
          ),
        ),
        leading: Icon(
          Icons.home,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.abc),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 200,
            height: 100,
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: const DecorationImage(
                image: AssetImage('assets/images/Female_35792.png'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Colors.black,
                width: 10.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(10.0, 22.0),
                  blurRadius: 20.0,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          IconButton.filled(
              padding: EdgeInsets.all(50),
              iconSize: 50,
              style: IconButton.styleFrom(
                  side: BorderSide(width: 10, color: Colors.black),
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.orange,
                  hoverColor: Colors.red,
                  highlightColor: Colors.green,
                  shadowColor: Colors.pink,
                  elevation: 50),
              onPressed: () {},
              icon: Icon(Icons.lock)),
        ],
      ),
    );
  }
}
