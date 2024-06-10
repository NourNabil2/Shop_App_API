import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Features/categorise/data/Model_Categories.dart';
import 'package:shop/Features/main%20page/view%20model/states.dart';
import '../../../Core/Netawork/Dio_Network/Dio helper.dart';
import '../../../Core/Utilts/end_points.dart';
import '../../Favorites/data/Model_FAV.dart';
import '../../Favorites/data/Model_GETfav.dart';
import '../../home/data/Model_Home.dart';
import '../../Auth/Data/Model_login.dart';
import '../../../main.dart';
import '../../cart/view/Cart_Page.dart';
import '../../Favorites/view/Favorites_Page.dart';
import '../../home/view/HomePage.dart';
import '../../categorise/view/Categorise_Page.dart';
import '../../Setting/view/Setting_Page.dart';


class NewsCubit extends Cubit<NewStates>
{
  NewsCubit() : super (NewInitialState());



  static NewsCubit get(context) => BlocProvider.of(context);
  int current=2;
  List<BottomNavigationBarItem> Bottomsheet = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings),label: 'Settings'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_border), activeIcon: Icon(Icons.favorite ,color: Colors.redAccent )  ,label: 'Favorites'),
    BottomNavigationBarItem(icon: Icon(Icons.abc ,color: Colors.transparent),label: '' ),
    BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Categories' ),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined),label: 'Categories' ),

  ];
  List pages = [
    Setting(),
    Favorite(),
    HomePage(),
    Caregories(),
    Cart(),
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
    homeModelData!.data?.products.forEach((element) {
      fav.addAll({
        element.id : element.in_favorites ,
      });
    })  ;

    // print(value.data.toString());
    // print(homeModelData!.data?.banners[0].image);
    emit(EnterHomeState());



  }).catchError((e){print( 'error nour :  ${e.toString()}' ); emit(ErrorHomeState());});
}

CategoriesModel? categoriesModel ;
void getallCategories()
{
  DioHelper.getdata(Url: categories ,token: token).then((value) {
    categoriesModel = CategoriesModel.fromjson(value.data);
    emit(EnterCategoriesState());
  }).catchError((e){print('Categories erorr : ${e.toString()}'); emit(ErrorCategoriesState()); });
}





  Map<int , bool? > fav ={};
  ShopModelData? loginData;
  FAVData? favData;

void ChangeFAV(int productID)
{
  fav[productID] = !fav[productID]!;
  emit(ChanheFAVState());
  emit(LoadingFAVState());
DioHelper.postdata(path: favorites,
    token: token,
    data:{
'product_id' : productID
}

).then((value) => {

  favData = FAVData.fromJson(value.data),
  if ( favData!.status == false  )
    {
    fav[productID] = !fav[productID]!
    }
  else
    {
    emit(LoadingFAVState())

    },

      emit(EnterFAViesState(favData!)),



}).catchError((e){ print('on erorr :'); emit(ErrorFAViesState());fav[productID] = !fav[productID]!;});
}


  ModelGETFavorite? modelGETFavorite ;
  void getallFAV()
  {
    emit(LoadingFAVState());
    DioHelper.getdata(Url: favorites ,token: token).then((value) {
      modelGETFavorite = ModelGETFavorite.fromJson(value.data);
      emit(GETFAViesState());
    }).catchError((e){print('FAV erorr : ${e.toString()}'); emit(ErorrGETFAViesState()); });
  }



}

