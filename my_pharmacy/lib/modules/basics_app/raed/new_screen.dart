import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // main axis alignment : start
    // cross axis alignment : center
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'First App',
        ),
        actions: [
          IconButton( icon: Icon(
            Icons.notification_important,
          ),
          onPressed: onNotification,
          ),
          IconButton(icon: Icon(
            Icons.search,),
    onPressed: (){
            print('hello');
    },
          )
        ],
    ),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(20.0),
              )
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image(
                  image: NetworkImage(
                    'https://img.freepik.com/free-photo/vibrant-colors-nature-close-up-wet-purple-daisy-generated-by-artificial-intellingence_25030-63819.jpg'
                  ),
                  height: 200.0,
                  width: 200.0,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 200.0,
                  color: Colors.black.withOpacity(.7),
                  padding:const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  child: Text(
                    'Flower',
                   textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),



    );
  }

  void onNotification() {
    print('notification clicked');
  }
}
