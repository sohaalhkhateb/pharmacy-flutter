import 'package:flutter/material.dart';

import '../../../modules/search_screen/search_screen.dart';
import '../../../shared/components/components.dart';
import '../../../shared/cubit2/cubit.dart';
import 'home_pharmacy3.dart';

class HomePharmacy2 extends StatelessWidget {
  const HomePharmacy2({super.key});

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 220,
              child: Image(
                image: AssetImage('assets/images/drugs.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '-There are many brand names of medications that contain the same active ingredients, and it is possible that the brand name of a particular medication is not stored in your memory. We have attempted to compile a list of many commercial drug names and provide you with the specific formulation of each medication, making it easier for you to prescribe patients medications with the desired composition.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(25.0),
            ),
            height: 45.0,
            width: 200.0,
            child: MaterialButton(onPressed: ()
            {
              navigateTo(context, HomePharmacy3());
            },
                child: Text(
                  'Next page',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
