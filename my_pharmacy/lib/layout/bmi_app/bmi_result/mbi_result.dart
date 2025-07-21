import 'package:flutter/material.dart';

import '../../../modules/search_screen/search_screen.dart';
import '../../../shared/components/components.dart';
import '../../../shared/cubit2/cubit.dart';


class MbiResult extends StatelessWidget
{
  final double result;
  final bool isMale;
  final int age;

  MbiResult({
    required this.result,
    required this.age,
    required this.isMale,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Pharmacy App'
        ),
        actions: [
          IconButton(
            onPressed: ()
            {
              navigateTo(context, ProductsSearchScreen(),);
            },
            icon: Icon(Icons.search),),
          IconButton(
            onPressed: ()
            {
              AppCubit.get(context).changeAppMode();
            },
            icon: Icon(
              Icons.brightness_4_outlined,
            ),
          ),
        ],
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender: ${isMale? 'Male':'Female'}',
              style: TextStyle(
                color: Colors.grey,
               fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'Result: ${result.round()}',
              style: TextStyle(
                color: Colors.grey,
                  fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'Age:${age}',
              style: TextStyle(
                color: Colors.grey,
                  fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
