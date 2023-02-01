

import 'package:flutter/material.dart';
import 'package:k53_all_tests/screens/welcome/welcome2.dart';
import 'package:k53_all_tests/screens/welcome/welcome_screen.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

import 'controls.dart';
import 'gradient_text.dart';
import 'learn.dart';

class LearnHome extends StatefulWidget {
  final bool isClicked;
  LearnHome({required this.isClicked});

  @override
  State<LearnHome> createState() => _LearnHomeState(isClicked);
}

class _LearnHomeState extends State<LearnHome> {
  bool isClicked;
  _LearnHomeState(this.isClicked);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isClicked ? Colors.blueGrey : Colors.white,
        title: GradientText(
          "Learn",
          style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,fontStyle: isClicked ? FontStyle.italic : FontStyle.normal),
          gradient: isClicked ? LinearGradient(colors: [
            Colors.cyanAccent,
            Colors.yellowAccent,
            Colors.deepOrange,

          ])
              :LinearGradient(colors: [
            Colors.deepOrange,
            Colors.orange,
            Colors.teal,
          ]) ,
          // WelcomeScreen(),//Scaffold(body: QuestionWidget()),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isClicked ? Colors.white : Colors.blueGrey,
          ),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  WelcomeScreen()),//*****************************problem
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              children: [
                SizedBox(width: 10,),
                ElevatedButton(
                  //color: Colors.orange,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isClicked ?  Colors.blueGrey : Colors.white ,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:Radius.circular(30),topLeft:Radius.circular(0),topRight: Radius.circular(30),),
                      side: BorderSide(color: Colors.orange,),
                    ),
                  ),
                  child: GradientText(
                    "Road signs & Rules",
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: isClicked ? FontStyle.italic : FontStyle.normal),
                    gradient: isClicked ? LinearGradient(colors: [
                      Colors.cyanAccent,
                      Colors.yellowAccent,
                      Colors.deepOrange,

                    ])
                        :LinearGradient(colors: [
                      Colors.deepOrange,
                      Colors.orange,
                      Colors.teal,
                    ]) ,
                  ),
                  onPressed: (){
                    print('im working bro');
                    //MaterialPageRoute(builder: (context) =>  Learn(),);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Learn(isClicked: isClicked,),),//*****************************problem
                    );
                  },
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                  //color: Colors.orange,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isClicked ?  Colors.blueGrey : Colors.white ,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:Radius.circular(30),topLeft:Radius.circular(30),topRight: Radius.circular(0),),
                      side: BorderSide(color: Colors.orange,),
                    ),
                  ),
                  child: GradientText(
                    "Controls",
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: isClicked ? FontStyle.italic : FontStyle.normal),
                    gradient: isClicked ? LinearGradient(colors: [
                      Colors.cyanAccent,
                      Colors.yellowAccent,
                      Colors.deepOrange,

                    ])
                        :LinearGradient(colors: [
                      Colors.deepOrange,
                      Colors.orange,
                      Colors.teal,
                    ]) ,
                  ),
                  onPressed: (){
                    print('im working bro');
                    //MaterialPageRoute(builder: (context) =>  Learn(),);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Controls(isClicked:isClicked),),//*****************************problem
                    );
                  },
                ),
                SizedBox(width:10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
