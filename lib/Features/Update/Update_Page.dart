import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:shop/Features/Auth/View_Model/login%20cubit/shop_login_state.dart';

import '../../Core/widgets/component.dart';
import '../Auth/View_Model/login cubit/shop_login_cubit.dart';


class UptatePage extends StatelessWidget {
  const UptatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var name = TextEditingController();
    var phone = TextEditingController();
    var email = TextEditingController();
    var password = TextEditingController();

    return BlocProvider(
        create: (BuildContext context) =>  ShopLoginCubit()..GetProfile(),
    child:BlocConsumer<ShopLoginCubit, ShopLoginState>(
      listener: (context, state) {
if (state is ProfileState)
  {
    name.text =state.s.data!.name! ;
    phone.text =state.s.data!.phone!;
    email.text =state.s.data!.email!;
  }

if (state is UpdataEnterState)
  {
    FlutterToastr.show('${state.logindata.message}', context,duration: FlutterToastr.lengthLong, backgroundColor: Colors.green,position: FlutterToastr.bottom);
  }





      },
      builder: (context, state) {
        ShopLoginCubit cubit = ShopLoginCubit.get(context);
        return cubit.UserData != null ?  Scaffold(
          appBar: AppBar(title: Text('Edit Profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  Expanded(child: SizedBox(height: 20,)),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
              backgroundImage: NetworkImage(
              '${cubit.UserData?.data?.image }'), maxRadius: 50),
                      Container(
                        width: 35,height: 35,
                        decoration: BoxDecoration(color: Colors.grey[400],borderRadius: BorderRadius.circular(50)),
                          child: IconButton(onPressed: (){}, icon: Icon(Icons.edit ,) ,iconSize: 20,color: Colors.white,))


                    ]
                  ),
                  Expanded(child: SizedBox(height: 20,)),
                  defaultFormField(
                    controller: name,
                      type: TextInputType.name,
                      lable: 'Name',
                      icon: Icons.drive_file_rename_outline,
                      onChange: null,
                      onFieldSubmitted: null,
                    valid:  (value)
                    {
                      if (value.isEmpty)
                      {
                        return ('Email must not be empty !!');
                      }
                      return null;
                    },),
                  Expanded(child: SizedBox(height: 20,)),
                  defaultFormField(controller: email,
                      type: TextInputType.emailAddress,
                      lable: 'Email',
                      icon: Icons.email_rounded,
                      onChange: null,
                      onFieldSubmitted: null,
                    valid:  (value)
                    {
                      if (value.isEmpty)
                      {
                        return ('Email must not be empty !!');
                      }
                      return null;
                    },
                  ),
                  Expanded(child: SizedBox(height: 20,)),
                  defaultFormField(controller: phone,
                      type: TextInputType.phone,
                      lable: 'Phone Number',
                      icon: CupertinoIcons.phone,
                      onChange:null,
                      onFieldSubmitted: null,
                    valid:  (value)
                    {
                      if (value.isEmpty)
                      {
                        return ('Email must not be empty !!');
                      }
                      return null;
                    },),
                  Expanded(child: SizedBox(height: 20,)),
                  defaultFormField(controller: password,
                      type: TextInputType.visiblePassword,
                      lable: 'Password',
                      icon: CupertinoIcons.padlock_solid,
                      onChange: null,
                      onFieldSubmitted: null,
                    valid:  (value)
                    {
                      if (value.isEmpty)
                      {
                        return ('password must enter !!');
                      }
                      return null;
                    },),
                  Expanded(child: SizedBox(height: 20,)),

              MaterialButton(
                onPressed: () {
                      if (formKey.currentState!.validate())
                        {
                          cubit.UpdataProfile(name: name.text, email: email.text, phone: phone.text, password: password.text);
                        }
                  },
                child: Container(
                  decoration: BoxDecoration(color: Colors.purple,borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Icon(Icons.edit_outlined,color: Colors.white),
                      SizedBox(width: 5,),
                      Text('Edit',style: TextStyle(color: Colors.white,fontSize: 18 ,fontWeight: FontWeight.bold)),
                  ])

          ),
                ),
              )
                ],
              ),
            ),
          ),







        ) : Center(child: CircularProgressIndicator(color: Colors.purple,));
      }));
  }
  }

