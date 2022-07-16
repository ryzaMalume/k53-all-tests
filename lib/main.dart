import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:k53_all_tests/screens/welcome/welcome_screen.dart';
import 'basic/resultpage.dart';
//cebo update
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool isClicked = false;
  int score = 16;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'K53 Test',
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.dark(),
      home: WelcomeScreen(),//Scaffold(body: QuestionWidget()),
    );
  }
}



