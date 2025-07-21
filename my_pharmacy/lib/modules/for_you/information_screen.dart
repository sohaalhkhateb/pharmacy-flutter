import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit2/cubit.dart';
import '../search_screen/search_screen.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

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
    );
  }
}
