import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import '../../../Core/Netawork/Dio_Network/cash_save.dart';
import '../../../Core/widgets/component.dart';
import '../View_Model/login cubit/shop_login_cubit.dart';
import '../../../main.dart';
import '../../main page/view/MainPage.dart';
import '../View_Model/login cubit/shop_login_state.dart';
import 'RegisterPage.dart';


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
        create: ( context) => ShopLoginCubit(),
        child:BlocConsumer<ShopLoginCubit, ShopLoginState>(
          listener: (context, state) {
            if (state is LoginEnterState )
              {
                if(state.logindata.status == true )
              {
                print('${state.logindata.message}');
              FlutterToastr.show('${state.logindata.message}', context, duration: FlutterToastr.lengthLong, backgroundColor: Colors.green,position: FlutterToastr.bottom);
              CashSaver.SaveData(key: 'token', value: state.logindata.data?.token ).then((value)
              {
                token = state.logindata.data?.token;
                print('${state.logindata.message}');
                print(state.logindata.data?.token);
                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPage(),), (Route<dynamic>route) => false);
                passwaordcontroller.clear();

              }
              );


                  }
                else
                  {
                    FlutterToastr.show('${state.logindata.message}', context, duration: FlutterToastr.lengthLong,backgroundColor: Colors.redAccent ,position:  FlutterToastr.bottom);
                    print(state.logindata.message);
                    print('asdasdasd??');
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

                         state is! LoginLoadingState ? TextButton(onPressed: (){
                            if(key.currentState!.validate())
                              {
                                ShopLoginCubit.get(context).userLogin(email: emailcontroller.text, password: passwaordcontroller.text);

                              }

                         } , child: Text('LOGIN',style: TextStyle(color: Colors.white , fontWeight: FontWeight.w700 ,fontSize: 18 ),))
                             :  Center(child: CircularProgressIndicator(color: Colors.deepPurpleAccent)),


                          ) ,

                        ],),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account?'),
                              TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Register(),));}, child: Text('REGISTER NOW',style: TextStyle(color: Colors.purple,backgroundColor: Colors.transparent),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),)
                            ],
                          ),
                        )









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
