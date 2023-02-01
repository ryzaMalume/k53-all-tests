import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:k53_all_tests/screens/welcome/welcome_screen.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

import 'LearnHome.dart';
import 'gradient_text.dart';
import 'learn.dart';

class Controls extends StatefulWidget {
  final bool isClicked;
  Controls({required this.isClicked});

  @override
  State<Controls> createState() => _ControlsState(isClicked);
}

class _ControlsState extends State<Controls> {
  bool isClicked;
  _ControlsState(this.isClicked);
  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/controls.pdf'),
  );
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isClicked ? Colors.blueGrey : Colors.white,
        title: GradientText(
          "Controls",
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
          // WelcomeScreen(),//Scaffold(body: QuestionWidget()),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isClicked ? Colors.white : Colors.blueGrey,
          ),
          onPressed: (){
            if(_isAdLoaded){
              _interstitialAd.show();
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  LearnHome(isClicked: isClicked,)),//*****************************problem
            );
          },
        ),
      ),
      body: Center(
          child: PdfView(
            controller: pdfController,
          )
      ),
    );
  }
}
