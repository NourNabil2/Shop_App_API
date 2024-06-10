import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop/Core/Netawork/Dio_Network/Dio%20helper.dart';
import 'package:shop/Core/Utilts/end_points.dart';
import 'package:shop/main.dart';
import '../data/Model_Search.dart';

part 'shop_search_state.dart';

class ShopSearchCubit extends Cubit<ShopSearchState> {
  ShopSearchCubit() : super(ShopSearchInitial());
  static ShopSearchCubit get(context) => BlocProvider.of(context);
  ModelSearch? ModelData;
void search(String text)
{
  emit(ShopSearchLoading());
  DioHelper.postdata(token: token,path: Search, data: {
    'text' : text,
  }).then((value) {
    ModelData = ModelSearch.fromJson(value.data);
    emit(ShopSearchEnter());

  }).catchError((e){print('search${e}');emit(ShopSearchErorr());});


}

}
