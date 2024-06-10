import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Features/Auth/View_Model/login%20cubit/shop_login_state.dart';
import '../../../Core/widgets/component.dart';
import '../../Auth/View_Model/login cubit/shop_login_cubit.dart';
import '../../Update/Update_Page.dart';


class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return BlocProvider(
    create: (BuildContext context) =>  ShopLoginCubit()..GetProfile(),
    child: BlocConsumer<ShopLoginCubit, ShopLoginState>
        (
        listener: (context, state) {},
        builder: ( context, state) {
          ShopLoginCubit cubit = ShopLoginCubit.get(context);
          return cubit.UserData?.data?.name?.isEmpty == true ? Center(child: CircularProgressIndicator(color: Colors.purple,)) :  Scaffold(
            body: Container(
              child:CustomScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                shrinkWrap: true,
                slivers: [
                  SliverAppBar(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    expandedHeight: 250,
                    pinned: true,
                    stretch: true,
                    backgroundColor: Colors.grey,
                    // leading:  IconButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder:  (context) => HomePage(), )); }, icon: Icon(CupertinoIcons.back,color: Colors.black,) ),
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        background: Stack(
                            children:[

                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 20,),
                                CircleAvatar(backgroundImage: NetworkImage('${cubit.UserData?.data?.image }' ),maxRadius: 50),
                                SizedBox(height: 10,),
                                Text('${cubit.UserData?.data?.name}' ,overflow: TextOverflow.ellipsis ,maxLines: 1 ,style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold)),
                                SizedBox(height: 3,),
                                Text('${cubit.UserData?.data?.email}',overflow: TextOverflow.ellipsis ,maxLines: 1 ,style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold)),
                                Text('${cubit.UserData?.data?.phone}',overflow: TextOverflow.ellipsis ,maxLines: 1 ,style: TextStyle(fontSize: 15 ,fontWeight: FontWeight.bold)),
                                SizedBox(height: 3,),
                                Container(
                                  height: 25,
                                  width: 80,

                                  child: TextButton(onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => UptatePage(),));
                                  },
                                      child: Text ('Edit..',style:TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold)),
                                    style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size.fromWidth(50)),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))),


                                  ),
                                )
                              ],
                            ),
                          ),

                        ] ),
                      stretchModes: [
                        StretchMode.blurBackground,
                      ],

                    ),


                  ),

                    SliverToBoxAdapter(
                    child: Column(
                      children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(color: Colors.grey ,blurRadius: 18,blurStyle: BlurStyle.solid ,spreadRadius: 0)],
                            borderRadius: BorderRadius.circular(15)
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Icon(CupertinoIcons.moon_fill),
                              SizedBox(width: 30,),
                              Text('Thems Mood'),
                              Spacer(),
                              IconButton(onPressed: () {

                              }, icon: Icon(Icons.present_to_all_sharp))
                            ]),
                          ),
                        ),
                      ),
                        Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey ,blurRadius: 18,blurStyle: BlurStyle.solid ,spreadRadius: 0)],
                            borderRadius: BorderRadius.circular(15)
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Icon(Icons.person),
                              SizedBox(width: 30,),
                              Text('About Us'),
                              Spacer(),
                              IconButton(onPressed: () {

                              }, icon: Icon(Icons.arrow_forward_ios))
                            ]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(color: Colors.redAccent ,blurRadius: 18,blurStyle: BlurStyle.solid ,spreadRadius: 0)],
                            borderRadius: BorderRadius.circular(15)
                          ),

                          child:  Container(
                              width: double.infinity,
                              child: SignOutbottom(namebottom:'signOut' ,context:context )),
                        ),
                      ),




                      ],)
                    )



          ],
              ),
            ),

          );
        },
      ),
  );
  }
}




