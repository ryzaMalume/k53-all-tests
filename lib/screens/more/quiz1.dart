import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TestQuiz{
  var images = [
    "arrow","h_lamp","turn","x_enter","","nr","two","ch","stones","slow2",
    "yield","tunnel","ryt","toll","rail","dual","stg","co","hitch","dis","tempo","pedes","winding","tr","slip",
    "circ","wild","horn","bump","nar"
  ];
  var questions = [
    "sign-----commands that",//1
    "sign----tells you that",
    "sign----prohibits you from",
    "sign-----tells you that",//no enter
    "what is the safe following distance between 2 vehicles",//5
    "sign-----warns that...",//narrow
    "sign-----warns that...",//two
    "sign-----warns that...",//children
    "sign-----warns that...",//loose stones
    "sign-----warns that...",//10 slow moving vehicles
    "sign-----warns that...",//yield to traffic
    "sign-----tells you that...",//tunnel
    "sign-----forbids you to...",//turn_ryt
    "sign-----tells you that...",//toll_road
    "sign-----tells you that...",//15 railway_crossing
    "sign-----shows that...",//dualroad_end
    "sign-----warns that...",//staggered_junction
    "sign-----warns you that...",//concealed_driveways
    "sign-----prohibits you from...",//hitch_hikers
    "sign-----prohibits you from...",//20 vehicle transporting disabled_person
    "sign--shows a flashing light.what can you expect?",//temporary_hazard
    "sign-----tells you to yield...",//pedestrians
    "sign-----warns that...",//winding road with curves
    "sign-----warns you that...",//traffic signal
    "sign-----warns that...",//25 slippery road
    //last
    "sign--tells you to...",//circle
    "sign-----warns that...",//wild animals
    "sign-----prohibits you from...",//horn
    "sign-----warns that...",//speed bump
    "sign-----warns that...",//25  road narrows
  ];
  var choices = [
    ["a.overtake","b.drive to the right","c.drive in direction of sign"],//1
    ["a.switch on head lamp","b.dip head lamps","c.switch off head lamp"],
    ["a.Turning left","b.making U turn","c.Turning right"],
    ["a.proceed carefully","b.no delivery vehicle may enter","c.no vehicle may proceed past sign"],
    ["a.10-12 seconds","b.20-25 seconds","c.1001-1002 seconds"],//5
    ["a.There is a narrow bridge","b.there is a gate ahead","c.there is a narrow tunnel ahead"],
    ["a.there is a bumpy road ahead","b.There is two way traffic ahead","c.there is crossroad ahead"],
    ["a.there's pedestrians crossing ahead","b.there are children ahead","c.there is a shop ahead"],
    ["a.there are stones falling","b.there are loose stones on road ahead","c.there are roadworks ahead"],
    ["a.theres slow moving vehicles","b.theres a general road ahead","c.theres a roadwork ahead"],//10
    ["a.yield at mini circle","b.yield at pedestrian","c.yield to traffic on road youre crossing"],
    ["a.there are two lanes ahead","b.theres a dual road ahead","c.theres a tunnel ahead"],
    ["a.to make u turn","b.to overtake on the right","c.to turn right"],
    ["a.you at beginning of toll road and must pay all toll plaza","b.you are approaching a tunnel","c.theres a taxi stand ahead"],//15
    ["a.you may not enter beyond this point","b.you approaching two/more railway track lvl crossing","c.you approaching double boom gates ahead"],
    ["a.theres a sharp junction ahead","b.there are power pylons ahead","c.roadway you traveling comes to an end ahead"],
    ["a.a grave yard","b.a winding road","c.a staggered junction"],
    ["a.theres a T junction ahead","b.there are curves ahead","c.there are concealed driveways on the left&right"],
    ["a.picking hitch-hikers for next 2km","b.overtaking for the nxt 100m","c.stopping to pick hitch-hikers for 500m beyond this sign"],
    ["a.area is reserved for rickshaws","b.area is reserved for animals drawn vehicles","c.area is reserved for vehicles transporting disabled persons"],//20
    ["a.there is a temporary hazard","there is a traffic signal ahead","c.theres a stop sign ahead"],
    ["a.to pedestrians","b.at mini circle","c.at some intersection & give way to traffic on road ahead."],
    ["a.there are detour ahead","b.theres a winding road ahead with curves","c.theres a slippery surface ahead"],
    ["a.traffic signal ahead is out of order","b.there is a traffic signal ahead","c.there are emergency flashing light ahead"],
    ["a.there are dangerous curves ahead","b.theres reduced visibilty ahead","c.theres a slippery road ahead"],//25
    //last
    ["a.yield at mini circle","b.yield at some intersection","c.yield to pedestrians"],
    ["a.there may be animals moving suddenly across the road","b.no hunting is allowed in this area","c.there's a guest farm ahead"],
    ["a.sounding a horn for 500m","b.sounding a horn for 300m","c.sounding a horn?hooter for 100m beyond this sign"],
    ["a.there is a speed bump ahead","b.there's a bumpy road ahead","c.there's a mini circle ahead"],
    ["a.the road narrows ahead from the right hand side","b.the freeway ends here","c.the road narrows from both sides"]
  ];
  var correctAnswers = [
    "c.drive in direction of sign","a.switch on head lamp","b.making U turn","c.no vehicle may proceed past sign",
    "c.1001-1002 seconds","a.There is a narrow bridge", "b.There is two way traffic ahead","b.there are children ahead",
    "b.there are loose stones on road ahead","a.theres slow moving vehicles","c.yield to traffic on road youre crossing",
    "c.theres a tunnel ahead","c.to turn right","a.you at beginning of toll road and must pay all toll plaza",
    "b.you approaching two/more railway track lvl crossing","c.roadway you traveling comes to an end ahead", "c.a staggered junction",
    "c.there are concealed driveways on the left&right","c.stopping to pick hitch-hikers for 500m beyond this sign",
    "c.area is reserved for vehicles transporting disabled persons","a.there is a temporary hazard",
    "a.to pedestrians","b.theres a winding road ahead with curves","b.there is a traffic signal ahead","c.theres a slippery road ahead",
    "a.yield at mini circle","a.there may be animals moving suddenly across the road","c.sounding a horn?hooter for 100m beyond this sign",
    "a.there is a speed bump ahead","a.the road narrows ahead from the right hand side"
  ];
}
var finalScore = 0;
var questionNumber = 0;
var quiz = new TestQuiz();
var count = quiz.questions.length;
var last = quiz.questions.length-1;
bool _flag = false;
bool _flag2 = false;


class Quiz1 extends StatefulWidget{
  Quiz1({required this.isClicked});
  bool isClicked;
  @override
  State<StatefulWidget>createState(){
    return new Quiz1State(isClicked: isClicked);
  }
}
class Quiz1State extends State<Quiz1>{
  Quiz1State({required this.isClicked});
  bool isClicked;
  late BannerAd bannerAd;
  bool isLoaded=false;
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
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
  //Start
  int count = 10;
  String qNa = '';
  bool start = false;
  bool done = false;
  double percentage = 1.0;
  int percentage2 = 0;
  int? dura = 10;
  bool isIt = false;
  countSeconds(int s){
    count = s;
    for (var i = s; i >0; i--){
      Future.delayed(Duration(seconds: i), () {

        setState(() {
          count--;
          percentage = count / 6 ;
          percentage = percentage*100;
          percentage2 = percentage.round();
        });
        print(count);

      });

    }

  }
  //End
  @override
  Widget build(BuildContext context){
    return new WillPopScope(
      onWillPop: ()async => false,
      child: Scaffold(
        body: new Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(20.0),
          child: new Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    child: Text("Start"),
                    onPressed: start ? null : ()async{
                      start = true;
                      countSeconds(dura!);
                      //await printOrderMessage();
                      //isIt = false;
                      //isIt ? Navigator.push(context, MaterialPageRoute(builder: (BuildContext _)=>Third())) : print('wait...');
                    } ,
                  ),
                  isIt ? ElevatedButton(
                    child: Text("Reset"),
                    onPressed: start ? ()async{

                      setState(() {
                        start = false;
                        isIt = false;
                      });
                    } :null,
                  ) : SizedBox.shrink(),
                ],
              ),
              start ? CircularPercentIndicator(
                animation: true,
                animationDuration: dura! * 1000,
                radius: 40,
                lineWidth: 5,
                percent: 1.0,
                progressColor: Colors.deepPurple.shade200,
                backgroundColor: Colors.deepOrange,
                circularStrokeCap: CircularStrokeCap.butt,
                reverse: true,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$count"),
                    // Text("second(s)"),
                  ],
                ),
              ) : SizedBox.shrink(),
              //End**********************************************************************
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Q-${questionNumber + 1} of $count",
                        style: TextStyle(fontSize: 22.0,color: Colors.red,fontWeight: FontWeight.bold,),
                      ),
                      Text("Score: $finalScore / ${quiz.questions.length}",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Image.asset("images/${quiz.images[questionNumber]}.png",height: 180,width: 180,),
              Text(quiz.questions[questionNumber],
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),),
              Column(
                children: [
                  SizedBox(height:9),
                  MaterialButton(
                    height: 50,
                    minWidth: 300.0,
                    color: Colors.white,
                    onPressed: (){
                      if(quiz.choices[questionNumber][0]==quiz.correctAnswers[questionNumber]){
                        debugPrint("correct");
                        _flag=true;
                        finalScore++;
                      }else{
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    child: Text(quiz.choices[questionNumber][0],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  SizedBox(height:12),
                  MaterialButton(
                    height: 50,
                    minWidth: 300.0,
                    color: Colors.white,
                    onPressed: (){
                      if(quiz.choices[questionNumber][1]==quiz.correctAnswers[questionNumber]){
                        debugPrint("correct");
                        finalScore++;
                      }else{
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    child: Text(quiz.choices[questionNumber][1],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  SizedBox(height:6),
                  isLoaded ? Container(height:50,child: AdWidget(ad: bannerAd),) : Text("click here to get answers..",style: TextStyle(color: Colors.red,)),
                  SizedBox(height:6),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(30)
                        )
                    ),
                    height: 50,
                    width: 300,
                    child: MaterialButton(
                      minWidth: 300.0,
                      height: 40.0,
                      color: Colors.white,
                      onPressed: (){
                        if(quiz.choices[questionNumber][2]==quiz.correctAnswers[questionNumber]){
                          debugPrint("correct");
                          finalScore++;
                        }else{
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: Text(quiz.choices[questionNumber][2],
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2,),
                  //isLoaded ? Container(height:50,child: AdWidget(ad: bannerAd),) : Text("Fuck it failed"),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: 140,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isClicked ? Colors.blueGrey : Colors.white ,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: isClicked ? Colors.tealAccent : Colors.teal,),
                        ),
                      ),
                      onPressed: resetQuiz,
                      child: Row(
                        children: [
                          Icon(Icons.replay,color:Colors.red,size:40),
                          Text(
                            "Restart",
                            style: TextStyle(fontSize: 18.0,color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),/*
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.all(
                          Radius.circular(30)
                        )
                      ),
                      height: 50,
                      width: 140,
                      //color: Colors.lightBlueAccent,
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        minWidth: 30.0,
                        height: 60.0,
                        onPressed: resetQuiz,
                        child: Row(
                          children: [
                            Icon(Icons.replay,color:Colors.red,size:40),
                            Text(
                              "Restart",
                              style: TextStyle(fontSize: 18.0,color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),*/
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
  void resetQuiz(){
    setState(() {
      /*Navigator.pop(context);*/
      Navigator.push(context, new MaterialPageRoute(builder:(context)=> new Quiz1(isClicked: false,)));
      finalScore =0;
      questionNumber = 0;
    });
  }
  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length-1){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>new Summary(score: finalScore,count2: count,)));
      }else{
        questionNumber++;
      }
    });
  }
}
class Summary extends StatefulWidget {
  final int score;
  final count2;

  const Summary({required this.score, required this.count2 });
/*
  @override
  _SummaryState createState() => new _SummaryState(score);*/

  @override
  _SummaryState createState() => _SummaryState(score,count2);
}

class _SummaryState extends State<Summary> {
  int score;
  int count2;
  var calc;
  var calc2;

  _SummaryState(this.score,this.count2);
  //const Summary({Key key, @required this.score }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    calc = (score / count2)*100;
    calc2 = calc.toStringAsFixed(0);
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Final Score: $score / $count2 ",
                style: TextStyle(fontSize: 25.0,color: Colors.teal),
              ),
              SizedBox(height: 40,),
              Text("$calc2 %",
                style: TextStyle(fontSize: 45.0,color: Colors.green,fontWeight:FontWeight.bold),
              ),
              SizedBox(height: 40,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.all(
                        Radius.circular(30)
                    )
                ),
                height: 50,
                width: 140,
                //color: Colors.lightBlueAccent,
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  minWidth: 30.0,
                  height: 60.0,
                  onPressed: resetQuiz,//////////////////////////-----------319
                  child: Row(
                    children: [
                      Icon(Icons.repeat,color:Colors.white,size:40),
                      Text(
                        "Repeat",
                        style: TextStyle(fontSize: 18.0,color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Text(
                'Thank you for installing my app, it is not complete yet.',
                style: TextStyle(color: Colors.red,fontSize: 20),
              ),
              SizedBox(height: 12,),
              Text(
                'The full version with full features is coming this year 2022 around August.',
                style: TextStyle(color: Colors.red,fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void calcu(){
    calc = score / count2;
  }
  void resetQuiz(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder:(context)=> new Quiz1(isClicked: false,)));
      finalScore =0;
      questionNumber = 0;
    });
  }
}
