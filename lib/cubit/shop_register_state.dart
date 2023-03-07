part of 'shop_register_cubit.dart';

@immutable
abstract class ShopRegisterState {}

class ShopRegisterInitial extends ShopRegisterState {}

class RegisterEnterState extends ShopRegisterState{
  final ShopRegisterCubitModelData registerData;

  RegisterEnterState(this.registerData);
}

class RegisterLoadingState extends ShopRegisterState{}

class PasswordHiddeState extends ShopRegisterState{}

class LoginError extends ShopRegisterState{
  final error;

  LoginError(this.error);
}

class ProfileState extends ShopRegisterState{
  final ShopRegisterCubitModelData s;

  ProfileState(this.s);
}

class ErrorProfileState extends ShopRegisterState{}
