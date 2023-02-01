import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:k53_all_tests/basic/questions.dart';


class OptionWidget extends StatefulWidget {
  final Question question;
  bool fuck;
  final bool pop;
  final ValueChanged<Option> onClickedOption;
  final bool isClicked,sound;
  //final bool reset;
  OptionWidget({required this.question, required this.onClickedOption,required this.isClicked,required this.fuck,required this.sound,required this.pop});
  static bool pressed = false;

  @override
  State<OptionWidget> createState() => _OptionWidgetState(question: question,onClickedOption: onClickedOption,isClicked: isClicked,fuck:fuck,sound:sound,pop:pop);
}

class _OptionWidgetState extends State<OptionWidget> {
  final Question question;
  bool fuck;
  final bool pop;
  final ValueChanged<Option> onClickedOption;
  final bool isClicked,sound;
  //final bool reset;
  _OptionWidgetState({required this.question, required this.onClickedOption,required this.isClicked,required this.fuck,required this.sound,required this.pop});
  static bool pressed = false;
  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
  bool change=false;
  void reset(){
    //question.selectedOption=false;
    change = false;
  }
  @override
  Widget build(BuildContext context) {
    if(pop==true){
      Navigator.pop(context);
    }
    change = question.isLocked;
    //pressed = fuck ? false : true;
    if(fuck == true){
      pressed = false;
    }
    return SingleChildScrollView(
      //key: key,
      child: Container(
        color: isClicked ? Colors.blueGrey : Colors.white,
        child: Column(
          children:
          question.options.map((option) => buildOption(context, option)).toList(),//type- Widget
        ),
      ),
    );
  }
  //end of app here.......going downwards is just functions

  Widget buildOption(BuildContext context, Option option){
    if(pop==true){
      Navigator.pop(context);
    }
    final color = getColorForOption(option, question);
    return GestureDetector(
      //key: key,
      onTap: () {
        setState(() async {
          onClickedOption(option);
          changePressed();
          //******************************************************here
          final isSelected = option == question.selectedOption;
          //start here
          if(question.isLocked){
            if(isSelected){
              option.isCorrect ? await player.setAsset('assets/audio/dB.mp3') : await player.setAsset('assets/audio/longL.mp3');
              sound ? player.play() : print('sound was disabled');
            }else if(option.isCorrect){
              await player.setAsset('assets/audio/dB.mp3');
              sound ? player.play() : print('sound was disabled');
            }
          }//end here
        });
        //fuck = false;
        reset();
      },
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color:Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color),
        ),
        child:  IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Text(
                  option.text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(fontSize: 20,color: pressed ? color : Colors.black),
                ),
              ),
              getIconForOption(option, question),
            ],
          ),
        ),
      ),
    );
  }
  void changePressed(){
    setState(() {
      pressed = true;
      fuck = false;//for red and green text after pressing next
    });
  }
  Color getColorForOption(Option option, Question question){
    if(pop==true){
      Navigator.pop(context);
    }
    final isSelected = option == question.selectedOption;
    if(change){
      if(isSelected){
        return option.isCorrect ? Colors.green : Colors.red;
      }else if(option.isCorrect){
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }
  Widget getIconForOption(Option option, Question question){
    if(pop==true){
      Navigator.pop(context);
    }
    final isSelected = option == question.selectedOption;
    if(question.isLocked){
      if(isSelected){
        return option.isCorrect ? Icon(Icons.check_circle,color: Colors.green,) : Icon(Icons.cancel,color: Colors.red,);
      }else if(option.isCorrect){
        return Icon(Icons.check_circle, color: Colors.green,);
      }
    }
    return SizedBox.shrink();
  }

}
