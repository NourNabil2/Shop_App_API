import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Features/main%20page/view%20model/states.dart';
import '../../main page/view model/cubits.dart';


class Caregories extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewStates>(
      listener: (BuildContext context, Object? state) {  },
        builder: (BuildContext context, state) {
          return ListView.separated(itemBuilder:(context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Image( image: NetworkImage( '${NewsCubit.get(context).categoriesModel?.data?.data[index].image}' )  ,height: 100.0 ,width: 100,fit: BoxFit.cover),
                SizedBox(width: 20,),
                Text('${NewsCubit.get(context).categoriesModel?.data?.data[index].name}',style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold,),overflow: TextOverflow.fade),
                Spacer(),
                IconButton(onPressed: () {

                }, icon:  Icon(Icons.arrow_forward_ios) ),
              ],
            ),
          );
        }, separatorBuilder: (context, index) { return SizedBox(height: 10);} , itemCount: NewsCubit.get(context).categoriesModel!.data!.data.length);  },

    );


  }

}