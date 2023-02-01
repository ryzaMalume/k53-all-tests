import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:k53_all_tests/constants.dart';
import 'package:k53_all_tests/gradient_text.dart';
//import 'package:k53_all_tests/screens/quiz/quiz_screen.dart';
import 'package:k53_all_tests/screens/welcome/practicetest.dart';
import '../../LearnHome.dart';
import '../../learn.dart';
import '../../learnhome2.dart';

class WelcomeScreen2 extends StatefulWidget {
  const WelcomeScreen2({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen2> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen2> {
  _WelcomeScreenState2(){
    _initAd();
  }
  //start
  late InterstitialAd _interstitialAd;
  bool _isAdLoaded = false;
  void _initAd(){
    InterstitialAd.load(
      adUnitId: InterstitialAd.testAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: (error){},
      ),
    );
  }
  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    _isAdLoaded = true;
  }
  //end
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
  int take = 1;
  bool testTakenB = false;
  /* void testTakenF(){
    setState(() {
      take++;
      if(take==2){
        testTakenB = true;
      }
    });
  }*/
  String photon = '';
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: isClicked ? Colors.blueGrey : Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              GradientText(
                "Take test again ?",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: isClicked ? FontStyle.italic : FontStyle.normal),
                gradient:isClicked ? LinearGradient(colors: [
                  Colors.yellowAccent,
                  Colors.orange,
                  Colors.deepOrangeAccent,
                ]):
                LinearGradient(colors: [
                  Colors.orangeAccent,
                  Colors.orange,
                  Colors.deepOrangeAccent,
                ]),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Divider(thickness: 1,color: isClicked ? Colors.tealAccent : Colors.teal,height: 20,),
                GradientText(
                  "Close and Open App to take another test.",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: isClicked ? FontStyle.italic : FontStyle.normal),
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
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientText(
                      "Restart App ?",
                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,fontStyle: isClicked ? FontStyle.italic : FontStyle.normal),
                      gradient:isClicked ? LinearGradient(colors: [
                        Colors.tealAccent,
                        Colors.cyanAccent,
                        Colors.lightBlueAccent,
                      ]):
                      LinearGradient(colors: [
                        Colors.teal,
                        Colors.blue,
                        Colors.blueAccent,
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isClicked ? Colors.blueGrey : Colors.white ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:Radius.circular(0),topLeft:Radius.circular(30),topRight: Radius.circular(0),),
                        side: BorderSide(color: isClicked ? Colors.tealAccent : Colors.teal,),
                      ),
                    ),
                    child: GradientText(
                      "No",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: isClicked ? FontStyle.italic : FontStyle.normal),
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
                      Navigator.pop(context);
                    },
                  ),
                ),
                //SizedBox(width: 70,),
                Spacer(),
                Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isClicked ? Colors.blueGrey : Colors.white ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0),bottomRight:Radius.circular(30),topLeft:Radius.circular(0),topRight: Radius.circular(30),),
                        side: BorderSide(color: isClicked ? Colors.tealAccent : Colors.teal,),
                      ),
                    ),
                    child: GradientText(
                      "OK",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: isClicked ? FontStyle.italic : FontStyle.normal),
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
                      SystemNavigator.pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    if(isClicked == true){
      photon = 'Dark';
    }else{
      photon = 'Light';
    }
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: isClicked ? Colors.blueGrey : Colors.white ,
          appBar: AppBar(
            backgroundColor: isClicked ? Colors.blueGrey : Colors.white ,
            title:  GradientText(
              "$photon mode",
              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
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
            centerTitle: true,
            actions: [
              Row(
                children: [
                  Container(
                    width: 90,
                    height: 35,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isClicked ? Colors.blueGrey : Colors.white ,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: isClicked ? Colors.tealAccent : Colors.teal,),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: isClicked ? MainAxisAlignment.start : MainAxisAlignment.end,
                        children: [
                          Icon(
                            isClicked ? Icons.nightlight_round : Icons.light_mode,
                            color: isClicked ? Colors.white : Colors.orange,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 2), //2/6
                    SizedBox(height: 5,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isClicked ? Colors.blueGrey : Colors.white ,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0),bottomRight:Radius.circular(0),topLeft:Radius.circular(25),topRight: Radius.circular(25),),
                          side: BorderSide(color: isClicked ? Colors.tealAccent : Colors.teal,),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GradientText(
                            "K53 Test",
                            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontStyle: isClicked ? FontStyle.italic : FontStyle.normal),
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
                        ],
                      ),
                      onPressed: (){},
                    ),
                    Spacer(), // 1/6
                    Image.asset(
                      'funny/blue.jpg',
                      fit: BoxFit.cover,
                    ),
                    //Spacer(),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      //color:
                      //color: Colors.orange,
                      style: ElevatedButton.styleFrom(
                      backgroundColor: isClicked ?  Colors.blueGrey : Colors.white ,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:Radius.circular(30),topLeft:Radius.circular(30),topRight: Radius.circular(30),),
                      side: BorderSide(color: Colors.orange,),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GradientText(
                            "Learn",
                            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontStyle: isClicked ? FontStyle.italic : FontStyle.normal),
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
                        ],
                      ),
                      onPressed: (){
                        if(_isAdLoaded){
                          _interstitialAd.show();
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  LearnHome2(isClicked:isClicked),),
                        );
                      },
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        if(_isAdLoaded){
                          _interstitialAd.show();
                        }
                        _showMyDialog();
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                        decoration: BoxDecoration(
                          //gradient: kPrimaryGradient,
                          color: isClicked ? Colors.white60 : Colors.grey,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:Radius.circular(0),topLeft:Radius.circular(30),topRight: Radius.circular(30),
                          ),
                        ),
                        child: Text(
                          "Practice Test",
                          style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: isClicked ? Colors.blueGrey : Colors.white, ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    /*InkWell(
                      onTap: () {
                        if(_isAdLoaded){
                          _interstitialAd.show();
                        }
                        _showMyDialog();
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                        decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:Radius.circular(30),topLeft:Radius.circular(30),topRight: Radius.circular(0),),
                        ),
                        child: Text(
                          "Real Test",
                          style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: isClicked ? Colors.blueGrey : Colors.white, ),
                        ),
                      ),
                    ),*/
                    // Spacer(), // 1/6
                    SizedBox(height: 20,),
                    Spacer(flex: 2), // it will take 2/6 spaces

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}

