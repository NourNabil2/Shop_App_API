import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/components/Model_Home.dart';

import '../components/Model_Categories.dart';
import '../cubit/cubits.dart';
import '../cubit/states.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<NewsCubit, NewStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 120,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(alignment: Alignment.bottomLeft, children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                                image: NetworkImage('assets/1.png'),
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover),
                          ),
                          if (1 != 0)
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
                                'name',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(height: 1.3, fontSize: 15),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'prize',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  if (1 != 0)
                                    Text(
                                      'old',
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
                                        // cubit.ChangeFAV(model.data?.products[index].id);
                                      },
                                      icon: Icon(Icons.favorite)),
                                  // icon:cubit.fav[model.data?.products[index].id] == false ? Icon( Icons.favorite_border ,) : Icon( Icons.favorite ,color: Colors.red,) )
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
                  NewsCubit.get(context).categoriesModel!.data!.data.length);
        });
  }
}
