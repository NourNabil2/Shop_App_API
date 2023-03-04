import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubits.dart';
import '../cubit/states.dart';


class MainPage extends StatelessWidget
{

  @override

  Widget build(BuildContext context) {

    return BlocProvider(
        create: (context) =>  NewsCubit()..getallCategories()..getAllData()..getallFAV(),
        child: BlocConsumer<NewsCubit, NewStates>
        (
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);

          return Scaffold(
            bottomNavigationBar:Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 10 ),
          ],
          ),
          child: ClipRRect(
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          ),
          child: BottomAppBar(
              shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          clipBehavior: Clip.antiAlias,
          child: Container(
          height: kBottomNavigationBarHeight,
          child: Container(
          decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
          top: BorderSide(
          color: Colors.grey,
          width: 0.5,
          ),
          ),
          ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: cubit.Bottomsheet ,
              currentIndex: cubit.current,
              onTap: (index) {
                cubit.ChangePage(index);
              },
            ),
          ),),),),),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(boxShadow:[
                  BoxShadow(color: cubit.current==2 ? Colors.deepPurple : Colors.grey , spreadRadius: -5, blurRadius: 18 ),
                ], ),
                child: FloatingActionButton(
                  backgroundColor: cubit.current==2 ?  Colors.deepPurpleAccent : Colors.grey ,
                  child: Icon(Icons.home ,),
                  onPressed: () {
                    cubit.ChangePage(2);

                  }),
              ),
              ),
            body: cubit.pages[cubit.current],

          );
        },
      ),
    );


  }

}
