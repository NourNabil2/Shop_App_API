
import '../../Data/Model_login.dart';


abstract class ShopLoginState {}

class ShopLoginInitial extends ShopLoginState {}

class LoginEnterState extends ShopLoginState{
   final ShopModelData logindata;

  LoginEnterState(this.logindata);
}

class LoginLoadingState extends ShopLoginState{}


class PasswordHiddeState extends ShopLoginState{}

class LoginError extends ShopLoginState{
  final error;

  LoginError(this.error);
}

class ProfileState extends ShopLoginState{
  final ShopModelData s;

  ProfileState(this.s);
}

class ErrorProfileState extends ShopLoginState{}



class UpdataEnterState extends ShopLoginState{
  final ShopModelData logindata;

  UpdataEnterState(this.logindata);
}

class UpdataLoadingState extends ShopLoginState{}

class ErrorUpdataState extends ShopLoginState{}