import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_toastr/flutter_toastr.dart';

import '../Dio_Network/cash_save.dart';
import '../components/Model_login.dart';
import '../components/component.dart';
import '../cubit/shop_login_cubit.dart';
import '../cubit/shop_login_state.dart';
import 'MainPage.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);




  @override
  State<login> createState() => _loginState();
}
var key = GlobalKey<FormState>();
var emailcontroller = TextEditingController();
var passwaordcontroller = TextEditingController();
class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightthem,
      home: BlocProvider(
        create: (BuildContext context) => ShopLoginCubit(),
        child:BlocConsumer<ShopLoginCubit, ShopLoginState>(
          listener: (context, state) {
            if (state is LoginEnterState )
              {
                if(state.logindata.status == true )
              {
                print('aasdasdasdasd 2 token :');
                print('');
              FlutterToastr.show('${state.logindata.message}', context, duration: FlutterToastr.lengthLong, backgroundColor: Colors.green,position: FlutterToastr.bottom);
              CashSaver.SaveData(key: 'token', value: state.logindata.data?.token ).then((value)
              {
                print('aasdasdasdasd token :');
                print(state.logindata.data?.token);
                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPage(),), (Route<dynamic>route) => false);
                passwaordcontroller.clear();

              }
              );


                  }
                else
                  {
                    FlutterToastr.show('${state.logindata.message}', context, duration: FlutterToastr.lengthLong,backgroundColor: Colors.redAccent ,position:  FlutterToastr.bottom);
                  }
              }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: key ,
                  child: Column(

                      children: [
                        Text('Login' , style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        SizedBox(height: 100.0,),
                        defaultFormField(controller: emailcontroller, autofocus: true ,type: TextInputType.emailAddress, lable: 'Email', icon: Icons.email_outlined, onChange: null,onFieldSubmitted: null,
                          valid:  (value)
                          {
                            if (value.isEmpty)
                            {
                              return ('Email must not be empty !!');
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.0,),
                        defaultFormField(controller: passwaordcontroller, type: TextInputType.visiblePassword, lable: 'Password', icon: Icons.lock ,icon2: ShopLoginCubit.get(context).suffix ,onChange: null, onFieldSubmitted:  (value){if(key.currentState!.validate())
                        {
                          ShopLoginCubit.get(context).userLogin(email: emailcontroller.text, password: passwaordcontroller.text);
                        }
                        },
                          obscureText: ShopLoginCubit.get(context).passowrdhiddin,
                          onPressedsuffixIcon:  (){ShopLoginCubit.get(context).Passwordhidden();},
                          valid:  (value)
                          {
                            if (value.isEmpty)
                            {
                              return ('Password must not be empty !!');
                            }
                            return null;
                          },

                        ),
                        SizedBox(height: 50.0,),
                        Row(children: [
                          Expanded(child:

                         state is! LoginLoadingState ? Mainbottom(onpress: (){
                            if(key.currentState!.validate())
                              {
                                ShopLoginCubit.get(context).userLogin(email: emailcontroller.text, password: passwaordcontroller.text);

                              }

                         } , namebottom: 'LOGIN') :  Center(child: CircularProgressIndicator(color: Colors.deepPurpleAccent)),


                          ) ,

                        ],)







                      ]),
                ),
              ),
            );
          },
        ),
      )
        ,



    );
  }
}
