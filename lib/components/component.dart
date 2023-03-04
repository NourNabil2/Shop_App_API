import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

import '../Dio_Network/cash_save.dart';
import '../pages/login.dart';


Widget defaultFormField (
    {

      @required controller,
      required TextInputType type ,
      required String lable,
      required IconData icon ,
      required onChange,
      required onFieldSubmitted ,
      required  valid ,
      IconData? icon2,
      press,
      ontap  ,
      onSubmitted,
      obscureText = false ,
      onPressedsuffixIcon ,
      autofocus = false ,
    })=> Container(


  color: Colors.white,

  child:   TextFormField(

    autofocus: autofocus ,

    style: TextStyle(color: Colors.black),

    validator: valid,

    cursorColor: Colors.deepPurpleAccent,
    onEditingComplete :onSubmitted,

    controller: controller,

    keyboardType: type ,

    onFieldSubmitted: onFieldSubmitted ,

    onChanged: onChange ,

    onTap: ontap ,

    obscureText: obscureText ,

    decoration:

    InputDecoration(

      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple , width: 1.5)),
      prefixIcon: Icon( icon ,  color: Colors.black,) ,

      suffixIcon: IconButton( icon: Icon(icon2 ,  color: Colors.black,) , onPressed: onPressedsuffixIcon , ),

      hintText: lable,
      border: OutlineInputBorder(),
    ) ,


  ),
);


Widget SignOutbottom(
{
   required String namebottom,
required context,
}
)
{

  return TextButton(onPressed: () {
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => login(),), (
        Route<dynamic>route) => false);
    CashSaver.Cleardata(key: 'token');
    FlutterToastr.show('Signed out successfully', context,
        duration: FlutterToastr.lengthLong,
        backgroundColor: Colors.green,
        position: FlutterToastr.bottom);
  } , style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),backgroundColor: MaterialStatePropertyAll(Colors.redAccent),fixedSize: MaterialStatePropertyAll(Size.fromHeight(50))),
      child: Row(children: [
        Icon(Icons.exit_to_app,color: Colors.black),
        SizedBox(width: 30,),
      Text(namebottom,style: TextStyle(color: Colors.white , fontWeight: FontWeight.w700 ,fontSize: 18 ) ),
        Spacer(),

      ]));


}


ThemeData lightthem = ThemeData(
  backgroundColor: Colors.yellow,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(systemNavigationBarColor: Colors.grey[500] , ),
    elevation: 0.0,

    titleTextStyle: TextStyle(color: Colors.black),
  ),
  textButtonTheme: TextButtonThemeData( style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blueAccent ,) )),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blueAccent
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.black87,
    backgroundColor: Colors.grey[100],

  ),
  hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
);

ThemeData darkthem = ThemeData(
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(systemNavigationBarColor: Colors.white60 , ),
    elevation: 0.0,
    titleTextStyle: TextStyle(color: Colors.black),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white60,
    backgroundColor: Colors.grey[100],

  ),
);

Widget EmptyImage(String Name)
{
return  Column(
  mainAxisAlignment:MainAxisAlignment.center,
  children: [
    Center(child: Image(image: AssetImage('assets/empty.gif') ,width: 250 ,)),
    Text('${Name}',style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold ,color: Colors.grey),)
  ],
);
}