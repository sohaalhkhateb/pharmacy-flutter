import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/layout/pharmacy_app/Additional%20products/children_products.dart';
import 'package:my_pharmacy/layout/pharmacy_app/Additional%20products/cubit.dart';
import 'package:my_pharmacy/layout/pharmacy_app/Additional%20products/dental_care.dart';
import 'package:my_pharmacy/layout/pharmacy_app/Additional%20products/skincare_screen.dart';
import 'package:my_pharmacy/layout/pharmacy_app/Additional%20products/states.dart';
import 'package:my_pharmacy/shared/components/components.dart';

class AdditionalProducts extends StatefulWidget {
  const AdditionalProducts({super.key});

  @override
  State<AdditionalProducts> createState() => _AdditionalProductsState();
}

class _AdditionalProductsState extends State<AdditionalProducts> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdditionCubit(),
      child: BlocConsumer<AdditionCubit,AdditionStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  InkWell(
                     borderRadius: BorderRadius.circular(25.0),
                  onTap: () {
                    print("Tapped Skin care");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tapped!')),
                    );
                    navigateTo(context, SkincareScreen());
                  },
                    child: Container(
                      height: 110,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(15.0),
                           child: Container(
                             width: 150,
                             height: 80,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(25.0),
                             ),
                             child: Image(
                           image: AssetImage('assets/images/product1.png'),
                                   ),
                           ),
                         ),
                         Text(
                           'Skin care products',
                           style: TextStyle(
                             fontSize: 12,
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                           ),
                         ),
                       ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(25.0),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tapped!')),
                    );
                    navigateTo(context, ChildrenProducts());
                  },
                    child: Container(
                      height: 110,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(15.0),
                           child: Container(
                             width: 150,
                             height: 80,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(25.0),
                             ),
                             child: Image(
                           image: AssetImage('assets/images/product2.png'),
                                   ),
                           ),
                         ),
                         Text(
                           'Children\'s products',
                           style: TextStyle(
                             fontSize: 12,
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                           ),
                         ),
                       ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(25.0),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tapped!')),
                    );
                    navigateTo(context, DentalcareScreen());
                  },
                    child: Container(
                      height: 110,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(15.0),
                           child: Container(
                             width: 150,
                             height: 80,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(25.0),
                             ),
                             child: Image(
                           image: AssetImage('assets/images/dental.png'),
                                   ),
                           ),
                         ),
                         Text(
                           'dental care\nproducts',
                           style: TextStyle(
                             fontSize: 12,
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                           ),
                         ),
                       ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      );
        },
        )
    );
  }
}
