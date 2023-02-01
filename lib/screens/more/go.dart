import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  int count = 10;
  String qNa = '';
  bool start = false;
  bool done = false;
  double percentage = 1.0;
  int percentage2 = 0;
  int? dura = 10;
  bool isIt = false;

  //**********************Start******************
  Future<void> printOrderMessage() async {
    print('What is the capital of South Africa ?');
    //qNa = 'What is the capital of South Africa ?';
    setState(() {
      qNa = 'What is the capital of South Africa ?';
    });
    var order = await fetchUserOrder();
    print('The correct answer is $order');
    setState(() {
      qNa = '$order';
      isIt = true;
    });
  }

  Future<String> fetchUserOrder() {
    // Imagine that this function is more complex and slow.
    return Future.delayed(const Duration(seconds: 10), () => 'Pretoria');
  }

  countSeconds(int s){
    count = s;
    for (var i = s; i >0; i--){
      Future.delayed(Duration(seconds: i), () {

        setState(() {
          count--;
          percentage = count / 6 ;
          percentage = percentage*100;
          percentage2 = percentage.round();
        });
        print(count);

      });

    }

  }
  //**********************End********************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text("Start"),
                onPressed: start ? null : ()async{
                  start = true;
                  countSeconds(dura!);
                  await printOrderMessage();
                  //isIt = false;
                  isIt ? Navigator.push(context, MaterialPageRoute(builder: (BuildContext _)=>Third())) : print('wait...');
                } ,
              ),
              isIt ? ElevatedButton(
                child: Text("Reset"),
                onPressed: start ? ()async{

                  setState(() {
                    start = false;
                    isIt = false;
                  });
                } :null,
              ) : SizedBox.shrink(),
              // done ? SizedBox.shrink(): Text(
              //   '$count',
              //   style: Theme.of(context).textTheme.headline4,
              // ),
              start ? CircularPercentIndicator(
                animation: true,
                animationDuration: dura! * 1000,
                radius: 40,
                lineWidth: 5,
                percent: 1.0,
                progressColor: Colors.deepPurple.shade200,
                backgroundColor: Colors.deepOrange,
                circularStrokeCap: CircularStrokeCap.butt,
                reverse: true,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$count"),
                    // Text("second(s)"),
                  ],
                ),
              ) : SizedBox.shrink(),
              Text(qNa,style: TextStyle(fontSize: isIt ? 40 : 20,color: isIt ? Colors.green : Colors.red),),
            ],
          ),
        ),
      ),
    );
  }
}
class Third extends StatelessWidget {
  const Third({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('This is the third Page'),
            ],
              ),

        ),
      ),
    );
  }
}
