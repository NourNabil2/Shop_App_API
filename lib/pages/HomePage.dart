import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:shop/pages/search.dart';

import '../components/Model_Categories.dart';
import '../components/Model_Home.dart';
import '../cubit/cubits.dart';
import '../cubit/states.dart';




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewStates>
        (
        listener: (context, state) {
          if (state is EnterFAViesState )
            {
              if (state.favDatastate.status == true)
              FlutterToastr.show('${state.favDatastate.message}', context,duration: FlutterToastr.lengthLong, backgroundColor: Colors.green,position: FlutterToastr.bottom);
            }


        },
    builder: (context, state) {
      NewsCubit cubit = NewsCubit.get(context);
      return cubit.homeModelData !=null && cubit.categoriesModel != null ? page() : Center(child: CircularProgressIndicator(color:Colors.deepPurple ,)) ;
    }
    );

  }

  Widget page()
  {
    return BlocConsumer<NewsCubit, NewStates>
      (
      listener: (context, state) {},
      builder: (BuildContext context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
            ),

            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              shrinkWrap: true,
              slivers: [
                buildSliverAppBar(cubit.homeModelData as HomeModelData),
                SliverToBoxAdapter(child: Padding(
                  padding: const EdgeInsets.only(left: 15.0 , top: 25,bottom: 10.0),
                  child: Text('Categories',style: TextStyle(color: Colors.black ,fontSize: 25 ,fontWeight: FontWeight.bold ),),
                )),
                buildListViewH(cubit.categoriesModel as CategoriesModel ),
                SliverToBoxAdapter(child: Padding(
                  padding: const EdgeInsets.only(left: 15.0 ,top: 10),
                  child: Text('New Products',style: TextStyle(color: Colors.black ,fontSize:25 ,fontWeight: FontWeight.bold )),
                )),
                buildGridView(cubit.homeModelData as HomeModelData , cubit),
              ],
            ),
          ),

        );
      },
    );



}



  Widget buildSliverAppBar(HomeModelData model) {
    return BlocConsumer<NewsCubit, NewStates>(
      builder: (BuildContext context, state) {
        return SliverAppBar(
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(15.0),
          //     bottomRight: Radius.circular(15.0),
          //   ),
          // ),

          expandedHeight: 280,
          pinned: true,
          stretch: true,
          backgroundColor: Colors.white,
          title: Text('ShopApp',style: TextStyle(color: Colors.black),) ,
          actions: [ IconButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder:  (context) => search(), )); }, icon: Icon(CupertinoIcons.search,color: Colors.black,) )],
          flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
            background: CarouselSlider(items: model.data?.banners.map( (e) => Image(image: NetworkImage('${e.image }'),width: double.infinity,height: double.infinity ,fit: BoxFit.fill,) ).toList(),

                options: CarouselOptions(height: 300,initialPage: 0,enableInfiniteScroll: true , viewportFraction: 1.0 ,reverse: false ,autoPlay: true ,autoPlayInterval: Duration(seconds: 6) ,autoPlayAnimationDuration: Duration(seconds: 1),autoPlayCurve:Curves.fastOutSlowIn,scrollDirection: Axis.horizontal , ) ),
          ),


        );
      },
      listener: (BuildContext context, Object? state) {  },


    );
  }
  Widget buildListViewH(CategoriesModel model) {
    return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(


          height: 100.0,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: model.data?.data.length,
          itemBuilder: (context, index) {
      return Container(
          width: 100.0,
          child: Card(
            child: Column(
              children: [
                Container( width: double.infinity ,child: Text('${model.data?.data[index].name}', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold ),overflow: TextOverflow.ellipsis,maxLines: 1,textAlign: TextAlign.center, )),
                Image( image: NetworkImage( '${model.data?.data[index].image}' )  ,height: 70.0 ,fit: BoxFit.cover),
              ],
            ),
          ),
      );
    },
    ),
    ),
        )
    );
  }
  Widget buildGridView(HomeModelData model, NewsCubit cubit) {
    return SliverGrid(delegate: SliverChildListDelegate(
        List.generate(model.data!.products.length, (index) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(image: NetworkImage(model.data?.products[index].image as String) , height: 200 ,width: double.infinity),
                      ) ,
                      if (model.data?.products[index].discount != 0)
                        Container(padding: EdgeInsets.all(4),decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.only(topRight: Radius.elliptical(80, 25) ,bottomRight: Radius.elliptical(80, 25))),
                          child: Text('Discount',style: TextStyle(color: Colors.white ,fontSize: 12.0 )),)
                    ]),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.data?.products[index].name as String , maxLines: 2 ,overflow: TextOverflow.ellipsis, style: TextStyle(height: 1.3 ,fontSize: 15),),
                      Row(
                        children: [
                          Text('${model.data?.products[index].price}'  ,style: TextStyle(color: Colors.blue),),
                          SizedBox(width: 5,),
                          if (model.data?.products[index].discount != 0)
                            Text('${model.data?.products[index].old_price}'  ,
                              style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey),),
                          Spacer(),
                          IconButton(onPressed: () {
                            cubit.ChangeFAV(model.data?.products[index].id);
                          }, icon:cubit.fav[model.data?.products[index].id] == false ? Icon( Icons.favorite_border ,) : Icon( Icons.favorite ,color: Colors.red,) )

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ))), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,crossAxisSpacing: 1.0 ,mainAxisSpacing: 1.0, childAspectRatio: 1/1.88, )) ;
  }

}
