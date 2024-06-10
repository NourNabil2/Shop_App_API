import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Features/Auth/View/login.dart';
import '../Netawork/Dio_Network/cash_save.dart';
var boarderController = PageController();
final Color kDarkBlueColor = Color(0xFF053149);

class boardingModel {

  late final String image;
  late final String title;
  late final String body;

  boardingModel({
    required this.image,
    required this.title,
    required this.body,

  });

}



class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();

}

class _OnBoardingState extends State<OnBoarding> {
  List<boardingModel> boarding = [
    boardingModel(image: 'assets/1.png', title: 'on board 1 shop app', body: 'body shop app'),
    boardingModel(image: 'assets/2.png', title: 'on board 2 shop app', body: 'body shop app'),
    boardingModel(image: 'assets/3.png', title: 'on board 3 shop app', body: 'body shop app'),

  ];
@override

void initState() {

  // TODO: implement initState
  super.initState();
}
void skipTOlogin() {

    CashSaver.SaveData(key: 'OnBoarding', value: true ).then(
            (value) {
      if (value) Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => login(),), (Route<dynamic>route) => false);
    }

    );

  }

  var last = false ;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            skipTOlogin();

          }, child: Text('LOGIN',style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold)),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),)
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => onBoarding(boarding[index]),
                onPageChanged: (value) {
                  if (value == boarding.length -1)
                    {
                      setState(() {
                        last = true;
                      });

                    }
                },
                scrollBehavior: CupertinoScrollBehavior(),
                physics: BouncingScrollPhysics(),
                controller: boarderController,
                itemCount: boarding.length,
              ),
            ),
            Row(
              children: [
              SmoothPageIndicator(controller: boarderController, count: boarding.length,effect: ExpandingDotsEffect(dotColor: Colors.grey , expansionFactor: 2 ,), onDotClicked: (index) {
                boarderController.jumpToPage(index);
              }, ),
                Spacer(),
                FloatingActionButton(onPressed: () {
                  if ( last )
                    {
                      skipTOlogin();
                    }
                  else
                    {
                      boarderController.nextPage(duration: Duration(milliseconds: 750), curve: Curves.linearToEaseOut);
                    }

                  }, splashColor: Colors.purple[900],child: Icon(Icons.arrow_forward_ios , color: Colors.white), ),


            ],)
          ],
        ),
      ),

    );

  }
}
Widget onBoarding(boardingModel model) => Column(
  children: [
    Expanded(child: Image(image: AssetImage('${model.image}'))),
    SizedBox(height: 15,),
    Text('${model.title}' , style: TextStyle(fontSize: 24, color: CupertinoColors.black , ),),
    SizedBox(height: 5,),
    Text('${model.body}' , style: TextStyle(fontSize: 14, color: CupertinoColors.black , ),),
  ],
) ;

// OnBoardingSlider (
// finishButtonText: 'Register',
// onFinish: () {
// Navigator.pushAndRemoveUntil(context,
// MaterialPageRoute(builder:  (context) => games(),),
// (route) {
// return false ;
// },
// );
// },
// finishButtonColor: kDarkBlueColor,
// skipTextButton: Text(
// 'Skip',
// style: TextStyle(
// fontSize: 16,
// color: kDarkBlueColor,
// fontWeight: FontWeight.w600,
// ),
// ),
// trailing: Text(
// 'Login',
// style: TextStyle(
// fontSize: 16,
// color: kDarkBlueColor,
// fontWeight: FontWeight.w600,
// ),
// ),
// trailingFunction: () {
// Navigator.pushAndRemoveUntil(context,
// MaterialPageRoute(builder:  (context) => login(),),
// (route) {
// return false ;
// },
// );
// },
// controllerColor: kDarkBlueColor,
// totalPage: 3,
// headerBackgroundColor: Colors.white,
// pageBackgroundColor: Colors.white,
// background: [
// Image.asset(
// 'assets/1.png',
// height: 400,
// ),
// Image.asset(
// 'assets/2.png',
// height: 400,
// ),
// Image.asset(
// 'assets/3.png',
// height: 400,
// ),
// ],
// speed: 1.8,
// pageBodies: [
// Container(
// padding: EdgeInsets.symmetric(horizontal: 40),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: <Widget>[
// SizedBox(
// height: 480,
// ),
// Text(
// 'On your way...',
// textAlign: TextAlign.center,
// style: TextStyle(
// color: kDarkBlueColor,
// fontSize: 24.0,
// fontWeight: FontWeight.w600,
// ),
// ),
// SizedBox(
// height: 20,
// ),
// Text(
// 'to find the perfect looking Onboarding for your app?',
// textAlign: TextAlign.center,
// style: TextStyle(
// color: Colors.black26,
// fontSize: 18.0,
// fontWeight: FontWeight.w600,
// ),
// ),
// ],
// ),
// ),
// Container(
// padding: EdgeInsets.symmetric(horizontal: 40),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: <Widget>[
// SizedBox(
// height: 480,
// ),
// Text(
// 'You’ve reached your destination.',
// textAlign: TextAlign.center,
// style: TextStyle(
// color: kDarkBlueColor,
// fontSize: 24.0,
// fontWeight: FontWeight.w600,
// ),
// ),
// SizedBox(
// height: 20,
// ),
// Text(
// 'Sliding with animation',
// textAlign: TextAlign.center,
// style: TextStyle(
// color: Colors.black26,
// fontSize: 18.0,
// fontWeight: FontWeight.w600,
// ),
// ),
// ],
// ),
// ),
// Container(
// padding: EdgeInsets.symmetric(horizontal: 40),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: <Widget>[
// SizedBox(
// height: 480,
// ),
// Text(
// 'Start now!',
// textAlign: TextAlign.center,
// style: TextStyle(
// color: kDarkBlueColor,
// fontSize: 24.0,
// fontWeight: FontWeight.w600,
// ),
// ),
// SizedBox(
// height: 20,
// ),
// Text(
// 'Where everything is possible and customize your onboarding.',
// textAlign: TextAlign.center,
// style: TextStyle(
// color: Colors.black26,
// fontSize: 18.0,
// fontWeight: FontWeight.w600,
// ),
// ),
// ],
// ),
// ),
// ],
// );