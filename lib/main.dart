import 'package:flutter/material.dart';
import 'package:shop/pages/MainPage.dart';
import 'package:shop/pages/login.dart';
import 'package:shop/pages/onboarding.dart';
import 'Dio_Network/Dio helper.dart';
import 'Dio_Network/cash_save.dart';
import 'components/component.dart';
String? token;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await DioHelper.init();
 await CashSaver.init();

 Widget widget;
  bool? onboarding = CashSaver.getData(key: 'OnBoarding');
  token = CashSaver.getData(key: 'token');

  if (onboarding != null )
    {
      if (token != null )
        {widget = MainPage();}
      else
        {widget = login();}
    }
  else
    {
      widget = OnBoarding();
    }

  runApp( MyApp(StartWidget: widget,));
}



class MyApp extends StatelessWidget {
   MyApp({ this.StartWidget });

  final Widget? StartWidget;

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartWidget,
      theme: lightthem,
    );

  }


}


