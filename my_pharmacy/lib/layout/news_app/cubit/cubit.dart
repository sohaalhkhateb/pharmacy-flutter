import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/layout/news_app/cubit/states.dart';


import '../../../modules/news_app/business/business_screen.dart';
import '../../../modules/news_app/science/science_screen.dart';
import '../../../modules/news_app/sports/sports_screen.dart';
import '../../../shared/network/remote/dio_helper_news.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
            Icons.business,),
        label: 'Business',
    ),
    BottomNavigationBarItem(
        icon: Icon(
            Icons.sports,),
        label: 'Sports',
    ),
    BottomNavigationBarItem(
        icon: Icon(
            Icons.science,),
        label: 'Science',
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index)
  {
    currentIndex = index;
    if(index == 1)
      getSports();
    if(index == 2)
      getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    
    DioHelperNews.getData(
      url: 'top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': 'd0c286587fe84121a332ee88cb3c9cd5',
      },
    ).then((value)
    {
     // print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);
      
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    }
    );
  }

  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsGetSportsLoadingState());

    if(sports.length == 0)
      {
        DioHelperNews.getData(
          url: 'top-headlines',
          query: {
            'country': 'us',
            'category': 'sports',
            'apiKey': 'd0c286587fe84121a332ee88cb3c9cd5',
          },
        ).then((value)
        {
          // print(value.data['articles'][0]['title']);
          sports = value.data['articles'];
          print(sports[0]['title']);

          emit(NewsGetSportsSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsGetSportsErrorState(error.toString()));
        }
        );
      }else
        {
          emit(NewsGetSportsSuccessState());
        }


  }

  List<dynamic> science = [];

  void getScience()
  {
    emit(NewsGetScienceLoadingState());

    if(science.length == 0)
      {
        DioHelperNews.getData(
          url: 'top-headlines',
          query: {
            'country': 'us',
            'category': 'science',
            'apiKey': 'd0c286587fe84121a332ee88cb3c9cd5',
          },
        ).then((value)
        {
          // print(value.data['articles'][0]['title']);
          science = value.data['articles'];
          print(science[0]['title']);

          emit(NewsGetScienceSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));
        }
        );
      }else
        {
          emit(NewsGetScienceSuccessState());
        }


  }

  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());

    DioHelperNews.getData(
      url: 'everything',
      query: {
        'q': value,
        'apiKey': 'd0c286587fe84121a332ee88cb3c9cd5',
      },
    ).then((value)
    {
      // print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    }
    );


  }
}