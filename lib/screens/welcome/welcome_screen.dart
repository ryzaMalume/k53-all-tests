import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:k53_all_tests/constants.dart';
import 'package:k53_all_tests/gradient_text.dart';
import 'package:k53_all_tests/screens/more/testquiz.dart';
//import 'package:k53_all_tests/screens/quiz/quiz_screen.dart';
import 'package:k53_all_tests/screens/welcome/practicetest.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../LearnHome.dart';
import '../../learn.dart';
import '../../providers/darkmode_provider.dart';
import '../../testing/testing2.dart';
import '../more/go.dart';
import '../more/quiz1.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  _WelcomeScreenState(){
    _initAd();
  }
  //start
  late InterstitialAd _interstitialAd;
  bool _isAdLoaded = false;
  void _initAd(){
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3875532731600828/4327492088',
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
  String photon = '';
  Color? nightCol;

  @override
  Widget build(BuildContext context) {
    nightCol = Colors.blueGrey[900];
    // Obtain the provider
    final darkMode = Provider.of<DarkThemeProvider>(context);

    // getting the value from the provider instance
    final isDark = darkMode.isDark;
    if(isDark == true){
      photon = 'Dark';
    }else{
      photon = 'Light';
    }
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: isDark ? nightCol : Colors.white ,//deepPurple[900], Theme.of(context).primaryColor
          appBar: AppBar(
            backgroundColor: isDark ? nightCol : Colors.white ,
            title:  GradientText(
              "$photon mode",
              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              gradient: isDark ? LinearGradient(colors: [
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
                        backgroundColor: isDark ? nightCol : Colors.white ,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: isDark ? Colors.tealAccent : Colors.teal,),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: isDark ? MainAxisAlignment.start : MainAxisAlignment.end,
                        children: [
                          Icon(
                            isDark ? Icons.nightlight_round : Icons.light_mode,
                            color: isDark ? Colors.white : Colors.orange,
                          )
                        ],
                      ),
                      onPressed: (){
                        setState(() {
                          //darkMode();
                          darkMode.goDark();
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
                         backgroundColor: isDark ? nightCol : Colors.white ,
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
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (BuildContext _)=>Second()));
                       },
                    ),
                    Spacer(), // 1/6
                    Image.asset(
                      'funny/blue.jpg',
                      fit: BoxFit.cover,
                    ),
                    //Spacer(),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      //color: Colors.orange,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark ? nightCol : Colors.white ,
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
                          MaterialPageRoute(builder: (context) =>  LearnHome(isClicked:isClicked),),
                        );
                      },
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                     if(_isAdLoaded){
                          _interstitialAd.show();
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PracticeTest(isClicked: isClicked,),),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                        decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:Radius.circular(0),topLeft:Radius.circular(30),topRight: Radius.circular(30),
                          ),
                        ),
                        child: Text(
                          "Practice Test",
                          style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: isClicked ? nightCol : Colors.white, ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    // InkWell(
                    //   onTap: () {
                    //     if(_isAdLoaded){
                    //       _interstitialAd.show();
                    //     }//
                    //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext _)=>MyTestQuiz()));
                    //   },
                    //   child: Container(
                    //     width: double.infinity,
                    //     alignment: Alignment.center,
                    //     padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                    //     decoration: BoxDecoration(
                    //       gradient: kPrimaryGradient,
                    //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:Radius.circular(0),topLeft:Radius.circular(30),topRight: Radius.circular(30),
                    //       ),
                    //     ),
                    //     child: Text(
                    //       "Old Test",
                    //       style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: isClicked ? nightCol : Colors.white, ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 20,),
                    Spacer(flex: 2), // it will take 2/6 spaces

                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: GestureDetector(
            child: Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                //border: Border.all(color: Colors.tealAccent),
                //color: isDark ? nightCol  : Colors.white,
                gradient: LinearGradient(
                  colors: [Colors.orange,Colors.black,],
                ),
              ),
              child: Center(
                child: Icon(Icons.share,color: Colors.tealAccent,),
              ),
            ),
            onTap: ()async{
              await Share.share("https://play.google.com/store/apps/details?id=com.k53_all_testss",);
            },
          ),
        ),
      ),
    );
  }
}

