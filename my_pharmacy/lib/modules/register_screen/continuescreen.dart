import 'package:flutter/material.dart';
import 'package:my_pharmacy/shared/components/components.dart';

import '../../layout/pharmacy_app/modules/register_pharmacy.dart';


class ContinueScreen extends StatelessWidget {
  const ContinueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 500,
                  height: 350,
                  child: Image(
                    image: AssetImage('assets/images/pharmacy.png'),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    'Click the Continue button if you want to login or register on our application',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
             Container(
               decoration: BoxDecoration(
                 color: Colors.teal,
                 borderRadius: BorderRadius.circular(25.0),
               ),
               height: 70.0,
               width: 150.0,
               child: MaterialButton(onPressed: ()
               {
                 navigateTo(context, LoginPharmacy());
               },
                  child: Text(
                  'Continue',
               style: TextStyle(
                 fontSize: 25.0,
               color: Colors.white,
               ),
               )
               ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
