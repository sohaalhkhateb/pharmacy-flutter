import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/layout/pharmacy_app/product_details/cubit/cubit.dart';
import 'package:my_pharmacy/layout/pharmacy_app/product_details/cubit/states.dart';
import 'package:my_pharmacy/shared/components/components.dart';

class ProductdetailsScreen extends StatefulWidget {
  const ProductdetailsScreen({super.key});

  @override
  State<ProductdetailsScreen> createState() => _ProductdetailsScreenState();
}

class _ProductdetailsScreenState extends State<ProductdetailsScreen> {
   
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit()..getProducts(),
      child: BlocConsumer<ProductDetailsCubit, ProductStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var products  = ProductDetailsCubit.get(context).products;
          return generalListBuilder(
  item: products,
  context: context,
  isMedication: true,
  itemBuilder: (item, ctx) => buildProductItem(
    item: item,
    context: ctx,
    isMedication: true,
  ),
);
        }
      ),
    );
  }
}
