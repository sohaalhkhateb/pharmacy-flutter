import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/layout/pharmacy_app/product_details/cubit/cubit.dart';
import 'package:my_pharmacy/layout/pharmacy_app/product_details/cubit/states.dart';
import 'package:my_pharmacy/shared/components/components.dart';
import '../../../shared/cubit2/cubit.dart';
import 'package:my_pharmacy/modules/search_screen/search_screen.dart';
import 'package:my_pharmacy/layout/pharmacy_app/Additional%20products/cubit.dart';
import 'package:my_pharmacy/layout/pharmacy_app/Additional%20products/states.dart';
class ChildrenProducts extends StatelessWidget {
  const ChildrenProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdditionCubit()..getChildren(),
      child: BlocConsumer<AdditionCubit,AdditionStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
                   var adittionchildren  = AdditionCubit.get(context).adittionchildren;
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
                  body: generalListBuilder(
  item: adittionchildren,
  context: context,
  isMedication: false,
  itemBuilder: (item, ctx) => buildProductItem(
    item: item,
    context: ctx,
    isMedication: false,
  ),
                  ),
  );
        }
      ),
    );
  }
}