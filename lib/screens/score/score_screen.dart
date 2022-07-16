import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k53_all_tests/constants.dart';
import 'package:k53_all_tests/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';

import '../welcome/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        fit: StackFit.expand,
        children: [
          //SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: TextStyle(color: Colors.white,fontSize: 40),/*Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),*/
              ),
              Spacer(),
              Text(
                "${_qnController.correctAns * 1}/${_qnController.questions.length * 1}",
                style: TextStyle(color: Colors.white,fontSize: 40),/*Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),*/
              ),
              Spacer(flex: 3),
              Container(
                width: 110,
                height: 50,
                child: RaisedButton(
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Icon(Icons.home,color: Colors.white,),/*Text("Home",style: TextStyle(color: Colors.white),),*/
                    onPressed: (){
                      //_qnController.correctAns=0;
                      //_qnController.questions.length
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomeScreen()),
                      );
                    },
                ),
              ),
              SizedBox(height: 10,)
            ],
          )
        ],
      ),
    );
  }
}
