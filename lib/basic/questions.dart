
class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({
    required this.text,required this.options,
    this.isLocked = false,this.selectedOption,
});
}
class Option{
  final String text;
  final bool isCorrect;

  const Option({required this.text,required this.isCorrect});
}
final questions = [
  Question(
    text: 'sign commands that',
    options: [
      const Option(text: '1.Overtake', isCorrect: false),
      const Option(text: '2.Drive to the right', isCorrect: false),
      const Option(text: '3.Drive in direction of sign', isCorrect: true),
      //const Option(text: 'speed up', isCorrect: false),
    ],
  ),//1
  Question(
    text: 'sign tells you that',
    options: [
      const Option(text: '1.switch on head lamp', isCorrect: true),
      const Option(text: '2.dip head lamps', isCorrect: false),
      const Option(text: '3.switch off head lamp', isCorrect: false),
      //const Option(text: 'turn right', isCorrect: true),
    ],
  ),//2
  Question(
    text: 'sign prohibits you from',
    options: [
      const Option(text: '1.Turning left', isCorrect: false),
      const Option(text: '2.Making a U-Turn', isCorrect: true),
      const Option(text: '3.Turning Right', isCorrect: false),
      const Option(text: '4.drifting', isCorrect: false),
    ],
  ),//3
  Question(
    text: 'sign tells you that..',
    options: [
      const Option(text: '1.Proceed carefuly', isCorrect: false),
      const Option(text: '2.No delivery vehicle may enter', isCorrect: false),
      const Option(text: '3.No vehicle may proceed past sign', isCorrect: true),
      //const Option(text: 'turn right', isCorrect: true),
    ],
  ),//4
  Question(
    text: 'what is the safe following distance between 2 vehicles ?',
    options: [
      const Option(text: '1.10-12 seconds', isCorrect: false),
      const Option(text: '2.20-25 seconds', isCorrect: false),
      const Option(text: '3.1001-1002 seconds', isCorrect: true),
      //const Option(text: 'speed up', isCorrect: false),
    ],
  ),//5
  Question(
    text: 'sign----warns that..',
    options: [
      const Option(text: '1.There is a narrow bridge', isCorrect: true),
      const Option(text: '2.There is a gate ahead', isCorrect: false),
      const Option(text: '3.There is a narrow tunnel ahead', isCorrect: false),
      //const Option(text: 'turn right', isCorrect: true),
    ],
  ),//6
  Question(
    text: 'sign------warns that..',
    options: [
      const Option(text: '1.There is a bumpy road ahead', isCorrect: false),
      const Option(text: '2.There is a two way traffic ahead', isCorrect: true),
      const Option(text: '3.There is crossroad ahead', isCorrect: false),
      //const Option(text: 'speed up', isCorrect: false),
    ],
  ),//7
  Question(
    text: 'sign-----warns that..',
    options: [
      const Option(text: '1.Theres pedestrians crossing ahead', isCorrect: false),
      const Option(text: '2.There are children ahead', isCorrect: true),
      const Option(text: '3. There is a shop ahead', isCorrect: false),
      const Option(text: '4.There are people holding hands ahead', isCorrect: false),
    ],
  ),//8
  Question(
    text: 'sign------warns that..',
    options: [
      const Option(text: '1.There are stones falling', isCorrect: false),
      const Option(text: '2.There are loose stones on road ahead', isCorrect: true),
      const Option(text: '3.There are roadworks ahead', isCorrect: false),
      //const Option(text: 'speed up', isCorrect: false),
    ],
  ),//9
  Question(
    text: 'sign----warns that..',
    options: [
      const Option(text: '1.Theres Trucks ahead', isCorrect: false),
      const Option(text: '2.Theres a general road ahead', isCorrect: false),
      const Option(text: '3.Theres a roadwork ahead', isCorrect: false),
      const Option(text: '4.Theres slow moving vehicles', isCorrect: true),
    ],
  ),//10
  Question(
    text: 'sign------warns that..',
    options: [
      const Option(text: '1.Yield at mini circle', isCorrect: false),
      const Option(text: '2.Yield at pedestrian', isCorrect: false),
      const Option(text: '3.Yield and give way to traffic on road you are crossing', isCorrect: true),
      //const Option(text: 'speed up', isCorrect: false),
    ],
  ),//11 i ended here bitcher
  Question(
    text: 'sign------commands that..',
    options: [
      const Option(text: '1.There are two lanes ahead', isCorrect: false),
      const Option(text: '2.There is a dual road ahead', isCorrect: false),
      const Option(text: '3.There is a tunnel ahead', isCorrect: true),
      //const Option(text: 'speed up', isCorrect: false),
    ],
  ),//12
  Question(
    text: 'sign----forbids you from...',
    options: [
      const Option(text: '1.To make a U-Turn', isCorrect: false),
      const Option(text: '2.To overtake on the right', isCorrect: false),
      const Option(text: '3.To turn right', isCorrect: true),
      const Option(text: '4.To Turn around', isCorrect: false),
    ],
  ),//13
  Question(
    text: 'sign tells you that..',
    options: [
      const Option(text: '1.You are at the beginning of a toll road and must pay toll at the toll plaza ', isCorrect: true),
      const Option(text: '2.You are aproaching a tunnel', isCorrect: false),
      const Option(text: '3.There is a taxi stand ahead', isCorrect: false),
      const Option(text: '4.You are at the end of a toll road', isCorrect: false),
    ],
  ),//14
  Question(
    text: 'sign tells you that..',
    options: [
      const Option(text: '1.You may not enter beyond this point ', isCorrect: false),
      const Option(text: '2.You are approaching two/more railway track level crossing', isCorrect: true),
      const Option(text: '3.There is a taxi stand ahead', isCorrect: false),
      const Option(text: '4.High accident zone ahead', isCorrect: false),
    ],
  ),//15**********************************************************************
  Question(
    text: 'sign------shows that..',
    options: [
      const Option(text: '1.There is a sharp junction ahead', isCorrect: false),
      const Option(text: '2.There are power pylons ahead', isCorrect: false),
      const Option(text: '3.The dual roadway you are travelling comes to an end ahead', isCorrect: true),
      //const Option(text: 'speed up', isCorrect: false),
    ],
  ),//16
  Question(
    text: 'sign---warns that you are approaching',
    options: [
      const Option(text: '1.A grave yard', isCorrect: false),
      const Option(text: '2.A winding road', isCorrect: false),
      const Option(text: '3.A cross over road', isCorrect: false),
      const Option(text: '4.A staggered junction', isCorrect: true),
    ],
  ),//17
  Question(
    text: 'sign------warns you that..',
    options: [
      const Option(text: '1.There is a T junction ahead', isCorrect: false),
      const Option(text: '2.There are concealed driveways on the left and the right', isCorrect: true),
      const Option(text: '3.There are curves ahead', isCorrect: false),
      const Option(text: '4.slippery road ahead', isCorrect: false),
    ],
  ),//18
  Question(
    text: 'sign prohibits you from...',
    options: [
      const Option(text: '1.Stopping to pick up kitch-hikers for 500m beyond the sign', isCorrect: true),
      const Option(text: '2.picking up hitch-hikers for the next 2km', isCorrect: false),
      const Option(text: '3.Overtaking for the next 100m', isCorrect: false),
      const Option(text: '4.Stopping to pick up hitch-hikers', isCorrect: false),
    ],
  ),//19
  Question(
    text: 'sign------indicates that..',
    options: [
      const Option(text: '1.The area is reserved for animals drawn vehicles', isCorrect: false),
      const Option(text: '2.The area is reserved for vehicles transporting disabled persons', isCorrect: true),
      const Option(text: '3.The area is reserved for rickshaws', isCorrect: false),
      const Option(text: '4.The area is reserved for disabled persons', isCorrect: false),
    ],
  ),//20
  Question(
    text: 'sign shows a flashing light, what can you expect ?',
    options: [
      const Option(text: '1.There is an accident ahead', isCorrect: false),
      const Option(text: '2.There is a traffic signal ahead', isCorrect: false),
      const Option(text: '3.There is a stop sign ahead', isCorrect: false),
      const Option(text: '4.There is a temporary hazard', isCorrect: true),
    ],
  ),//21
  Question(
    text: 'sign------tells you..',
    options: [
      const Option(text: '1.To yield to pedestrians', isCorrect: true),
      const Option(text: '2.To yield at some intersection and give way to traffic on road ahead', isCorrect: false),
      const Option(text: '3.Drive in direction of sign', isCorrect: false),
      const Option(text: '4.People crossing ahead', isCorrect: false),
    ],
  ),//22
  Question(
    text: 'sign warns that..',
    options: [
      const Option(text: 'There a zig-zag road ahead', isCorrect: false),
      const Option(text: 'There are detours ahead', isCorrect: false),
      const Option(text: 'There is a slippery surface ahead', isCorrect: false),
      const Option(text: 'There is a winding road ahead with curves', isCorrect: true),
    ],
  ),//23
  Question(
    text: 'sign----warns you that...',
    options: [
      const Option(text: '1.There is a traffic signal ahead', isCorrect: true),
      const Option(text: '2.The traffic signal ahead is out of order', isCorrect: false),
      const Option(text: '3.There are emergency flashing lights ahead', isCorrect: false),
      const Option(text: '4.There are traffic robots ahead', isCorrect: false),
    ],
  ),//24
  Question(
    text: 'sign----warns that..',
    options: [
      const Option(text: '1.There is reduced visibility ahead', isCorrect: false),
      const Option(text: '2.There are dangerous curves ahead', isCorrect: false),
      const Option(text: '3.There is a slippery road ahead', isCorrect: true),
      const Option(text: '4.There is a railway track ahead', isCorrect: false),
    ],
  ),//25
  Question(
    text: 'sign------tells you that..',
    options: [
      const Option(text: '1.To yield at mini circle', isCorrect: true),
      const Option(text: '2.To yield at some intersection', isCorrect: false),
      const Option(text: '3.To yield to pedestrians', isCorrect: false),
      const Option(text: '4. To recycle on road ahead', isCorrect: false),
    ],
  ),//28
  Question(
    text: 'sign warns that..',
    options: [
      const Option(text: '1.There may be animals moving suddenly across the road', isCorrect: true),
      const Option(text: '2.No hunting is allowed in this area', isCorrect: false),
      const Option(text: '3.There is a guest farm ahead', isCorrect: false),
      const Option(text: '4.There is a zoo/game-reserve ahead', isCorrect: false),
    ],
  ),//29
  Question(
    text: 'sign-----prohibits you from...',
    options: [
      const Option(text: '1.Sounding a horn/hooter for 500m', isCorrect: false),
      const Option(text: '2.sounding a horn/hooter for 300m', isCorrect: false),
      const Option(text: '3.Sounding a horn/hooter for 100m beyond this sign', isCorrect: true),
      //const Option(text: 'speed up', isCorrect: false),
    ],
  ),//30
  Question(
    text: 'sign warns that..',
    options: [
      const Option(text: '1.There is a speedy bump ahead', isCorrect: true),
      const Option(text: '2.There is a pumby road ahead', isCorrect: false),
      const Option(text: '3.There is a mini circle ahead', isCorrect: false),
      const Option(text: 'There is a mountain ahead', isCorrect: false),
    ],
  ),//31
  Question(
    text: 'sign------warns that...',
    options: [
      const Option(text: '1.The road narrows from both sides', isCorrect: false),
      const Option(text: '2.There is a two way street ahead', isCorrect: false),
      const Option(text: '3.The freeway ends here', isCorrect: false),
      const Option(text: '4.The road narrows from the right hand side', isCorrect: true),
    ],
  ),//32
  Question(
    text: 'sign shows that..',
    options: [
      const Option(text: '1.This area is reserved for Taxis', isCorrect: true),
      const Option(text: '2.This area is reserved for Motor vehicles', isCorrect: false),
      const Option(text: '3.This area is reserved for Minibuses', isCorrect: false),
      const Option(text: '4.This area is reserved for Rented parking', isCorrect: false),
    ],
  ),//33
  Question(
    text: 'sign warns that..',
    options: [
      const Option(text: '1.There are roadworks ahead', isCorrect: false),
      const Option(text: '2.There are pedestrians crossing ahead', isCorrect: true),
      const Option(text: '3.There are hitch-hikers ahead', isCorrect: false),
      const Option(text: '4.There are people walking ahead', isCorrect: false),
    ],
  ),//33
];