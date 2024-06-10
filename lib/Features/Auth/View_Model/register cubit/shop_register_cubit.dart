import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop/Core/Utilts/end_points.dart';
import '../../../../Core/Netawork/Dio_Network/Dio helper.dart';
import '../../Data/Model_Register.dart';
part 'shop_register_state.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterState> {
  ShopRegisterCubit() : super(ShopRegisterInitial());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);
  ShopRegisterCubitModelData? registerData;

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(RegisterLoadingState());

    DioHelper.postdata(
        path: register,
        data: {
          'name' : name,
          'phone' : phone,
          'email': email,
          'password': password,
        }
    ).then((data) {
      registerData = ShopRegisterCubitModelData.fromJson(data.data);                // Model Data
      emit(RegisterEnterState(registerData!));
    }

    ).catchError((e){
      print('register Erorr:');
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
