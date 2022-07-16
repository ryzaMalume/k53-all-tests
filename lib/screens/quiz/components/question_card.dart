import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k53_all_tests/controllers/question_controller.dart';
import 'package:k53_all_tests/models/Questions.dart';
import 'package:k53_all_tests/screens/welcome/welcome_screen.dart';

import '../../../constants.dart';
import '../../score/score_screen.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    required Key key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);
  //his.Key = Key;
  final Question question;
  //final Key = GlobalKey();

  //final int hu2 = hu.hue();
  @override
  Widget build(BuildContext context) {
    QuestionController hu = new QuestionController();
    int go = question.id;
    QuestionController _controller = Get.put(QuestionController());
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Image.asset(
                "pics/$go.png",
              scale: 7,
            ),
            Text(
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: kBlackColor),
            ),
            SizedBox(height: kDefaultPadding / 2),
            ...List.generate(
              question.options.length,
                  (index) => Option(
                index: index,
                text: question.options[index],
                press: () => _controller.checkAns(question, index), key: UniqueKey(),
              ),
            ),
            Container(
              child: RaisedButton(
                child: Text("Re-Attempt"),
                onPressed: (){
                  //_qnController.correctAns=0;
                  //_qnController.questions.length
                  QuestionController as = new QuestionController();
                  as.reset();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
