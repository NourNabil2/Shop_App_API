import 'package:flutter/material.dart';
import 'Core/Netawork/Dio_Network/Dio helper.dart';
import 'Core/Netawork/Dio_Network/cash_save.dart';
import 'Core/Utilts/onboarding.dart';
import 'Core/widgets/component.dart';
import 'Features/Auth/View/login.dart';
import 'Features/main page/view/MainPage.dart';
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
        {widget = MainPage();
        print('sadsadasd asd asd  $token ');}
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


