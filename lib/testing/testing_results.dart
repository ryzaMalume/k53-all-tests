import 'package:flutter/material.dart';
import 'package:k53_all_tests/testing/testing2.dart';

class TestingResults extends StatefulWidget {
  TestingResults({required this.score,required this.pages});
  final int score;
  final int pages;

  @override
  State<TestingResults> createState() => _TestingResultsState(score: score, pages: pages);
}

class _TestingResultsState extends State<TestingResults> {
  _TestingResultsState({required this.score,required this.pages});
  final int score;
  final int pages;
  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("you got $score out f $pages"),
            ],
          ),
          GestureDetector(
            child:   Container(
              width: myWidth-160,
              height: 50,
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.green,
              ),
              child: Center(
                child: Text("Restart",style: TextStyle(fontSize: 17,color:Colors.white),),
              ),
            ),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>TestingQuiz()));
            },
          )
        ],
      ),
    );
  }
}
