import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/shop_search_cubit.dart';

import '../components/component.dart';
class search extends StatelessWidget {
  @override
  var searchController = TextEditingController();
  var FormKEY = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocProvider(create: (context) => ShopSearchCubit(),
    child: BlocConsumer<ShopSearchCubit, ShopSearchState>(
      listener: (context, state) {

      },
      builder: (context, state) {

        ShopSearchCubit cubit = ShopSearchCubit.get(context);

        return Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: FormKEY,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultFormField(controller: searchController, type: TextInputType.text, lable: 'Search here', icon: Icons.search, onChange: (String text){
                    ShopSearchCubit.get(context).search(text);
                  }, onFieldSubmitted: null,valid:  (value)
                  {
                    if (value.isEmpty)
                    {
                      return ('Search empty !!');
                    }
                    return null;
                  },),
                  SizedBox(height: 10,),
                  if (state is ShopSearchLoading)
                    LinearProgressIndicator(color: Colors.deepPurpleAccent ,backgroundColor: Colors.deepPurpleAccent[100],),
                  SizedBox(height: 10,),
          if (state is ShopSearchEnter)
          Expanded(
            child: ListView.separated(
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
                                  image: NetworkImage('${cubit.ModelData?.data?.data[index].image}'),
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover),
                            ),
                          ]),
                          SizedBox(height: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${cubit.ModelData?.data?.data[index].name}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(height: 1.3, fontSize: 15),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Text(
                                      '${cubit.ModelData?.data?.data[index].price}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.blue),
                                    ),


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
                  return Container(color: Colors.grey,height: 1,);
                },
                itemCount: cubit.ModelData!.data!.data.length



            ),
          ),
                ],
              ),
            ),
          ),
        );
      },
    ),);

  }
}
