import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_pharmacy/layout/pharmacy_app/cubit/states.dart';
import 'package:my_pharmacy/modules/register_screen/continuescreen.dart';


import '../../../shared/network/local/cache_helper.dart';
import '../Additional products/additional_products.dart';
import '../contact/contact_screen.dart';
import '../home_pharmacy/home_pharmacy1.dart';
import '../home_pharmacy/home_pharmacy2.dart';
import '../product_details/productdetails_screen.dart';

class PharmacyCubit extends Cubit<PharmecyStates>
{
  PharmacyCubit() : super(PharmacyInitialState());

  static PharmacyCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;

  List<Widget> screens = [
    ProductdetailsScreen(),
    AdditionalProducts(),
    ContactScreen(),

  ];
  void changeNavBarIndex(index)
  {
    currentIndex = index;
    if(index == 1)
      {
        getAdditional();
      }
    if(index == 2)
    {
      getContact();
    }

    emit(NewsBottomNavState());
  }

  void getHome()
  {
    emit(PharmacyHomeState());
  }
  void getRegister()
  {
    emit(PharmacyRegisterState());
  }

  void getAdditional()
  {
    emit(PharmacyAdditionalState());
  }

  void getDetails()
  {
    emit(PharmacyProductDetailsState());

  }
  void getContact()
  {
    emit(PharmacyContactState());
  }

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.local_pharmacy,
        ),
      label: 'Medicines',),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.add_card_sharp,
      ),
      label: 'products',),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.contact_phone,
      ),
      label: 'Contact',),

  ];
}
