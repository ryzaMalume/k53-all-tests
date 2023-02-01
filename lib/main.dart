import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:k53_all_tests/providers/darkmode_provider.dart';
import 'package:k53_all_tests/screens/welcome/welcome_screen.dart';
import 'package:k53_all_tests/testing/testing2.dart';
import 'package:provider/provider.dart';
import 'gradient_text.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  static const bool isDarkTheme = true;

  // This widget is the root of your application.
  bool isClicked = true;
  int score = 16;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // create: (BuildContext context) {
      //   return DarkThemeProvider();
      // },
      create: (context) => DarkThemeProvider(),
      child: GetMaterialApp(
        // theme: ThemeData(
        //   primarySwatch: Colors.red,
        //   primaryColor: isDarkTheme ? Colors.black : Colors.white,
        //
        //   backgroundColor: isDarkTheme ? Colors.black : Color(0xffF1F5FB),
        //
        //   indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
        //   buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
        //
        //   hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
        //
        //   highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
        //   hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
        //
        //   focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
        //   disabledColor: Colors.grey,
        //   cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
        //   canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
        //   brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        //   buttonTheme: Theme.of(context).buttonTheme.copyWith(
        //       colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
        //   appBarTheme: AppBarTheme(
        //     elevation: 0.0,
        //   ),
        //   textSelectionTheme: TextSelectionThemeData(selectionColor: isDarkTheme ? Colors.white : Colors.black),
        // ),
        title: 'K53 Test',
        debugShowCheckedModeBanner: false,
        //theme: ThemeData.dark(),
        home: AnimatedSplashScreen(
          duration: 2500,
          splash:GradientText(
            "wanna ace your learner's ?",
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
          ),
          nextScreen: WelcomeScreen(),
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: isClicked ? Colors.blueGrey : Colors.white,
        ),
        // WelcomeScreen(),//Scaffold(body: QuestionWidget()),
      ),
    );
  }
}



