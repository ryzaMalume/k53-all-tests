import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:k53_all_tests/screens/more/quiz1.dart';

class MyTestQuiz extends StatefulWidget {
  const MyTestQuiz({Key? key}) : super(key: key);
  @override
  State<MyTestQuiz> createState() => _MyTestQuizState();
}

class _MyTestQuizState extends State<MyTestQuiz> {
  bool _flag = true;

  late BannerAd bannerAd;
  bool isLoaded=false;
  bool start = false;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          //color: Colors.blue,
          margin: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.red,
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
                  onPressed: startQuiz,
                  child: Row(
                    children: [
                      Icon(Icons.play_circle_outline_outlined,color:Colors.white,size:40),
                      Text(
                        "Start",
                        style: TextStyle(fontSize: 18.0,color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              //isLoaded ? Container(height:50,child: AdWidget(ad: bannerAd),) : Text("Fuck it failed"),
            ],
          ),
        ),
      ),
    );
  }
  void startQuiz(){
    setState(() {
      start == true;
      Navigator.push(context, new MaterialPageRoute(builder:(context)=> new Quiz1(isClicked: false,)));
    });
  }
}
