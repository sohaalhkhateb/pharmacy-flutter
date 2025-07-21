import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/layout/news_app/cubit/cubit.dart';
import 'package:my_pharmacy/layout/pharmacy_app/cubit/cubit.dart';
import 'package:my_pharmacy/layout/pharmacy_app/cubit/states.dart';
import 'package:my_pharmacy/modules/search_screen/search_screen.dart';

import '../../modules/search_screen/search_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit2/cubit.dart';

class PharmacyLayout extends StatelessWidget {
  const PharmacyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyCubit, PharmecyStates>(
      listener: (context, stete) {},
      builder: (context, stete)
      {
        var cubit = PharmacyCubit.get(context);

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
            cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeNavBarIndex(index);
            },
            items: cubit.bottomItems,),
        );
      },
    );
  }
}
