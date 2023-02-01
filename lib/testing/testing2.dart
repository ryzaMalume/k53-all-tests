import 'package:flutter/material.dart';
import 'package:k53_all_tests/screens/welcome/welcome_screen.dart';
import 'package:k53_all_tests/testing/testing_appbar.dart';
import 'package:k53_all_tests/testing/testing_lists.dart';
import 'package:k53_all_tests/testing/testing_results.dart';
import 'package:provider/provider.dart';

import '../providers/darkmode_provider.dart';

class TestingQuiz extends StatefulWidget {
  const TestingQuiz({Key? key}) : super(key: key);

  @override
  State<TestingQuiz> createState() => _TestingQuizState();
}

class _TestingQuizState extends State<TestingQuiz> {
  bool pressed = false;
  // List<String> chooseList = [
  //   "1. switch on head lamp",
  //   "2. speed up",
  //   "3. turn right",
  // ];
  // List<String> answerList = [
  //   "1. switch on head lamp",
  //   "2. speed up",
  //   "3. turn right",
  // ];
  //Map<String, bool> answers1 = {"1. switch on head lamp":true};

  late int pressedIndex;
  int n=0;
  int k =0;
  int picCount = 1;
  int nCount = 0;
  int score = 0;
  int page = 1;

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    Color? nightCol = Colors.blueGrey[900];
    // Obtain the provider
    final darkMode = Provider.of<DarkThemeProvider>(context);

    // getting the value from the provider instance
    final isDark = darkMode.isDark;
    return Scaffold(
      backgroundColor: isDark ? nightCol : Colors.white,
      appBar: PreferredSize(
        child: testingAppBar(myWidth: myWidth, myHeight: myHeight, page: page, totalPages: answers.length-1, score: score,context: context),
        preferredSize: Size(60.0,60.0),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: myHeight-370,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      Container(
                        height: myHeight-450,
                        child: Image(
                          image: AssetImage("pics/${index+picCount}.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("${questions[index+k]}",style: TextStyle(fontSize: 20,color: isDark ? Colors.white : Colors.blueGrey),),
                    ],
                  );
                },
              ),
            ),
            Container(
              height: myHeight-360,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context,index){
                  return GestureDetector(
                    child: answer(myWidth,myHeight,answers[index+n].keys.first,answers[index+n].values.first,index),
                    onTap: (){
                      setState(() {
                        pressed = true;
                        pressedIndex = index;
                        print(pressedIndex);
                        if(answers[index+n].values.first==true){
                          score = score +1;
                        }
                        // print(answers[index].keys.first);
                        // print(answers[index].values.first);
                      });
                    },
                  );
                },
              ),
            ),
            if(pressed) n+4-1 != answers.length-1  ? Row(
              children: [
                GestureDetector(
                  child:   Container(
                    width: myWidth-230,
                    height: 50,
                    padding: EdgeInsets.all(3),
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete_forever,color: Colors.red,),
                        Text("Quit",style: TextStyle(fontSize: 17,color:Colors.red),),
                      ],
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>WelcomeScreen()));
                    });
                  },
                ), Spacer(),
                GestureDetector(
                child:   Container(
                  width: myWidth-230,
                  height: 50,
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.green,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Next",style: TextStyle(fontSize: 17,color:Colors.white),),
                      Icon(Icons.double_arrow,color: Colors.white,)
                    ],
                  ),
                ),
                onTap: (){
                  setState(() {
                    n=n+4;
                    k=k+1;
                    picCount = picCount + 1;
                    page = page +1;
                    nCount = nCount + n;
                    pressed=false;
                    //if(n+3-1 == answers.length-1)  Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>TestingResults()));
                    //pressedIndex=null;
                  });
                },
          ),
              ],
            ):GestureDetector(
            child:   Container(
              width: myWidth-160,
              height: 50,
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.green,
              ),
              child: Center(
                child: Text("Results",style: TextStyle(fontSize: 17,color:Colors.white),),
              ),
            ),
            onTap: (){
              setState(() {
                // n=n+3;
                // nCount = nCount + n;
                // pressed=false;
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>TestingResults(score: score,pages: page,)));
                //if(n+3-1 == answers.length-1)  Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>TestingResults()));
                //pressedIndex=null;
              });
            },
          ),
          ],
        ),
      ),
    );
  }
  Widget answer(double myWidth,double myHeight,String aT,bool myBool,int myIndex){
   if(pressed==true){
     if(myBool){
       /// if Correct
     return  Container(
       width: myWidth-30,
       height: 50,
       padding: EdgeInsets.all(3),
       margin: EdgeInsets.all(3),
       decoration: BoxDecoration(
         border: Border.all(color: Colors.green),
         borderRadius: BorderRadius.all(Radius.circular(10)),
         color: Colors.black12,
       ),
       child: Row(
         children: [
           SizedBox(width: 7,),
           Expanded(child: Text("$aT",style: TextStyle(fontSize: 17,color: Colors.green),maxLines: 5,overflow: TextOverflow.ellipsis,)),
           SizedBox(width: 7,),
           Icon(Icons.check_circle,color:Colors.green,),
         ],
       ),
     );

   }else{
       if(myIndex==pressedIndex){
         /// if Wrong
         return  Container(
           width: myWidth-30,
           height: 50,
           padding: EdgeInsets.all(3),
           margin: EdgeInsets.all(3),
           decoration: BoxDecoration(
             border: Border.all(color: Colors.red),
             borderRadius: BorderRadius.all(Radius.circular(10)),
             color: Colors.black12,
           ),
           child: Row(
             children: [
               SizedBox(width: 7,),
               Expanded(child: Text("$aT",style: TextStyle(fontSize: 17,color: Colors.red),maxLines: 5,overflow: TextOverflow.ellipsis,)),
               SizedBox(width: 7,),
               Icon(Icons.cancel,color: Colors.red,),
             ],
           ),
         );
       }
     }
   }
   /// Default
   return  Container(
     width: myWidth-30,
     height: 50,
     padding: EdgeInsets.all(3),
     margin: EdgeInsets.all(3),
     decoration: BoxDecoration(
       border: Border.all(color: Colors.grey),
       borderRadius: BorderRadius.all(Radius.circular(10)),
       color: Colors.black12,
     ),
     child: Row(
       children: [
         SizedBox(width: 7,),
           Expanded(child: Text("$aT",style: TextStyle(fontSize: 17,color: Colors.grey),maxLines: 5,overflow: TextOverflow.ellipsis,)),
         SizedBox(width: 7,),
         //if(pressed) Icon(myBool ? Icons.check_circle : Icons.cancel,color: myBool ? Colors.green : Colors.red,),
       ],
     ),
   );
  }
}
