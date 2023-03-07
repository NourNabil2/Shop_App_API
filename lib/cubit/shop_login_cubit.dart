import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/shop_login_state.dart';
import 'package:shop/main.dart';

import '../Dio_Network/Dio helper.dart';
import '../Dio_Network/end_points.dart';
import '../components/Model_login.dart';


class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitial());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  ShopModelData? loginData;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.postdata(
      token: token,
        path: Login,
        data: {
      'email': email,
      'password': password,
              }
    ).then((data) {
      loginData = ShopModelData.fromJson(data.data);                // Model Data
      emit(LoginEnterState(loginData!));
                  }

    ).catchError((e){
      print(e);
      emit(LoginError(e.toString()));});
  }

  ShopModelData? UserData;
  void GetProfile()
  {
    DioHelper.getdata(Url: profile ,token: token).then((value) {
      UserData = ShopModelData.fromJson(value.data);
      print(value.data.toString());
      emit(ProfileState(UserData!));
    }).catchError((e){print('Profile erorr : ${e.toString()}'); emit(ErrorProfileState()); });
  }

  void UpdataProfile({
    required String name ,
    required String email,
    required String phone,
    required String password,

})
  {
    DioHelper.putdata(token: token, path: Updata,
        data: {
          'name' : name ,
          'phone' : phone ,
          'email' : email ,
          'password' : password,

        }
        ).then((value) {
      UserData = ShopModelData.fromJson(value.data);
      print(value.data.toString());
      emit(UpdataEnterState(UserData!));
    }).catchError((e){print('Profile erorr : ${e.toString()}'); emit(ErrorUpdataState()); });
  }








  bool passowrdhiddin = true;
  IconData suffix = Icons.visibility_outlined ;
  void Passwordhidden()
  {
    passowrdhiddin = !passowrdhiddin;
    suffix = passowrdhiddin? Icons.visibility_outlined : Icons.visibility_off_outlined ;


    emit(PasswordHiddeState());
  }


}
