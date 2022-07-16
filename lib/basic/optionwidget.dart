import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:k53_all_tests/basic/questions.dart';


class OptionWidget extends StatefulWidget {
  final Question question;
  bool fuck;
  final ValueChanged<Option> onClickedOption;
  final bool isClicked,sound;
  OptionWidget({Key? key, required this.question, required this.onClickedOption,required this.isClicked,required this.fuck,required this.sound}) : super(key: key);
  static bool pressed = false;

  @override
  State<OptionWidget> createState() => _OptionWidgetState(question: question,onClickedOption: onClickedOption,isClicked: isClicked,fuck:fuck,sound:sound );
}

class _OptionWidgetState extends State<OptionWidget> {
  final Question question;
  bool fuck;
  final ValueChanged<Option> onClickedOption;
  final bool isClicked,sound;
  _OptionWidgetState({required this.question, required this.onClickedOption,required this.isClicked,required this.fuck,required this.sound});
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

  @override
  Widget build(BuildContext context) {
    //pressed = fuck ? false : true;
    if(fuck == true){
      pressed = false;
    }
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            color: isClicked ? Colors.blueGrey : Colors.white,//***********************************************************-------------------here
            child: Column(
              children:
              question.options.map((option) => buildOption(context, option)).toList(),//type- Widget
            ),
          ),
         Positioned(
             child: Column(
               children: [

               ],
             ),
           bottom: 50,
         ),
        ],
      ),
    );
  }

  Widget buildOption(BuildContext context, Option option){
    final color = getColorForOption(option, question);
    return GestureDetector(
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
      },
      child: Container(
        //color: Colors.teal,
        //height: 50,
        //width: 500,
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
                  maxLines: 2,
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
  void changePressed(){//************************************************************
    setState(() {
      pressed = true;
      fuck = false;//for red and green text after pressing next
    });
  }
  Color getColorForOption(Option option, Question question){
    final isSelected = option == question.selectedOption;
    if(question.isLocked){
      if(isSelected){
        return option.isCorrect ? Colors.green : Colors.red;
      }else if(option.isCorrect){
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }
  Widget getIconForOption(Option option, Question question){
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
  String getSound(Option option, Question question){
    final isSelected = option == question.selectedOption;
    if(question.isLocked){
      if(isSelected){
        return option.isCorrect ? 'dB.mp3' : 'oasis.mp3';
      }else if(option.isCorrect){
        return 'dB.mp3';
      }
    }
    return '';
  }
}
