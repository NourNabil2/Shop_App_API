import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/component.dart';
import '../cubit/shop_login_cubit.dart';
import '../cubit/shop_login_state.dart';

class UptatePage extends StatelessWidget {
  const UptatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = TextEditingController();
    var phone = TextEditingController();
    var email = TextEditingController();
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

      },
      builder: (context, state) {
        ShopLoginCubit cubit = ShopLoginCubit.get(context);

        return cubit.UserData != null ?  Scaffold(
          appBar: AppBar(title: Text('Edit Profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                SizedBox(height: 20,),
                defaultFormField(
                  controller: name,
                    type: TextInputType.name,
                    lable: 'Name',
                    icon: Icons.drive_file_rename_outline,
                    onChange: (value) {},
                    onFieldSubmitted: (value) {},
                  valid:  (value)
                  {
                    if (value.isEmpty)
                    {
                      return ('Email must not be empty !!');
                    }
                    return null;
                  },),
                SizedBox(height: 20,),
                defaultFormField(controller: email,
                    type: TextInputType.emailAddress,
                    lable: 'Email',
                    icon: Icons.email_rounded,
                    onChange: (value) {},
                    onFieldSubmitted: (value) {},
                  valid:  (value)
                  {
                    if (value.isEmpty)
                    {
                      return ('Email must not be empty !!');
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                defaultFormField(controller: phone,
                    type: TextInputType.phone,
                    lable: 'Phone Number',
                    icon: CupertinoIcons.phone,
                    onChange: (value) {},
                    onFieldSubmitted: (value) {},
                  valid:  (value)
                  {
                    if (value.isEmpty)
                    {
                      return ('Email must not be empty !!');
                    }
                    return null;
                  },),
                SizedBox(height: 20,),
            Container(
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
            )
              ],
            ),
          ),







        ) : Center(child: CircularProgressIndicator(color: Colors.purple,));
      }));
  }
  }

