import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:k53_all_tests/basic/optionwidget.dart';
import 'package:k53_all_tests/basic/questions.dart';
import 'package:k53_all_tests/basic/questionwidget.dart';
import 'package:k53_all_tests/basic/resultpage.dart';
import 'package:k53_all_tests/screens/welcome/welcome_screen.dart';

import '../../constants.dart';

class PracticeTest extends StatefulWidget {
  final bool isClicked;
  const PracticeTest({Key? key,required this.isClicked}) : super(key: key);

  @override
  State<PracticeTest> createState() => _PracticeTestState(isClicked);
}

class _PracticeTestState extends State<PracticeTest> {
  final bool isClicked;
  _PracticeTestState(this.isClicked);
  bool sound = true;
  int a = 0;
  void changeSound(){
   setState(() {
     a++;
     if(a%2==0){
       sound = true;
     }else if(a%2!=0){
       sound = false;
     }
     if(a>2){
       a=1;
     }
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isClicked ? Colors.blueGrey : Colors.white,
      appBar: AppBar(
      leading: IconButton(
        icon:Icon(Icons.arrow_back_ios,color: Colors.deepOrange,size: 30,),
        onPressed: (){
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  WelcomeScreen()),//*****************************problem
            );
          });
        },
      ),
        backgroundColor: isClicked ? Colors.blueGrey : Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sound',style: TextStyle(color: isClicked ? Colors.white:Colors.orange,fontSize: 27,fontWeight: FontWeight.bold),),
                SizedBox(width: 10,),
                Container(
                  width: 110,
                  height: 49,
                  child: RaisedButton(
                    color: isClicked ? Colors.white : Colors.white60,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: sound ? MainAxisAlignment.end : MainAxisAlignment.start ,
                      children: [
                        sound ? Text('ON',style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),) :SizedBox.shrink(),
                        sound ? SizedBox(width: 5,) : SizedBox.shrink(),
                        Icon(
                          sound ? Icons.check_circle : Icons.cancel ,
                          color: sound ? Colors.green : Colors.red ,
                          size: 34,
                        ),
                        sound ? SizedBox.shrink() : SizedBox(width: 5,),
                        sound ? SizedBox.shrink() : Text('OFF',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    onPressed: (){
                      setState(() {
                        changeSound();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Image.asset(
              'funny/no_st.jpg',
              fit: BoxFit.cover,
              //scale: 1,
            ),
            SizedBox(height: 25,),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Scaffold(body: QuestionWidget(isClicked: isClicked,sound: sound,),)),//*****************************problem
                );
              },
              child: Container(
                //width: double.maxFinite,
                width: 300,
                alignment: Alignment.center,
                padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                decoration: BoxDecoration(
                  gradient: kPrimaryGradient,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Text(
                  'Start Practice',
                  style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: isClicked ? Colors.blueGrey : Colors.white, ),
                  /*Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: isClicked ? Colors.teal : Colors.white),*/
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
