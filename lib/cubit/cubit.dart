import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/moduels/science_screen.dart';
import 'package:newsapp/moduels/sports_screen.dart';
import 'package:newsapp/network/cache_helper.dart';

import '../moduels/business_screen.dart';
import '../network/dio_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;

  List currentBody=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen()
  ];

  List<Text> currentTitle=[
    Text('Business news'),
    Text('Sports News'),
    Text('Science News'),

  ];

  void changeBottomNavBar(index){
    currentIndex=index;
     if(index==1){getSportsNews();}
     if(index==2){getScienceNews();}


    emit(AppChangeBottomNavBar());
  }

List<dynamic> businessNews=[];
  void getBusinessNews(){
    emit(AppLoadingBusinessNewsState());
    DioHelper.getData(
        url:'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'56deb1a4e29b4ff3aba1a1ec3808797a'
        }).then((value) {
          emit(AppSucceededBusinessNewsState());
      print(value.data['articles'][0]['source']);
      businessNews=value.data['articles'];
    }).catchError((error){
      print(error.toString());
      emit(AppErrorBusinessNewsState());
    });
  }

  List<dynamic> sportsNews =[];
  void getSportsNews(){
    if(sportsNews.length==0)
    {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'sports',
            'apiKey':'56deb1a4e29b4ff3aba1a1ec3808797a'
          }).then((value){
        sportsNews=value.data['articles'];
        print('Sports herrrrrrrrrrr');
        print(sportsNews);
        emit(AppSucceededSportsNewsState());
      }).catchError((error){
        print(error.toString());
        emit(AppErrorSportsNewsState());
      });
    }
    else
      {
        emit(AppSucceededSportsNewsState());
      }

  }

  List<dynamic> scienceNews =[];
  void getScienceNews(){
    if (scienceNews.length==0)
    {
      emit(AppLoadingScienceNewsState());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'science',
            'apiKey':'56deb1a4e29b4ff3aba1a1ec3808797a'
          }
      ).then((value) {
        scienceNews=value.data['articles'];
        emit(AppSucceededScienceNewsState());
        print('science heeeeeeeeeeeeeeer');
        print(scienceNews);
      }).catchError((error){print(error.toString());});
    }
    else{
      emit(AppLoadingScienceNewsState());
    }

  }

  List<dynamic> search =[];
  void getSearchNews({required value}){
      emit(AppLoadingSearchNewsState());
      search =[];
      DioHelper.getData(
          url: 'v2/everything',
          query: {
            'q':'$value',
            'apiKey':'56deb1a4e29b4ff3aba1a1ec3808797a'
          }
      ).then((value) {
        search=value.data['articles'];
        emit(AppSucceededScienceNewsState());
        print('Search search heeeeeeeeeeeeeeer');
        print(search);
      }).catchError((error){print(error.toString());});



  }



  bool isDark=true;
  void changeThemMode(){
    isDark=!isDark;
    CacheHelper.putData(key: 'isDark', value: isDark)
        .then((value) =>  emit( AppChangeThemModeState() ) );


  }



}