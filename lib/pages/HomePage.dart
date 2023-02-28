import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/pages/search.dart';

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
          // Mainbottom(namebottom: 'sighout', onpress: () {
          //   Navigator.pushAndRemoveUntil(
          //       context, MaterialPageRoute(builder: (context) => login(),), (
          //       Route<dynamic>route) => false);
          //   CashSaver.Cleardata(key: 'token');
          //   FlutterToastr.show('Signed out successfully', context,
          //       duration: FlutterToastr.lengthLong,
          //       backgroundColor: Colors.green,
          //       position: FlutterToastr.bottom);
          // } );
        },
    builder: (context, state) {
      NewsCubit cubit = NewsCubit.get(context);
      return cubit.homeModelData != null ? page() : Center(child: CircularProgressIndicator(color:Colors.deepPurple ,)) ;
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
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              shrinkWrap: true,
              slivers: [
                buildSliverAppBar(cubit.homeModelData as HomeModelData),
                SliverGrid(delegate: SliverChildListDelegate(
                    List.generate(cubit.homeModelData!.data!.products.length, (index) => Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                              children: [
                            Image(image: NetworkImage(cubit.homeModelData?.data?.products[index].image as String) , height: 200 ,width: double.infinity) ,
                                if (cubit.homeModelData?.data?.products[index].discount != 0)
                            Container(color: Colors.green,padding: EdgeInsets.all(4),
                              child: Text('Discount',style: TextStyle(color: Colors.white ,fontSize: 12.0 )),)

                          ]),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(cubit.homeModelData?.data?.products[index].name as String , maxLines: 2 ,overflow: TextOverflow.ellipsis, style: TextStyle(height: 1.3 ,fontSize: 15),),
                                Row(
                                  children: [
                                    Text('${cubit.homeModelData!.data?.products[index].price}'  ,style: TextStyle(color: Colors.blue),),
                                    SizedBox(width: 5,),
                                    if (cubit.homeModelData?.data?.products[index].discount != 0)
                                    Text('${cubit.homeModelData!.data?.products[index].old_price}'  ,
                                      style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey),),
                                    Spacer(),
                                    IconButton(onPressed: () {

                                    }, icon:Icon( Icons.favorite_border ,) )

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,crossAxisSpacing: 1.0 ,mainAxisSpacing: 1.0, childAspectRatio: 1/1.78, )),


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
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
          ),

          expandedHeight: 300,
          pinned: true,
          stretch: true,
          backgroundColor: Colors.white,
          title: Text('ShopApp',style: TextStyle(color: Colors.black),) ,
          actions: [ IconButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder:  (context) => search(), )); }, icon: Icon(CupertinoIcons.search,color: Colors.black,) )],
          flexibleSpace: FlexibleSpaceBar(
            // stretchModes: const <StretchMode>[
            //   StretchMode.zoomBackground,
            //   StretchMode.blurBackground,
            //   StretchMode.fadeTitle,
            // ],
          centerTitle: true,
            background: CarouselSlider(items: model.data?.banners.map( (e) => Image(image: NetworkImage('${e.image }'),width: double.infinity,height: double.infinity ,fit: BoxFit.fill,) ).toList(),

                options: CarouselOptions(height: 300,initialPage: 0,enableInfiniteScroll: true , viewportFraction: 1.0 ,reverse: false ,autoPlay: true ,autoPlayInterval: Duration(seconds: 6) ,autoPlayAnimationDuration: Duration(seconds: 1),autoPlayCurve:Curves.fastOutSlowIn,scrollDirection: Axis.horizontal , ) ),
          ),


        );
      },
      listener: (BuildContext context, Object? state) {  },


    );
  }
}
