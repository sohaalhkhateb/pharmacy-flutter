import 'package:flutter/material.dart';

import '../../../modules/search_screen/search_screen.dart';
import '../../../shared/components/components.dart';
import '../../../shared/cubit2/cubit.dart';
import 'home_pharmacy1.dart';
import 'home_pharmacy2.dart';

class HomePharmacy3 extends StatelessWidget {
  const HomePharmacy3({super.key});

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
              height: 210,
              child: Image(
                image: AssetImage('assets/images/drugs2.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '-There are also various forms of medications, including tablets, ointments, suppositories, and other types. We have categorized them according to their formulations to help you identify the different forms of each medication. Additionally, we have organized all the drugs based on their effectiveness date, allowing you to know which medication should be sold first to prevent any losses. All of this, along with many other services, will be available in this application.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '__________Now__________',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'you can return to the home page to complete your registration and start benefiting from the platform!',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
