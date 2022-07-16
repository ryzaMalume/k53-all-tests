import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:k53_all_tests/basic/optionwidget.dart';
import 'package:k53_all_tests/basic/questions.dart';
import 'package:k53_all_tests/basic/questionwidget.dart';
import 'package:k53_all_tests/basic/resultpage.dart';
import 'package:k53_all_tests/screens/welcome/welcome_screen.dart';


class ResultPage extends StatefulWidget {
  final int score;
  final bool isClicked;
  const ResultPage({Key? key, required this.score,required this.isClicked}) : super(key: key);
  @override
  State<ResultPage> createState() => _ResultPageState(score,isClicked);
}

class _ResultPageState extends State<ResultPage> {
  final int score;
  final bool isClicked;
  _ResultPageState(this.score,this.isClicked);
  bool pass= false;
  int total = questions.length;
  double half=0;
  double percent =0;
  late AudioPlayer player;
  String award = '';
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    percent = (score/total)*100;
    half = total/2;
    if(score>=half){
      pass=true;
    }
    if(pass==true){
      player.setAsset('assets/audio/applause.mp3');
      player.play();
    }else if(pass==false){
      player.setAsset('assets/audio/longL.mp3');
      player.play();
    }
    if(percent==100){
      award='top.png';
    }else if(percent>=90){
      award='1stP.png';
    }else if(percent>=80){
  award='2ndP.png';
  }else if(percent>=70){
  award='3rdP.png';
  }else if(percent>=50){
  award='general.png';
  }else{
      award='failed.png';
    }
    return Scaffold(
      backgroundColor: isClicked ? Colors.blueGrey : Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pass ? Image.asset('assets/awards/$award'): Image.asset('assets/awards/failed.png'),
                pass ? Text("Well Done", style: TextStyle(fontSize: 55,color: pass ? Colors.yellow : Colors.blueGrey,),) : Text("Restart App, try again", style: TextStyle(fontSize: 35,color: pass ? Colors.yellow : Colors.blueGrey,),),
                pass ? SizedBox(height: 20,) : SizedBox.shrink(),
                pass ? Text("You Passed", style: TextStyle(fontSize: 55,color: isClicked ? pass ? Colors.tealAccent : Colors.blueGrey : pass ? Colors.green : Colors.blueGrey),) : SizedBox.shrink(),
                pass ? SizedBox(height: 20,) : SizedBox(height: 15,),
                Container(
                  //width: 90,
                  //height: 35,
                  child: RaisedButton(
                    color: isClicked ? Colors.blueGrey : Colors.white ,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      side: BorderSide(color: pass ? Colors.green : Colors.red),
                    ),
                    child:  Text(
                      '$percent%',//'$score/${questions.length}',
                      style: TextStyle(fontSize: 55,color: pass ? Colors.green : Colors.red,),
                    ),
                    onPressed: (){},
                  ),
                ),
                SizedBox(height: 32,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


