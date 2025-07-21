import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class Simple extends StatelessWidget {

  DatabaseFactory databaseFactory = databaseFactoryFfi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HomePage',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body:
      Column(
        children: [
          TextButton(
              onPressed: (){},
              child: Text('insert Data'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          ),
          SizedBox(
            height: 25.0,
          ),
          TextButton(
              onPressed: (){},
              child: Text('read Data'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          ),
        ],
      ),
    );
  }
}
