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




  bool passowrdhiddin = true;
  IconData suffix = Icons.visibility_outlined ;
  void Passwordhidden()
  {
    passowrdhiddin = !passowrdhiddin;
    suffix = passowrdhiddin? Icons.visibility_outlined : Icons.visibility_off_outlined ;


    emit(PasswordHiddeState());
  }


}
