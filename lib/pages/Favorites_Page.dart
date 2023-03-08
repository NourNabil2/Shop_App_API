import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:shop/components/component.dart';
import '../cubit/cubits.dart';
import '../cubit/states.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = NewsCubit.get(context)..getallFAV();
    return BlocConsumer<NewsCubit, NewStates>(

        listener: (context, state) {
        if (state is EnterFAViesState)
          {
if ( state.favDatastate.status == true )
  {
    FlutterToastr.show('${state.favDatastate.message}' ,backgroundColor: Colors.green, context);
  }
else
  {
    FlutterToastr.show('${state.favDatastate.message}' ,backgroundColor: Colors.red, context);
  }
          }
        },
        builder: (BuildContext context, state) {
          return state is LoadingFAVState ? Center(child: CircularProgressIndicator(color: Colors.purple,)) :

          cubit.modelGETFavorite?.data?.data.isEmpty == true ? EmptyImage('Empty Favorites'):
          ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: 120,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(alignment: Alignment.bottomLeft, children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                                image: NetworkImage('${cubit.modelGETFavorite?.data?.data[index].product?.image}'),
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover),
                          ),
                          if (cubit.modelGETFavorite?.data?.data[index].product?.discount != 0)
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.elliptical(80, 25),
                                      bottomRight: Radius.elliptical(80, 25))),
                              child: Text('Discount',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0)),
                            )
                        ]),
                        SizedBox(height: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${cubit.modelGETFavorite?.data?.data[index].product?.name}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(height: 1.3, fontSize: 15),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${cubit.modelGETFavorite?.data?.data[index].product?.price}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  if (cubit.modelGETFavorite?.data?.data[index].product?.discount != 0)
                                    Text(
                                      '${cubit.modelGETFavorite?.data?.data[index].product?.oldPrice}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        cubit.ChangeFAV(cubit.homeModelData?.data?.products[index].id);
                                      },
                                   icon:cubit.fav[cubit.modelGETFavorite?.data?.data[index].product?.id] == false ? Icon( Icons.favorite_border ,) : Icon( Icons.favorite ,color: Colors.red,) )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
              itemCount:
              cubit.modelGETFavorite!.data!.data.length

          );
        });
  }
}
