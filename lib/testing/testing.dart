import 'package:flutter/material.dart';

class ButtonTransition extends AnimatedWidget{
  const ButtonTransition({width}) : super(listenable: width);
  // Animation<double> get width
  // => listenable
  @override
  Widget build(BuildContext context){
    return OutlinedButton(
      onPressed: (){},
      child: Text("Click me "),
      style: ButtonStyle(

      ),
    );
  }
}