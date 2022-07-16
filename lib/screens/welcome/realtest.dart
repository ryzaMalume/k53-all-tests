import 'package:flutter/material.dart';

import '../quiz/quiz_screen.dart';


class RealTest extends StatefulWidget {

  final bool isClicked;
  const RealTest({Key? key, required this.isClicked}) : super(key: key);

  @override
  State<RealTest> createState() => _RealTestState(isClicked);
}

class _RealTestState extends State<RealTest> {
  final bool isClicked;
  _RealTestState(this.isClicked);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isClicked ? Colors.blueGrey : Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: AlignmentGeometry,
        children: [
          Row(
            children: [
              Icon(Icons.arrow_back_ios,color: Colors.deepOrange,),
            ],
          ),
          Image.asset(
            'funny/idiots.jpg',
            scale: 5,
          ),
          Spacer(),
          Text(
            'jfnncdncdcnkldmc',
          ),
          Spacer(),
          Container(
            width: 110,
            height: 50,
            child: RaisedButton(
              color: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'Start Test',
              ),
              onPressed: (){
                //Get.to(QuizScreen()),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  QuizScreen()),//*****************************problem
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
