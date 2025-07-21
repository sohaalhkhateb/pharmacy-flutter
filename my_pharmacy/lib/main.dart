import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/layout/pharmacy_app/product_details/cubit/cubit.dart';
import 'package:sqflite/sqflite_dev.dart';
import 'package:my_pharmacy/layout/news_app/news_layout.dart';
import 'package:my_pharmacy/shared/bloc_observer.dart';
import 'package:my_pharmacy/shared/cubit2/cubit.dart';
import 'package:my_pharmacy/shared/cubit2/states.dart';
import 'package:my_pharmacy/shared/network/local/cache_helper.dart';
import 'package:my_pharmacy/shared/styles/themes.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/pharmacy_app/cubit/cubit.dart';
import 'layout/pharmacy_app/dio_helper_pharmacy/dio_helper_pharmacy.dart';
import 'layout/pharmacy_app/on_boarding_pharmacy/on_boarding_pharmacy_screen.dart';
import 'layout/pharmacy_app/pharmacy_layout.dart';
import 'models/calculate_app/calculate.dart';
import 'layout/todo_app/todo_layout.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'modules/simple.dart';
import 'modules/users/users_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bloc/bloc.dart';
//import 'package:hexcolor/hexcolor.dart';

import 'shared/network/remote/dio_helper_news.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  DioHelperPharmacy.init();

  Bloc.observer = MyBlocObserver();
  DioHelperNews.init();
  await CacheHelper.init();

 // databaseFactory = databaseFactorySqflitePlugin;

  bool isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));

  MyApp app = MyApp(isDark);
}

class MyApp extends StatelessWidget
{
  final bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context)
  {

    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          NewsCubit()..getBusiness()..getSports()..getScience(),),
        BlocProvider(
          create: (context) =>
          PharmacyCubit()..getRegister()..getDetails()..getContact(),),
        BlocProvider(
          create: (BuildContext context) =>
          AppCubit()..changeAppMode(isDark,),),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: lightTheme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: OnBoardingScreenPharmacy(),
          );
        },
      ),
    );
  }

}