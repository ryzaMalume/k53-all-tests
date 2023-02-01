import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_audio/just_audio.dart';
import 'package:k53_all_tests/basic/optionwidget.dart';
import 'package:k53_all_tests/basic/questions.dart';
import 'package:k53_all_tests/basic/questionwidget.dart';
import 'package:k53_all_tests/basic/resultpage.dart';
import 'package:k53_all_tests/screens/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../providers/darkmode_provider.dart';
import '../../testing/testing2.dart';

class PracticeTest extends StatefulWidget {
  final bool isClicked;
  PracticeTest({required this.isClicked,});

  @override
  State<PracticeTest> createState() => _PracticeTestState(isClicked);
}

class _PracticeTestState extends State<PracticeTest> {
  final bool isClicked;

  _PracticeTestState(this.isClicked){
    _initAd();
  }
  //start
  late InterstitialAd _interstitialAd;
  bool _isAdLoaded = false;
  void _initAd(){
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3875532731600828/4327492088',//InterstitialAd.testAdUnitId,
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
  late AudioPlayer player;
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
  Color? nightCol = Colors.blueGrey[900];

  @override
  Widget build(BuildContext context) {
    // Obtain the provider
    final darkMode = Provider.of<DarkThemeProvider>(context);

    // getting the value from the provider instance
    final isDark = darkMode.isDark;
    return Scaffold(
      backgroundColor: isDark ? nightCol : Colors.white,
      appBar: AppBar(
      leading: IconButton(
        icon:Icon(Icons.arrow_back_ios,color: Colors.deepOrange,size: 30,),
        onPressed: (){
          setState(() {
            Navigator.pop(context);
          });
        },
      ),
        backgroundColor: isDark ? nightCol: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sound',style: TextStyle(color: isClicked ? Colors.white:Colors.orange,fontSize: 27,fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Container(
                    width: 110,
                    height: 49,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isClicked ? Colors.white : Colors.white60,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
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
                        setState(() async {
                          changeSound();
                          if(sound==true){
                            await player.setAsset('assets/audio/idea.mp3');
                            player.play();
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Image.asset(
                'funny/so2.jpg',
                //fit: BoxFit.cover,
                scale: 5,
              ),
              SizedBox(height: 25,),
              InkWell(
                onTap: () {
                 if(_isAdLoaded){
                          _interstitialAd.show();
                        }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) =>  Scaffold(body: QuestionWidget(isClicked: isClicked,sound: sound,),)),//*****************************problem
                  // );
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext _)=>TestingQuiz(),));
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
                    'Start Test',
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
      ),
    );
  }
}
