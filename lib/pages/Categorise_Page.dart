import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/components/Model_Home.dart';

import '../components/Model_Categories.dart';
import '../cubit/cubits.dart';
import '../cubit/states.dart';

class Caregories extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewStates>(
        builder: (BuildContext context, state) { return ListView.separated(itemBuilder:(context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Image( image: NetworkImage( '${NewsCubit.get(context).categoriesModel?.data?.data[index].image}' )  ,height: 120.0 ,fit: BoxFit.cover),
                SizedBox(width: 20,),
                Text('${NewsCubit.get(context).categoriesModel?.data?.data[index].name}',style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                Spacer(),
                IconButton(onPressed: () {

                }, icon:  Icon(Icons.arrow_forward_ios) ),
              ],
            ),
          );
        }, separatorBuilder: (context, index) { return SizedBox(height: 10);} , itemCount: NewsCubit.get(context).categoriesModel!.data!.data.length);  },
        listener: (BuildContext context, Object? state) {  },
    );


  }

}