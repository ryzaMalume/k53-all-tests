//import 'package:audioplayers/aud';

import 'package:flutter/material.dart';
//import 'package:audioplayer/audioplayer.dart';
import 'package:just_audio/just_audio.dart';

class Play extends StatefulWidget {
  const Play({Key? key}) : super(key: key);

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  //final player = AudioPlayer();
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 60,
              color: Colors.lightBlue,
              child: ElevatedButton(
                onPressed: () async {
                  await player.setAsset('assets/audio/dB.mp3');
                  player.play();
                },
                child: Text('Correct'),
              ),
            ),
            SizedBox(height: 25,),
            Container(
              width: 300,
              height: 60,
              color: Colors.red,
              child: ElevatedButton(
                onPressed: () async {
                  await player.setAsset('assets/audio/oasis.mp3');
                  player.play();
                },
                child: Text('Wrong'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
