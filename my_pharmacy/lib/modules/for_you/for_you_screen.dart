import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit2/cubit.dart';
import '../search_screen/search_screen.dart';
import 'information_screen.dart';

class ForYouScreen extends StatefulWidget {
  const ForYouScreen({super.key});

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'This Screen For You!!!',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                '-Here you can enter the information you care about keeping them later,\n'
                    'you can press the second screen overload and add the patient\'s status that you care where you can add:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              Text(
                '-The name of Dr. which came from him.\n'
                    '-Taking the medicine times you selected.\n'
                    '-The names of the drugs in the bulletin by Dr. or described.\n'
                    '-The appropriate caliber per medicine.\n',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                height: 50.0,
                width: 350.0,
                child: defultButton(
                  function: ()
                  {
                    navigateTo(context, InformationScreen());
                  },
                  text: 'Click if you want to add',
                  isUpperCase: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
