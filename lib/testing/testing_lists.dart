import 'package:flutter/material.dart';
List<dynamic> questions = [

  'sign commands that', //1

  'sign tells you that', //2

  'sign prohibits you from', //3

  'sign tells you that..', //4

  'The hazard marker shows that ...', //5

  'sign----warns that..', //6

  'sign------warns that..', //7

  'sign-----warns that..', //8

  'sign------warns that..' //9

      'sign----warns that..', //10
];
List<Map<String, bool>> answers = [
  {'1.Overtake':false},
  {'2.Drive to the right':false},
  {'3.Drive in direction of sign':true},
  {"4.Drive to the left":false},
  //1

  {'1.switch on head lamp':true},
  {'2.dip head lamps':false},
  {'3.switch off head lamp':false},
  {"4.switch on rear lamp":false},
  //2

  {'1.Turning left':false},
  {'2.Making a U-Turn':true},
  {'3.Turning Right':false},
  {'4.drifting':false},
  //3

  {'1.Proceed carefuly':false},
  {'2.No delivery vehicle may enter':false},
  {'3.No vehicle may proceed past sign':true},
  {'4.You may proceed':false},
  //4

  {'1.There are sharp bends to the left.':false},
  {'2.There is a hazard & you must pass it on the side to which white stripes point. ':true},
  {'3.There is a ditch next to the road.':false},
  {'4.There is a hazard and you may proceed normaly':false},
  //5

  {'1.There is a narrow bridge':true},
  {'2.There is a gate ahead':false},
  {'3.There is a narrow tunnel ahead':false},
  {'4.There is a normal bridge':false},
  //6

  {'1.There is a bumpy road ahead':false},
  {'2.There is a two way traffic ahead':true},
  {'3.There is crossroad ahead':false},
  {'4.There is a cross section ahead':false},
  //7

  {'1.Theres pedestrians crossing ahead':false},
  {'3. There is a shop ahead':false},
  {'2.There are children ahead':true},
  {'4.There are people holding hands ahead':false},
  //8

  {'1.There are stones falling':false},
  {'2.There are loose stones on road ahead':true},
  {'3.There are roadworks ahead':false},
  {'4.There are road blocks ahead':false},
  //9

  {'1.Theres Trucks ahead':false},
  {'2.Theres a general road ahead':false},
  {'3.Theres a roadwork ahead':false},
  {'4.Theres slow moving vehicles':true},
  //10
];

//
//   Question(
//     text: 'sign------warns that..',
//     options: [
//       const Option(text: '1.Yield at mini circle', isCorrect: false),
//       const Option(text: '2.Yield at pedestrian', isCorrect: false),
//       const Option(text: '3.Yield and give way to traffic on road you are crossing', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'sign------commands that..',
//     options: [
//       const Option(text: '1.There are two lanes ahead', isCorrect: false),
//       const Option(text: '2.There is a dual road ahead', isCorrect: false),
//       const Option(text: '3.There is a tunnel ahead', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'sign----forbids you from...',
//     options: [
//       const Option(text: '1.To make a U-Turn', isCorrect: false),
//       const Option(text: '2.To overtake on the right', isCorrect: false),
//       const Option(text: '3.To turn right', isCorrect: true),
//       const Option(text: '4.To Turn around', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'sign tells you that..',
//     options: [
//       const Option(text: '1.You are at the beginning of a toll road and must pay toll at the toll plaza ', isCorrect: true),
//       const Option(text: '2.You are aproaching a tunnel', isCorrect: false),
//       const Option(text: '3.There is a taxi stand ahead', isCorrect: false),
//       const Option(text: '4.You are at the end of a toll road', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'sign tells you that..',
//     options: [
//       const Option(text: '1.You may not enter beyond this point ', isCorrect: false),
//       const Option(text: '2.You are approaching two/more railway track level crossing', isCorrect: true),
//       const Option(text: '3.There is a taxi stand ahead', isCorrect: false),
//       const Option(text: '4.High accident zone ahead', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'sign------shows that..',
//     options: [
//       const Option(text: '1.There is a sharp junction ahead', isCorrect: false),
//       const Option(text: '2.There are power pylons ahead', isCorrect: false),
//       const Option(text: '3.The dual roadway you are travelling comes to an end ahead', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'sign---warns that you are approaching',
//     options: [
//       const Option(text: '1.A grave yard', isCorrect: false),
//       const Option(text: '2.A winding road', isCorrect: false),
//       const Option(text: '3.A cross over road', isCorrect: false),
//       const Option(text: '4.A staggered junction', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'sign------warns you that..',
//     options: [
//       const Option(text: '1.There is a T junction ahead', isCorrect: false),
//       const Option(text: '2.There are concealed driveways on the left and the right', isCorrect: true),
//       const Option(text: '3.There are curves ahead', isCorrect: false),
//       const Option(text: '4.slippery road ahead', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'sign prohibits you from...',
//     options: [
//       const Option(text: '1.Stopping to pick up kitch-hikers for 500m beyond the sign', isCorrect: true),
//       const Option(text: '2.picking up hitch-hikers for the next 2km', isCorrect: false),
//       const Option(text: '3.Overtaking for the next 100m', isCorrect: false),
//       const Option(text: '4.Stopping to pick up hitch-hikers', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'sign------indicates that..',
//     options: [
//       const Option(text: '1.The area is reserved for animals drawn vehicles', isCorrect: false),
//       const Option(text: '2.The area is reserved for vehicles transporting disabled persons', isCorrect: true),
//       const Option(text: '3.The area is reserved for rickshaws', isCorrect: false),
//       const Option(text: '4.The area is reserved for disabled persons', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'sign shows a flashing light, what can you expect ?',
//     options: [
//       const Option(text: '1.There is an accident ahead', isCorrect: false),
//       const Option(text: '2.There is a traffic signal ahead', isCorrect: false),
//       const Option(text: '3.There is a stop sign ahead', isCorrect: false),
//       const Option(text: '4.There is a temporary hazard', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'sign------tells you..',
//     options: [
//       const Option(text: '1.To yield to pedestrians', isCorrect: true),
//       const Option(text: '2.To yield at some intersection and give way to traffic on road ahead', isCorrect: false),
//       const Option(text: '3.Drive in direction of sign', isCorrect: false),
//       const Option(text: '4.People crossing ahead', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'sign warns that..',
//     options: [
//       const Option(text: 'There a zig-zag road ahead', isCorrect: false),
//       const Option(text: 'There are detours ahead', isCorrect: false),
//       const Option(text: 'There is a slippery surface ahead', isCorrect: false),
//       const Option(text: 'There is a winding road ahead with curves', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'sign----warns you that...',
//     options: [
//       const Option(text: '1.There is a traffic signal ahead', isCorrect: true),
//       const Option(text: '2.The traffic signal ahead is out of order', isCorrect: false),
//       const Option(text: '3.There are emergency flashing lights ahead', isCorrect: false),
//       const Option(text: '4.There are traffic robots ahead', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'sign----warns that..',
//     options: [
//       const Option(text: '1.There is reduced visibility ahead', isCorrect: false),
//       const Option(text: '2.There are dangerous curves ahead', isCorrect: false),
//       const Option(text: '3.There is a slippery road ahead', isCorrect: true),
//       const Option(text: '4.There is a railway track ahead', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'sign------tells you that..',
//     options: [
//       const Option(text: '1.To yield at mini circle', isCorrect: true),
//       const Option(text: '2.To yield at some intersection', isCorrect: false),
//       const Option(text: '3.To yield to pedestrians', isCorrect: false),
//       const Option(text: '4. To recycle on road ahead', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'sign warns that..',
//     options: [
//       const Option(text: '1.There may be animals moving suddenly across the road', isCorrect: true),
//       const Option(text: '2.No hunting is allowed in this area', isCorrect: false),
//       const Option(text: '3.There is a guest farm ahead', isCorrect: false),
//       const Option(text: '4.There is a zoo/game-reserve ahead', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'sign-----prohibits you from...',
//     options: [
//       const Option(text: '1.Sounding a horn/hooter for 500m', isCorrect: false),
//       const Option(text: '2.sounding a horn/hooter for 300m', isCorrect: false),
//       const Option(text: '3.Sounding a horn/hooter for 100m beyond this sign', isCorrect: true),
//       //const Option(text: 'speed up', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'sign warns that..',
//     options: [
//       const Option(text: '1.There is a speedy bump ahead', isCorrect: true),
//       const Option(text: '2.There is a pumby road ahead', isCorrect: false),
//       const Option(text: '3.There is a mini circle ahead', isCorrect: false),
//       const Option(text: 'There is a mountain ahead', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'sign------warns that...',
//     options: [
//       const Option(text: '1.The road narrows from both sides', isCorrect: false),
//       const Option(text: '2.There is a two way street ahead', isCorrect: false),
//       const Option(text: '3.The freeway ends here', isCorrect: false),
//       const Option(text: '4.The road narrows from the right hand side', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'what is the minimum age required to get learners license for light vehicle, with mass<3500 & this license is valid for how long ?',
//     options: [
//       const Option(text: '2. 17 years, 18 months', isCorrect: true),
//       const Option(text: '1. 18 years, 18 months', isCorrect: false),
//       const Option(text: '3. 17 years, 12 months', isCorrect: false),
//       const Option(text: '4. 21 years, 18 months', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'you are allowed to unfasten your seatbelt while reversing.this statement is...',
//     options: [
//       const Option(text: '1. False', isCorrect: false),
//       const Option(text: '2. True, only in certain situations', isCorrect: false),
//       const Option(text: '3. Sometimes True', isCorrect: false),
//       const Option(text: '4. True', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'when may you flash headlamps at the vehicle infront of you on a freeway to show that you want to overtake ?',
//     options: [
//       const Option(text: '1.Any place on the freeway', isCorrect: false),
//       const Option(text: '2.When you are in the left habd lane & you want the driver to the left of the edge line marking of the road', isCorrect: false),
//       const Option(text: '3.When you are in the lane furthest to the right on the freeway', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'prohibition sign color codes are:',
//     options: [
//       const Option(text: '1. a black symbol on a white disc with a red border', isCorrect: true),
//       const Option(text: '2. a red, white and black', isCorrect: false),
//       const Option(text: '3.yellow and white disc', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'The tyre thread on all vehicles must be atleast...',
//     options: [
//       const Option(text: 'a. 2mm Deep', isCorrect: false),
//       const Option(text: 'b. 1 mm Deep', isCorrect: true),
//       const Option(text: 'c. 3mm Deep', isCorrect: false),
//       const Option(text: 'd. 4mm Deep', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'You may stop...',
//     options: [
//       const Option(text: 'a. within 9m of the approach side of a pedestrian crossing', isCorrect: false),
//       const Option(text: 'b. anywhere on the freeway', isCorrect: false),
//       const Option(text: 'c. 15m away from a bridge', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'is a passenger vehicle allowed to park in a loading zone ?',
//     options: [
//
//       const Option(text: '1. Yes only to off-load passengers', isCorrect: false),
//       const Option(text: '2. Not at all. ', isCorrect: true),
//       const Option(text: '3. Yes only to load goods', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'When are we allowed to use hazard lights on a light motor vehicle ?',
//     options: [
//       const Option(text: '1.Only to be used if your vehicle breaks down on a public road', isCorrect: true),
//       const Option(text: '2.When you are towing another vehicle', isCorrect: false),
//       const Option(text: '3.To thank another motorist for allowing you to overtake', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'abandoned vehicles may...',
//     options: [
//       const Option(text: '1.Not be removed by anyone', isCorrect: false),
//       const Option(text: '2.Be removed and impunded by a traffic officer', isCorrect: true),
//       const Option(text: '3.Be removed by passenger-bys who feel it is likely to cause of danger', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'The seatbelts have been removed from your vehicle: which rule is applicable here ?',
//     options: [
//       const Option(text: '1.The vehicle may be used on a public road until you replace them', isCorrect: false),
//       const Option(text: '2.The vehicle may not be used on public roads', isCorrect: true),
//       const Option(text: '3.This rule does not apply for vehicles older than 2 years', isCorrect: false),
//       const Option(text: '4.The vehicle may be used on public road', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'Which of the following actions are permissible ?',
//     options: [
//       const Option(text: '1.A passenger may steer the vehicle', isCorrect: false),
//       const Option(text: '3.a baby may travel on the drivers lap while he/she drives', isCorrect: false),
//       const Option(text: '2.None of the above', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'what is the speed limit unless otherwise indicated by a regulatory sign for combination of vehicles with GVM/GCM over 9000kg on a freeway?',
//     options: [
//       const Option(text: 'a.120 km/h', isCorrect: false),
//       const Option(text: 'b. 90 km/h', isCorrect: false),
//       const Option(text: 'c. 50 km/h', isCorrect: false),
//       const Option(text: 'd. 80 km/h', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'what is the color of control signs that tell you to stop, yield or where you are not allowed to enter etc...',
//     options: [
//       const Option(text: '1.white on a blue background', isCorrect: false),
//       const Option(text: '2.white on a green background', isCorrect: false),
//       const Option(text: '3.white on a red background', isCorrect: true),
//
//     ],
//   ),
//   Question(
//     text: 'a load may not project more than ____ to the rear',
//     options: [
//       const Option(text: 'a. 1m', isCorrect: false),
//       const Option(text: 'b 2m', isCorrect: false),
//       const Option(text: 'c. 1.80m', isCorrect: true),
//       const Option(text: 'd. 1.40m', isCorrect: false),
//
//     ],
//   ),
//   Question(
//     text: 'your hooter must be audible for atleast...',
//     options: [
//       const Option(text: 'a. 100m', isCorrect: false),
//       const Option(text: 'b 80m', isCorrect: false),
//       const Option(text: 'c. 90m', isCorrect: true),
//       const Option(text: 'd. 70m', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'which of the following statement is incorrect ?',
//     options: [
//       const Option(text: '1. You may stop to pick up hitch-hikers on the freeway', isCorrect: true),
//       const Option(text: '2.You may not stop in a tunnel', isCorrect: false),
//       const Option(text: '3.You may park on a traffic island', isCorrect: false),
//       const Option(text: '4.You may not drive through a red light traffic signal', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'what is the general speed limit on a road that is not a freeway/an urban road unless otherwise',
//     options: [
//       const Option(text: 'a. 60 km ', isCorrect: false),
//       const Option(text: 'b. 100 km', isCorrect: true),
//       const Option(text: 'c. 12 km', isCorrect: false),
//       const Option(text: 'd. 40 km', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'Double white lines separating the two lanes of traffic moving in opposite directions means...',
//     options: [
//       const Option(text: '1.You may cross to acces properly', isCorrect: false),
//       const Option(text: '2.You may overtake if it is safe to do so', isCorrect: false),
//       const Option(text: '3.No traffic may cross the solid lines for any reason', isCorrect: true),
//       //const Option(text: 'speed up', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'The flat raised hand of a traffic officer means...',
//     options: [
//       const Option(text: '1.slow down', isCorrect: false),
//       const Option(text: '2.proceed with caution', isCorrect: false),
//       const Option(text: '3.it is a greeting', isCorrect: false),
//       const Option(text: '4.Stop', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'What must you do if you missed an exit on a freeway ?',
//     options: [
//       const Option(text: '1.Reverse to the turn off', isCorrect: false),
//       const Option(text: '2.Carry on until you can safely exit the freeway by means of another exit', isCorrect: true),
//       const Option(text: '3.Make a U-Turn and go back', isCorrect: false),
//       const Option(text: '4.Switch lanes at any point and go back.', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'what should you do if you are being overtaken by another vehicle ?',
//     options: [
//       const Option(text: '1.Release the accelerator pedal and speed down if necessary', isCorrect: true),
//       const Option(text: '2.Apply your breaks and pull over the left side of the road', isCorrect: false),
//       const Option(text: '3.Accelerate', isCorrect: false),
//       const Option(text: '4.Sound your hooter to stop the other vehicle from overtaking you.', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'what does a flashing red light, at a traffic light tell you ?',
//     options: [
//       const Option(text: '1.to watch out for pedestrians', isCorrect: false),
//       const Option(text: '2.that you should treat this intersection as a 4 way stop', isCorrect: true),
//       const Option(text: '3.that there was an accident', isCorrect: false),
//       const Option(text: '4.to go at a slower speed', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'what are the functions of guidance and information signs ?',
//     options: [
//       const Option(text: '1.They control and direct traffic flows', isCorrect: false),
//       const Option(text: '2.They warn you of potential hazards', isCorrect: false),
//       const Option(text: '3.They indicate speed limits', isCorrect: false),
//       const Option(text: '4.They serve as navigation aids', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'which of the following pedestrians has right of way ?',
//     options: [
//       const Option(text: '1. a person waiting at a pedestrian crossing', isCorrect: true),
//       const Option(text: '2. a person crossing the road at a distance of 20m from a pedestrian crossing', isCorrect: false),
//       const Option(text: '3. a person waiting at a red traffic light', isCorrect: false),
//       const Option(text: '4. an elderly person crossing slowly on an amber traffic light', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'if your vehicles drivers seatbelt has been broken, you may use your vehicle on a public road.',
//     options: [
//       const Option(text: 'a. Yes, only if you have a letter from garage', isCorrect: false),
//       const Option(text: 'b. Maybe', isCorrect: false),
//       const Option(text: 'c. Yes', isCorrect: false),
//       const Option(text: 'd. No', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'how often should you look in your rear mirror while driving ?',
//     options: [
//       const Option(text: '1. at least every 5 to 8 seconds', isCorrect: true),
//       const Option(text: '2. at least every 10 to 15 seconds', isCorrect: false),
//       const Option(text: '3. at least every 15 to 20 seconds', isCorrect: false),
//       const Option(text: '4. you do not need to look at your mirrors while driving.', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'you are approaching a traffic light, th light is amber.This means that you must...',
//     options: [
//       const Option(text: '1.Cross the intersection if there is no other traffic', isCorrect: false),
//       const Option(text: '2.Cross the intersection if there are no pedestrians', isCorrect: false),
//       const Option(text: '3.If safe so stop before the stop line and wait for the green light', isCorrect: true),
//       const Option(text: '4.Reverse your vehicle', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'where may you not reverse a vehicle ?, select the correct Comobination.',
//     options: [
//       const Option(text: '1.On freeways, Down one way streets', isCorrect: true),
//       const Option(text: '2.On a public road, In an Urban area', isCorrect: false),
//       const Option(text: '3.In a parking area, At an intersection', isCorrect: false),
//
//     ],
//   ),
//   Question(
//     text: 'your goods vehicle has broken on a public road, you may display an emergency sign at least___metres',
//     options: [
//       const Option(text: 'a. 45 m', isCorrect: true),
//       const Option(text: 'b. 30 m', isCorrect: false),
//       const Option(text: 'c. 20 m', isCorrect: false),
//
//     ],
//   ),
//   Question(
//     text: 'is it advisable to drive with your foot on the clutch pedal ?',
//     options: [
//       const Option(text: '1.yes, because it will enable you to achieve smooth movement', isCorrect: false),
//       const Option(text: '2.Yes, it is a place to rest your foot', isCorrect: false),
//       const Option(text: '3.No, because it could cause unnecessary wear on your clutch and pressure plate', isCorrect: true),
//       //const Option(text: 'speed up', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'Which controls would you use to make a sharp turn ?',
//     options: [
//       const Option(text: 'a. 1, 3, 4, 10, 6, 8 & 9', isCorrect: true),
//       const Option(text: 'b. 3, 4, 5, 9 & 10', isCorrect: false),
//       const Option(text: 'c. 1, 3, 5, 6 & 8', isCorrect: false),
//       const Option(text: 'd. all of the above', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'which controls would you use to check if there is a vehicle behind & in the side ?',
//     options: [
//       const Option(text: 'a. 1 only', isCorrect: false),
//       const Option(text: 'b. 2 only', isCorrect: false),
//       const Option(text: 'c. 3 only', isCorrect: false),
//       const Option(text: 'd. 1 & 3', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'To make your vehicle turn, use...',
//     options: [
//       const Option(text: 'a. 4', isCorrect: true),
//       const Option(text: 'b. 2', isCorrect: false),
//       const Option(text: 'c. 5', isCorrect: false),
//       const Option(text: 'd. 2', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'To make your vehicle move faster, use...',
//     options: [
//       const Option(text: 'a. 2', isCorrect: false),
//       const Option(text: 'b. 10', isCorrect: true),
//       const Option(text: 'c. 6', isCorrect: false),
//       const Option(text: 'd. 1', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'To change gears , use...',
//     options: [
//
//       const Option(text: 'a. 7', isCorrect: false),
//       const Option(text: 'b. 9', isCorrect: false),
//       const Option(text: 'c. 3', isCorrect: false),
//       const Option(text: 'd. 6 & 8', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'which controls prevents your parked vehicle from moving ?',
//     options: [
//       const Option(text: 'a. 8', isCorrect: false),
//       const Option(text: 'b. 2', isCorrect: false),
//       const Option(text: 'c. 1', isCorrect: false),
//       const Option(text: 'd. 7', isCorrect: true),
//     ],
//   ),
//   Question(
//     text: 'To show other vehicles that you are going to turn, use control...',
//     options: [
//       const Option(text: 'a. 5', isCorrect: true),
//       const Option(text: 'b. 2', isCorrect: false),
//       const Option(text: 'c. 9', isCorrect: false),
//       const Option(text: 'd. 6', isCorrect: false),
//     ],
//   ),
//   Question(
//     text: 'You intend moving forward from from a parked position, you must..',
//     options: [
//       const Option(text: 'a. Switch on headlamp', isCorrect: false),
//       const Option(text: 'b. Switch on indicator to warn other road users', isCorrect: true),
//       const Option(text: 'c. Switch on hazard lamps', isCorrect: false),
//     ],
//   ),
//
//
// ];
//
//
//
//
