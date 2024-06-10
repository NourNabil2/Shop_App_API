

import '../../Favorites/data/Model_FAV.dart';

abstract class NewStates{}

class NewInitialState extends NewStates{}

class NewBottomState extends NewStates{}

class LoadingHomeState extends NewStates{}

class EnterHomeState extends NewStates{}

class ErrorHomeState extends NewStates{}

class EnterCategoriesState extends NewStates{}

class ErrorCategoriesState extends NewStates{}

class EnterFAViesState extends NewStates{
  final FAVData favDatastate;

  EnterFAViesState(this.favDatastate);
}

class ErrorFAViesState extends NewStates{}

class GETFAViesState extends NewStates{}

class ChanheFAVState extends NewStates{}

class LoadingFAVState extends NewStates{}

class ErorrGETFAViesState extends NewStates{}


