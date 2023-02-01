import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/darkmode_provider.dart';

// class TestingAppBar extends StatefulWidget {
//   TestingAppBar({required this.page,required this.totalPages,required this.score});
//   final int page;
//   final int totalPages;
//   final int score;
//
//   @override
//   State<TestingAppBar> createState() => _TestingAppBarState(page: page, totalPages: totalPages,score: score);
// }
//
// class _TestingAppBarState extends State<TestingAppBar> {
//   _TestingAppBarState({required this.page,required this.totalPages,required this.score});
//   final int page;
//   final int totalPages;
//   final int score;
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
Widget testingAppBar({required double myWidth,required double myHeight,required int page,required int totalPages,required int score,required BuildContext context}){
  Color? nightCol = Colors.blueGrey[900];
  // Obtain the provider
  final darkMode = Provider.of<DarkThemeProvider>(context);

  // getting the value from the provider instance
  final isDark = darkMode.isDark;
  return Container(
    width: myWidth-160,
    height: 50,
    padding: EdgeInsets.all(3),
    margin: EdgeInsets.all(3),
    decoration: BoxDecoration(
      border: Border.all(color: isDark ? Colors.tealAccent : Colors.teal,),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(0),topRight: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(0),),
      // gradient: LinearGradient(
      //   colors: isDark ? [Colors.blueGrey[900]!,Colors.teal,] : [Colors.blueGrey!,Colors.tealAccent,],
      // ),
      color: isDark ? nightCol : Colors.white,
    ),
    child: Column(
      children: [
        SizedBox(height: 20,),
        Row(
          children: [
            Text("Question $page / $totalPages",style: TextStyle(color: isDark ? Colors.white : Colors.blueGrey,fontSize: 18,fontWeight: FontWeight.bold),),
            Spacer(),
            Text("Score: $score",style: TextStyle( color :isDark ? Colors.white : Colors.teal,fontSize: 18,fontWeight: FontWeight.bold),),
          ],
        ),
      ],
    ),
  );
}
