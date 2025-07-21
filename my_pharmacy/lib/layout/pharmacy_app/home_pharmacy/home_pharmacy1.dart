import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/shared/components/components.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'home_pharmacy2.dart';

class HomePharmacy extends StatelessWidget {
  const HomePharmacy({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyCubit, PharmecyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PharmacyCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Welcome to our app!!',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 29.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 220,
                child: Image(
                  image: AssetImage('assets/images/4App.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '-Our new pharmacy app will provide you with all the help and the information you would need to manage your pharmacy stock and make your work easier.!',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(25.0),
              ),
              height: 50.0,
              width: 200.0,
              child: MaterialButton(onPressed: ()
              {
                navigateTo(context, HomePharmacy2());
              },
                  child: Text(
                    'Let’s get started!!',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  )
              ),
            ),

          ],
        );
      },
    );
  }
}
