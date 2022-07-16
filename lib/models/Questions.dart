class Question {
  final int id, answer;
  //final string pic;
  final String question;
  final List<String> options;

  Question({required this.id/*, required this.pic*/,required this.question, required this.answer, required this.options});
}

const List sample_data = [
  {
    "id": 1,
    //"pic": "1.png",
    "question":
    "sign-----commands that",//1
    "options": ['a.overtake','b.drive to the right','c.drive in direction of sign'],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question": "sign----tells you that",
    "options": ["a.switch on head lamp","b.dip head lamps","c.switch off head lamp"],
    "answer_index": 0,
  },
  {
    "id": 3,
    "question": "sign----prohibits you from",
    "options": ["a.Turning left","b.making U turn","c.Turning right"],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "sign-----tells you that",
    "options": ["a.proceed carefully","b.no delivery vehicle may enter","c.no vehicle may proceed past sign"],
    "answer_index": 2,
  },
  {
    "id": 5,
    "question": "sign-----tells you that",
    "options": ["a.10-12 seconds","b.20-25 seconds","c.1001-1002 seconds"],
    "answer_index": 2,
  },
];
