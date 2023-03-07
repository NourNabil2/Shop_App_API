import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

import '../Dio_Network/cash_save.dart';
import '../components/component.dart';

import '../cubit/shop_register_cubit.dart';
import 'MainPage.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);




  @override
  State<Register> createState() => _loginState();
}
var key = GlobalKey<FormState>();
var emailcontroller = TextEditingController();
var passwaordcontroller = TextEditingController();
var namecontroller = TextEditingController();
var phonecontroller = TextEditingController();
class _loginState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: ( context) => ShopRegisterCubit(),
        child:BlocConsumer<ShopRegisterCubit, ShopRegisterState>(
          listener: (context, state) {
            if (state is RegisterEnterState )
            {
              if(state.registerData.status == true )
              {
                FlutterToastr.show('${state.registerData.message}', context, duration: FlutterToastr.lengthLong, backgroundColor: Colors.green,position: FlutterToastr.bottom);

                CashSaver.SaveData(key: 'token', value: state.registerData.data?.token ).then((value)
                {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPage(),), (Route<dynamic>route) => false);
                  emailcontroller.clear();
                  namecontroller.clear();
                  passwaordcontroller.clear();
                  phonecontroller.clear();

                });
              }
              else
              {
                FlutterToastr.show('${state.registerData.message}', context, duration: FlutterToastr.lengthLong,backgroundColor: Colors.redAccent ,position:  FlutterToastr.bottom);
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
                  child: Expanded(
                    child: Column(

                        children: [
                          Expanded(child: Text('Register' , style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                          SizedBox(height: 100.0,),
                          defaultFormField(controller: namecontroller, autofocus: true ,type: TextInputType.name, lable: 'Name', icon: Icons.person, onChange: null,onFieldSubmitted: null,
                            valid:  (value)
                            {
                              if (value.isEmpty)
                              {
                                return ('Name must not be empty !!');
                              }
                              return null;
                            },
                          ),
                          Expanded(child: SizedBox(height: 10.0,)),
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
                          Expanded(child: SizedBox(height: 10.0,)),
                          defaultFormField(controller: phonecontroller, autofocus: true ,type: TextInputType.phone, lable: 'phone', icon: Icons.phone, onChange: null,onFieldSubmitted: null,
                            valid:  (value)
                            {
                              if (value.isEmpty)
                              {
                                return ('Phone must not be empty !!');
                              }
                              return null;
                            },
                          ),
                          Expanded(child: SizedBox(height: 10.0,)),
                          defaultFormField(controller: passwaordcontroller, type: TextInputType.visiblePassword, lable: 'Password', icon: Icons.lock ,icon2: ShopRegisterCubit.get(context).suffix ,onChange: null, onFieldSubmitted:  (value){if(key.currentState!.validate())
                          {
                            ShopRegisterCubit.get(context).userRegister(email: emailcontroller.text, password: passwaordcontroller.text, name: namecontroller.text, phone: phonecontroller.text);
                          }
                          },
                            obscureText: ShopRegisterCubit.get(context).passowrdhiddin,
                            onPressedsuffixIcon:  (){ShopRegisterCubit.get(context).Passwordhidden();},
                            valid:  (value)
                            {
                              if (value.isEmpty)
                              {
                                return ('Password must not be empty !!');
                              }
                              return null;
                            },

                          ),


















                          Expanded(child: SizedBox(height: 50.0,)),

                          Row(children: [
                            Expanded(child:

                            state is! RegisterLoadingState ? TextButton(onPressed: (){
                              if(key.currentState!.validate())
                              {
                                ShopRegisterCubit.get(context).userRegister(email: emailcontroller.text, password: passwaordcontroller.text, name: namecontroller.text, phone: phonecontroller.text);

                              }

                            } , child: Text('Register',style: TextStyle(color: Colors.white , fontWeight: FontWeight.w700 ,fontSize: 18 ),))
                                :  Center(child: CircularProgressIndicator(color: Colors.deepPurpleAccent)),


                            ) ,

                          ],),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Do have an account?'),
                                TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Login NOW',style: TextStyle(color: Colors.purple,backgroundColor: Colors.transparent),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),)
                              ],
                            ),
                          )









                        ]),
                  ),
                ),
              ),
            );
          },
        ),
      );




  }
}
