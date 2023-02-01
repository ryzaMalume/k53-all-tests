import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:k53_all_tests/basic/optionwidget.dart';
import 'package:k53_all_tests/basic/questions.dart';
import 'package:k53_all_tests/basic/questionwidget.dart';
import 'package:k53_all_tests/basic/resultpage.dart';
import 'package:k53_all_tests/screens/welcome/welcome_screen.dart';

import '../constants.dart';
import '../gradient_text.dart';
import '../screens/welcome/welcome2.dart';

class ResultPage extends StatefulWidget {
  final int score, sorScore, rorScore, conScore;
  final bool isClicked;
  ResultPage(
      {required this.score,
      required this.isClicked,
      required this.sorScore,
      required this.rorScore,
      required this.conScore});
  @override
  State<ResultPage> createState() => _ResultPageState(
        score,
        isClicked,
        sorScore,
        rorScore,
        conScore,
      );
}

class _ResultPageState extends State<ResultPage> {
  final int score, sorScore, rorScore, conScore;
  final bool isClicked;
  _ResultPageState(
    this.score,
    this.isClicked,
    this.sorScore,
    this.rorScore,
    this.conScore,
  );
  bool pass = false;
  int total = questions.length;
  double half = 0;
  double percent = 0;
  bool sorP = false;
  bool rorP = false;
  bool conP = false;
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
    if (sorScore >= 22) {
      sorP = true;
    }
    if (rorScore >= 23) {
      rorP = true;
    }
    if (conScore >= 6) {
      conP = true;
    }
    if (sorP == true && rorP == true && conP == true) {
      pass = true;
    }
    percent = (score / total) * 100;
    half = total / 2;

    if (pass == true) {
      player.setAsset('assets/audio/applause.mp3');
      player.play();
    } else if (pass == false) {
      player.setAsset('assets/audio/longL.mp3');
      player.play();
    }

    if (percent == 100) {
      award = 'top.png';
    } else if (percent >= 90) {
      award = '1stP.png';
    } else if (percent >= 85) {
      award = '2ndP.png';
    } else if (percent >= 80) {
      award = '3rdP.png';
    } else if (percent >= 75) {
      award = 'general.png';
    } else {
      award = 'failed.png';
    }

    percent = percent.roundToDouble();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isClicked ? Colors.blueGrey : Colors.white,
        title: GradientText(
          "Results",
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontStyle: isClicked ? FontStyle.italic : FontStyle.normal),
          gradient: isClicked
              ? LinearGradient(colors: [
                  Colors.cyanAccent,
                  Colors.yellowAccent,
                  Colors.deepOrange,
                ])
              : LinearGradient(colors: [
                  Colors.deepOrange,
                  Colors.orange,
                  Colors.teal,
                ]),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isClicked ? Colors.tealAccent : Colors.deepOrange,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      WelcomeScreen2()), //*****************************problem
            );
          },
        ),
      ),
      backgroundColor: isClicked ? Colors.blueGrey : Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Text('$percent'),
                pass
                    ? Image.asset('assets/awards/$award')
                    : Image.asset('assets/awards/failed.png'),
                pass
                    ? GradientText(
                        "Well Done",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontStyle: isClicked
                                ? FontStyle.italic
                                : FontStyle.normal),
                        gradient: isClicked
                            ? LinearGradient(colors: [
                                Colors.cyanAccent,
                                Colors.yellowAccent,
                                Colors.deepOrange,
                              ])
                            : LinearGradient(colors: [
                                Colors.deepOrange,
                                Colors.orange,
                                Colors.teal,
                              ]),
                      )
                    : Column(
                        children: [
                          GradientText(
                            "you have to pass all sections",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                fontStyle: isClicked
                                    ? FontStyle.italic
                                    : FontStyle.normal),
                            gradient: isClicked
                                ? LinearGradient(colors: [
                                    Colors.cyanAccent,
                                    Colors.yellowAccent,
                                    Colors.deepOrange,
                                  ])
                                : LinearGradient(colors: [
                                    Colors.deepOrange,
                                    Colors.orange,
                                    Colors.teal,
                                  ]),
                          ),
                          GradientText(
                            "Restart App, try again.",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                fontStyle: isClicked
                                    ? FontStyle.italic
                                    : FontStyle.normal),
                            gradient: isClicked
                                ? LinearGradient(colors: [
                                    Colors.cyanAccent,
                                    Colors.yellowAccent,
                                    Colors.deepOrange,
                                  ])
                                : LinearGradient(colors: [
                                    Colors.deepOrange,
                                    Colors.orange,
                                    Colors.teal,
                                  ]),
                          ),
                        ],
                      ),
                pass
                    ? SizedBox(
                        height: 20,
                      )
                    : SizedBox.shrink(),
                pass
                    ? Text(
                        "You Passed",
                        style: TextStyle(
                            fontSize: 55,
                            color: isClicked
                                ? pass
                                    ? Colors.tealAccent
                                    : Colors.blueGrey
                                : pass
                                    ? Colors.green
                                    : Colors.blueGrey),
                      )
                    : SizedBox.shrink(),
                pass
                    ? SizedBox(
                        height: 20,
                      )
                    : SizedBox(
                        height: 15,
                      ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  //width: 390,
                  //color: Colors.lightBlueAccent,
                  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      /*Image.asset(
                  'assets/awards/failed.png',
                  scale: 7,
                ),*/
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'pass', // question.question,
                            style: TextStyle(color: Colors.green, fontSize: 20),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'fail', // question.question,
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                        ],
                      ),
                      SizedBox(height: kDefaultPadding / 2),
                      Container(
                        //width: 90,
                        //height: 35,
                        //sorScore,rorScore,conScore
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isClicked ? Colors.blueGrey : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(25),
                              ),
                              side: BorderSide(
                                color: isClicked ? Colors.blueGrey : Colors.white,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Road signs :', //'$score/${questions.length}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.teal,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '$sorScore/30', //'$score/${questions.length}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: sorP ? Colors.green : Colors.red,
                                ),
                              ),
                              //SizedBox(width: 30,),

                              sorP
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    )
                                  : Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(0),
                                  ),
                                  side: BorderSide(
                                      color: isClicked
                                          ? Colors.blueGrey
                                          : Colors.white),
                                ),
                                side: BorderSide(
                                    color: isClicked
                                        ? Colors.blueGrey
                                        : Colors.white),
                                backgroundColor:
                                    isClicked ? Colors.blueGrey : Colors.white,
                              ),
                              child: Text(
                                'pass mark = 22/30',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15),
                              ),
                              onPressed: () {},
                            ),
                            // RaisedButton(
                            //   color: isClicked ? Colors.blueGrey : Colors.white ,
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight:Radius.circular(25),topLeft:Radius.circular(25),topRight: Radius.circular(0),),
                            //     side: BorderSide(color: isClicked ? Colors.blueGrey : Colors.white ),
                            //   ),
                            //   child: Text('pass mark = 22/30',style: TextStyle(color: Colors.green,fontSize: 15),),
                            //   onPressed: (){},
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        //width: 90,
                        //height: 35,
                        //sorScore,rorScore,conScore
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(25),
                              ),
                              side: BorderSide(
                                color:
                                    isClicked ? Colors.blueGrey : Colors.white,
                              ),
                            ),
                            side: BorderSide(
                                color:
                                    isClicked ? Colors.blueGrey : Colors.white),
                            backgroundColor:
                                isClicked ? Colors.blueGrey : Colors.white,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'rules of the road :', //'$score/${questions.length}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.teal,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '$rorScore/30', //'$score/${questions.length}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: rorP ? Colors.green : Colors.red,
                                ),
                              ),
                              //SizedBox(width: 1,),
                              rorP
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    )
                                  : Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(0),
                                  ),
                                  side: BorderSide(
                                      color: isClicked
                                          ? Colors.blueGrey
                                          : Colors.white),
                                ),
                                side: BorderSide(
                                    color: isClicked
                                        ? Colors.blueGrey
                                        : Colors.white),
                                backgroundColor:
                                    isClicked ? Colors.blueGrey : Colors.white,
                              ),
                              child: Text(
                                'pass mark = 23/30',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        //width: 90,
                        //height: 35,
                        //sorScore,rorScore,conScore
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(25),
                              ),
                              side: BorderSide(
                                color:
                                    isClicked ? Colors.blueGrey : Colors.white,
                              ),
                            ),
                            side: BorderSide(
                                color:
                                    isClicked ? Colors.blueGrey : Colors.white),
                            backgroundColor:
                                isClicked ? Colors.blueGrey : Colors.white,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Controls :', //'$score/${questions.length}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.teal,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '$conScore/8', //'$score/${questions.length}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: conP ? Colors.green : Colors.red,
                                ),
                              ),
                              //SizedBox(width: 30,),
                              conP
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    )
                                  : Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               backgroundColor: isClicked ? Colors.blueGrey : Colors.white,
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.only(
                                   bottomLeft: Radius.circular(25),
                                   bottomRight: Radius.circular(25),
                                   topLeft: Radius.circular(25),
                                   topRight: Radius.circular(0),
                                 ),
                                 side: BorderSide(
                                     color: isClicked
                                         ? Colors.blueGrey
                                         : Colors.white),
                               ),
                             ),
                              child: Text(
                                'pass mark = 6/8',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isClicked ? Colors.blueGrey : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        side: BorderSide(
                          color: isClicked ? Colors.tealAccent : Colors.teal,
                        ),
                      ),
                    ),
                    child: GradientText(
                      "Home",
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              isClicked ? FontStyle.italic : FontStyle.normal),
                      gradient: isClicked
                          ? LinearGradient(colors: [
                              Colors.cyanAccent,
                              Colors.yellowAccent,
                              Colors.deepOrange,
                            ])
                          : LinearGradient(colors: [
                              Colors.deepOrange,
                              Colors.orange,
                              Colors.teal,
                            ]),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WelcomeScreen2()), //*****************************problem
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
