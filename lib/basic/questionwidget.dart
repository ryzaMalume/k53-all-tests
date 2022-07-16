import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:k53_all_tests/basic/optionwidget.dart';
import 'package:k53_all_tests/basic/questions.dart';
import 'package:k53_all_tests/basic/questionwidget.dart';
import 'package:k53_all_tests/basic/resultpage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class QuestionWidget extends StatefulWidget {
  //const ({Key? key}) : super(key: key);
  final bool isClicked,sound;
  const QuestionWidget({Key? key, required this.isClicked, required this.sound}) : super(key: key);
  @override
  State<QuestionWidget> createState() => _QuestionWidgetState(isClicked,sound);
}

class _QuestionWidgetState extends State<QuestionWidget> {
  final bool isClicked,sound;
  _QuestionWidgetState(this.isClicked,this.sound);
  int questionNumber = 1;
  int score = 0;
  bool _isLocked = false;
  bool fuck = false;
  void reset(){
    questionNumber = 1;
    score = 0;
    _isLocked = false;
  }
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
      adUnitId: "ca-app-pub-3875532731600828/6702867851",//done
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
  @override
  Widget build(BuildContext context) {
    half = total/2;
    if(score>=half){
      pass=true;
    }
    return Container(
      color: isClicked ? Colors.blueGrey : Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32,),
            Row(
              children: [
                Text(
                  "Question $questionNumber/${questions.length}",
                  style: TextStyle(fontSize: 25,color: isClicked ? Colors.white : Colors.blueGrey),
                ),
                Spacer(),
                //SizedBox(width: 123,),
                Text("Score : $score",style: TextStyle(fontSize: 25,color: isClicked ? Colors.tealAccent : Colors.teal),),
              ],
            ),

            //const Divider(thickness: 5, color: Colors.white,),
            SizedBox(height: 12,),
            SingleChildScrollView(
              child: Image.asset(
                'pics/$questionNumber.png',
                //fit: BoxFit.cover,
                scale: 6,
                //scale: 1,
              ),
            ),
           // SizedBox(height:6),
            isLoaded ? Container(height:50,child: AdWidget(ad: bannerAd),) : Text("click here to get answers..",style: TextStyle(color: Colors.red,)),
            //SizedBox(height:6),
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
            //SizedBox(height:6),
            //isLoaded ? Container(height:50,child: AdWidget(ad: bannerAd),) : Text("click here to get answers..",style: TextStyle(color: Colors.red,)),
            //SizedBox(height:6),
            //bottom shit goes here...
            _isLocked ? _isLocked ? buildElevatedButton() : SizedBox.shrink() : /*Container(
                width: 165,
                height: 55,
                child: RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: (){},
                  child: Row(
                    children: [
                      Icon(Icons.refresh,color: isClicked ? Colors.blueGrey : Colors.white,size: 35,),
                      Text(
                        'Restart',
                        style: TextStyle(color: isClicked ? Colors.blueGrey : Colors.white,fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ) ,*/
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
  Widget buildElevatedButton(){
    return Container(
       width: questionNumber < questions.length ? 125 : 143 ,
      height: 55,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)),
        color: isClicked ? Colors.lightGreenAccent : Colors.green,
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
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimatedSplashScreen(
                    duration: 3000,
                    splash: pass ? Text("Congratulations",style: TextStyle(color: isClicked ?  Colors.white : Colors.blueGrey , fontSize: 25)):Image.asset('assets/awards/laugh.png',scale: 3,),
                    nextScreen: ResultPage(score: score,isClicked: isClicked,),
                    splashTransition: SplashTransition.scaleTransition,
                    backgroundColor: isClicked ? Colors.blueGrey : Colors.white,
                  ),
                  //ResultPage(score: score,isClicked: isClicked,),
                )
            );
          }
        },
        child: Row(
          children: [
            Text(
              questionNumber < questions.length ? "Next" : "Finish",
              style: TextStyle(color: isClicked ? Colors.blueGrey: Colors.white,fontSize: 30),
            ),
            questionNumber < questions.length ? Icon(Icons.double_arrow_rounded,color: isClicked ? Colors.blueGrey: Colors.white,size: 30,) : Icon(Icons.double_arrow_rounded,color: isClicked ? Colors.blueGrey: Colors.white,size: 30,),
          ],
        ),
      ),
    );
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
            isClicked: isClicked,
            fuck: fuck,
            sound: sound,
          ),
        ),
        /*FloatingActionButton(
          onPressed: () {  },
          child: Text('ok'),
        ),*/
      ],
    );
  }
}
