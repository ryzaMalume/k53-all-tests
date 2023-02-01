import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:k53_all_tests/basic/optionwidget.dart';
import 'package:k53_all_tests/basic/questions.dart';
import 'package:k53_all_tests/basic/questionwidget.dart';
import 'package:k53_all_tests/basic/resultpage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:k53_all_tests/basic/questions.dart';
import '../gradient_text.dart';

class QuestionWidget extends StatefulWidget {
  final bool isClicked,sound;
  const QuestionWidget({required this.isClicked, required this.sound,});
  @override
  State<QuestionWidget> createState() => _QuestionWidgetState(isClicked,sound);
}

class _QuestionWidgetState extends State<QuestionWidget> {
  final bool isClicked,sound;
  _QuestionWidgetState(this.isClicked,this.sound,){
    _initAd();
  }
  //start
  late InterstitialAd _interstitialAd;
  bool _isAdLoaded = false;
  void _initAd(){
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3875532731600828/4327492088',//InterstitialAd.
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
  int questionNumber = 1;
  int score = 0;
  bool _isLocked = false;
  bool fuck = false;
  /*void reset(){
    questionNumber = 1;
    score = 0;
    _isLocked = false;
  }*/
  late PageController _controller;
  late AudioPlayer player;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
    player = AudioPlayer();
  }
  bool pass= false;
  int total = questions.length;
  double half=0;

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
  //start*******************
  late BannerAd bannerAd;
  bool isLoaded=false;
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-3875532731600828/6702867851',//'ca-app-pub-3940256099942544/6300978111',//done
      listener: BannerAdListener(
          onAdLoaded: (ad){
            setState(() {
              isLoaded=true;
            });
            print("succes");
          },
          onAdFailedToLoad: (ad, error){
            ad.dispose();
          }
      ),
      request: AdRequest(),
    );
    bannerAd.load();
  }
  //end*********************
  bool wat = false;
  bool controlYet = false;
  int sorScore=0;
  int rorScore=0;
  int conScore=0;
  int val1=0;
  int val2=0;
  int val3 = 0;
  bool sorP = false;
  bool rorP = false;
  bool conP = false;
  String controlsI = '';
  Widget _buildImage(String path){
    if(questionNumber<=30){
      sorScore = score;//1
    }else if(questionNumber<=60){
      val2 = score - sorScore;//2-1
      rorScore = val2;//1
    }else if(questionNumber<=68){
      val1 = sorScore + rorScore;
      val3 = score - val1;//
      conScore = val3;//2
  }


    if(questionNumber <=30 || questionNumber>=61){
      wat = true;
      if(questionNumber <=30){
        return Image.asset(path,scale: 5.5,);
      }else{
        return Image.asset(path,fit: BoxFit.cover,);
      }

    }else{
      wat = false;
      return Column(
        children: [
          Text('')
        ],
      );
    }
  }
  bool reset=false;
  void resetAll(){
    setState(() {
      reset = true;
    });

  }
  int index = 0;
  //final isSelected  =
  void reset2(){
    //reset();

    index = 0;
    questionNumber=0;

    _isLocked=false;
    fuck = true;
    pop = false;
  }
  bool pop = false;
  @override
  Widget build(BuildContext context) {
    if(questionNumber>=61){
      controlYet==true;
      controlsI='pics/small.png';
    }else{
      controlsI='pics/$questionNumber.png';
    }
    half = total/2;
    if(sorScore>=22){
      sorP = true;
    }
    if(rorScore>=23){
      rorP = true;
    }
    if(conScore>=6){
      conP = true;
    }
    if(sorP==true && rorP==true && conP==true){
      pass = true;
    }
    return WillPopScope(
      //key: key,
      onWillPop: () async => false,
      child: Container(
        color: isClicked ? Colors.blueGrey : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32,),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight:Radius.circular(25),topLeft:Radius.circular(25),topRight: Radius.circular(0),),
                    ),
                  side: BorderSide(color: isClicked ? Colors.tealAccent : Colors.teal,),
                  backgroundColor: isClicked ? Colors.blueGrey : Colors.white ,
                ),
                child: Row(
                  children: [
                    GradientText(
                      "Question $questionNumber/${questions.length}",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: isClicked ? FontStyle.italic : FontStyle.normal),
                      gradient: isClicked ? LinearGradient(colors: [
                        Colors.cyanAccent,
                        Colors.lightGreenAccent,
                        Colors.tealAccent,

                      ])
                          :LinearGradient(colors: [
                        Colors.deepOrange,
                        Colors.orange,
                        Colors.teal,
                      ]) ,
                    ),
                    Spacer(),
                    //SizedBox(width: 123,),
                    GradientText(
                      "Score : $score",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: isClicked ? FontStyle.italic : FontStyle.normal),
                      gradient: isClicked ? LinearGradient(colors: [
                        Colors.lightGreenAccent,
                        Colors.orange,
                        Colors.tealAccent,

                      ])
                          :LinearGradient(colors: [
                        Colors.deepOrange,
                        Colors.orange,
                        Colors.teal,
                      ]) ,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12,),
              SingleChildScrollView(
                child: _buildImage(controlsI),
              ),
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index){
                    final question = questions[index];
                    return buildQuestion(question);
                  },
                  itemCount: questions.length,
                  controller: _controller,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),

              _isLocked ? _isLocked ? buildElevatedButton() : SizedBox.shrink() : isLoaded ? Container(height:50,child: AdWidget(ad: bannerAd),) : Text("click here to get answers..",style: TextStyle(color: Colors.red,)),

            ],
          ),
        ),
      ),
    );
  }
  Widget buildElevatedButton(){
    return Container(
       width: questionNumber < questions.length ? 125 : 143 ,
      height: 55,
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              side: BorderSide(color: isClicked ? Colors.tealAccent : Colors.teal,),
              backgroundColor: isClicked ? Colors.lightGreenAccent : Colors.green,
            ),
            onPressed: () async {
              if(questionNumber < questions.length){
                _controller.nextPage(
                  duration: Duration(milliseconds: 10),
                  curve: Curves.easeInExpo,
                );
                setState(() {
                  questionNumber++;
                  _isLocked=false;
                  fuck = true;
                });
              }else{
                if(_isAdLoaded){
                  _interstitialAd.show();
                }
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimatedSplashScreen(
                        duration: 5000,
                        splash: pass ?  GradientText(
                          "Congratulations",
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
                        ):Image.asset('assets/awards/laugh.png',scale: 3,),
                        nextScreen: ResultPage(score: score,isClicked: isClicked,sorScore:sorScore,rorScore:rorScore,conScore:conScore),
                        splashTransition: SplashTransition.scaleTransition,
                        backgroundColor: isClicked ? Colors.blueGrey : Colors.white,
                      ),
                      //ResultPage(score: score,isClicked: isClicked,),
                    )
                );
              }
            },//onPressed
            child: Row(
              children: [

                Text(
                  questionNumber < questions.length ? "Next" : "Finish",
                  style: TextStyle(color: isClicked ? Colors.blueGrey: Colors.white,fontSize: 26),
                ),
                questionNumber < questions.length ? Icon(Icons.double_arrow_rounded,color: isClicked ? Colors.blueGrey: Colors.white,size: 30,) : Icon(Icons.double_arrow_rounded,color: isClicked ? Colors.blueGrey: Colors.white,size: 30,),

              ],
            ),
          ),
      ],
      ),
    ) ;
  }
  Column buildQuestion(Question question){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 12,),
        Text(
          question.text,
          style: TextStyle(fontSize: 25,color: isClicked ? Colors.white : Colors.blueGrey ),

        ),
        SizedBox(height: 12,),

        Expanded(
          child: OptionWidget(
            question: question,
            onClickedOption: (option){
              if(question.isLocked){
                return;
              }else{
                setState(() {
                  question.isLocked = true;
                  question.selectedOption = option;
                });
                _isLocked = question.isLocked;
                if(question.selectedOption!.isCorrect){
                  score++;
                }
              }
            },
            //reset: reset,
            isClicked: isClicked,
            fuck: fuck,
            sound: sound,
            pop:pop,
          ),
        ),
      ],
    );
  }
}
