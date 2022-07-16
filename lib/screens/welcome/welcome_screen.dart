import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:k53_all_tests/constants.dart';
import 'package:k53_all_tests/screens/quiz/quiz_screen.dart';
import 'package:k53_all_tests/screens/welcome/practicetest.dart';
import 'package:k53_all_tests/screens/welcome/realtest.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isClicked = false;
  int count =1;
  void darkMode(){
   setState(() {
     count++;
     if(count%2==0){
       isClicked = true;
     }else{
       isClicked = false;
     }
     if(count>2){
       count = 1;
     }
   });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: isClicked ?  ThemeData.dark() :ThemeData.light() ,
      home: Scaffold(
        backgroundColor: isClicked ? Colors.blueGrey : Colors.white ,
        appBar: AppBar(
          backgroundColor: isClicked ? Colors.blueGrey : Colors.white ,
          title:  Text(''),
          actions: [
            Row(
              children: [
                Container(
                  width: 90,
                  height: 35,
                  child: RaisedButton(
                    color: isClicked ? Colors.blueGrey : Colors.white ,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: isClicked ? MainAxisAlignment.start : MainAxisAlignment.end,
                      children: [
                        Icon(
                          isClicked ? Icons.nightlight_round : Icons.light_mode,
                          color: isClicked ? Colors.white : Colors.deepOrange,
                        )
                      ],
                    ),
                    onPressed: (){
                      setState(() {
                        darkMode();
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Stack(
          children: [
            //SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 2), //2/6
                  /*IconButton(
                    color: isClicked ? Colors.deepOrange : Colors.black54 ,
                    icon: isClicked ? Icon(Icons.light_mode): Icon(Icons.nightlight_round),
                    onPressed: (){
                      setState(() {
                        darkMode();
                      });
                    },
                  ),*/
                  SizedBox(height: 5,),
                  /*Container(
                    width: 90,
                    child: RaisedButton(
                      color: isClicked ? Colors.black12 : Colors.white ,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: isClicked ? MainAxisAlignment.start : MainAxisAlignment.end,
                        children: [
                          Icon(
                            isClicked ? Icons.nightlight_round : Icons.light_mode,
                            color: isClicked ? Colors.white : Colors.deepOrange,
                          )
                        ],
                      ),
                      onPressed: (){
                        setState(() {
                          darkMode();
                        });
                      },
                    ),
                  ),*/
                  Text(
                    "K53 Test",
                    style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.deepOrange,fontStyle: FontStyle.italic, ),/*Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.deepOrange,),//isClicked ? Colors.white : Colors.deepOrange, fontWeight: FontWeight.bold),*/
                  ),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () => Get.to(() => PracticeTest(isClicked: isClicked,),),//Get.to(PracticeTest(isClicked: isClicked,)),//Get.to(QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Practice Test",
                        style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: isClicked ? Colors.blueGrey : Colors.white, ),
                        /*Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: isClicked ? Colors.teal : Colors.white),*/
                      ),
                    ),
                  ),
                  // Spacer(), // 1/6
                  SizedBox(height: 20,),
                  /*InkWell(
                    onTap: () => Get.to(() => RealTest(isClicked: isClicked,),),//Get.to(RealTest()),//Get.to(QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Real Test",
                        style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: isClicked ? Colors.blueGrey : Colors.white, ),
                      ),
                    ),
                  ),*/
                  Spacer(flex: 2), // it will take 2/6 spaces

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

