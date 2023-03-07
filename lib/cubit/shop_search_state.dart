part of 'shop_search_cubit.dart';

@immutable
abstract class ShopSearchState {}

class ShopSearchInitial extends ShopSearchState {}

class ShopSearchLoading extends ShopSearchState {}

class ShopSearchEnter extends ShopSearchState {}

class ShopSearchErorr extends ShopSearchState {}
