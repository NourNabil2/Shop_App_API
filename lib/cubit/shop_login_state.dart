
import '../components/Model_login.dart';

abstract class ShopLoginState {}

class ShopLoginInitial extends ShopLoginState {}

class LoginEnterState extends ShopLoginState{
   final ShopModelData logindata;

  LoginEnterState(this.logindata);
}

class LoginLoadingState extends ShopLoginState{}

class PasswordHiddeState extends ShopLoginState{}

class LoginError extends ShopLoginState{
  final  error;

  LoginError(this.error);
}

