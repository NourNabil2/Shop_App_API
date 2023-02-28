

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/states.dart';
import '../Dio_Network/Dio helper.dart';
import '../Dio_Network/end_points.dart';

import '../components/Model_Home.dart';
import '../main.dart';
import '../pages/HomePage.dart';
import '../pages/games.dart';
import '../pages/search.dart';

class NewsCubit extends Cubit<NewStates>
{
  NewsCubit() : super (NewInitialState());



  static NewsCubit get(context) => BlocProvider.of(context);
  int current=2;
  List<BottomNavigationBarItem> Bottomsheet = [
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball) ,label: 'Favorites'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball) ,label: 'Favorites'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball,color: Colors.transparent),label: '' ),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball),label: 'Categories' ),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball),label: 'Categories' ),

  ];
  List pages = [
    games(),
    search(),
    HomePage(),

  ] ;
void ChangePage (index)
{
  current=index;
  emit(NewBottomState());
}

HomeModelData? homeModelData;
void getAllData()
{
  emit(LoadingHomeState());
  DioHelper.getdata(Url: Home ,token: token ).then((value) {
    homeModelData = HomeModelData.fromJson(value.data );

    // print(value.data.toString());
    // print(homeModelData!.data?.banners[0].image);
    emit(EnterHomeState());



  }).catchError((e){print( 'error nour :  ${e.toString()}' ); emit(ErrorHomeState());});
}

// CategoriesModel? CategoriesModel;




}

