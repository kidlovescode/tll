import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


typedef void OnError(Exception exception);

//const kUrl = "http://www.inspireadviser.com/gamethai/audio/sal1.m4a";

String kUrl = "";
void main() {
  runApp(new MaterialApp(home: new Scaffold(body: new AudioTryagain())));
}

enum PlayerState { stopped, playing, paused }

class AudioTryagain extends StatelessWidget {
  //String kUrl = "";
  String soundau ="http://www.kidlovescode.com/gamethai/audio/tryagain.m4a" ;

  AudioPlayer audioPlayer;
  AudioTryagain(){


     turnOn();
   }
//  @override
//  _AudioAppState createState() => new _AudioAppState(soundau);

//}
turnOn(){
   audioPlayer = new AudioPlayer();
   audioPlayer.play(soundau);
}
  Future<void> play() async {
    await audioPlayer.play(soundau);
    //  setState(() => playerState = PlayerState.playing);
  }

  Future<void> pause() async {
    await audioPlayer.pause();
    //   setState(() => playerState = PlayerState.paused);
  }

  Future<void> stop() async {
    await audioPlayer.stop();
    //  setState(() {
    //    playerState = PlayerState.stopped;
    //    position = new Duration();
    //  });
  }
//class _AudioAppState extends State<AudioApp> {
  Duration duration;
  Duration position;

//  AudioPlayer audioPlayer;

  String localFilePath;





  PlayerState playerState = PlayerState.stopped;

  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;


   bool isMuted = false;

  StreamSubscription _positionSubscription;
  StreamSubscription _audioPlayerStateSubscription;

//  @override
//  void initState() {
//    super.initState();
//    initAudioPlayer();
//  }

 // @override
 // void dispose() {
 //   _positionSubscription.cancel();
 //   _audioPlayerStateSubscription.cancel();
 //   audioPlayer.stop();
 //   super.dispose();
 // }

/*  void initAudioPlayer() {
    audioPlayer = new AudioPlayer();
    _positionSubscription = audioPlayer.onAudioPositionChanged
        .listen((p) => setState(() => position = p));
    _audioPlayerStateSubscription =
        audioPlayer.onPlayerStateChanged.listen((s) {
          if (s == AudioPlayerState.PLAYING) {
            setState(() => duration = audioPlayer.duration);
          } else if (s == AudioPlayerState.STOPPED) {
   //         onComplete();
   //         setState(() {
              position = duration;
            });
          }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}, onError: (msg) {
     //     setState(() {
            playerState = PlayerState.stopped;
            duration = new Duration(seconds: 0);
            position = new Duration(seconds: 0);
          });
        });
  }
*/


  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Material(
         //   elevation: 1.5,
            color: Colors.grey[50],
            child: new Center(
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new Material(child: _buildPlayer()),
                    localFilePath != null
                        ? new Text(localFilePath)
                        : new Container(),

                  ]),
            )));
  }

  Widget _buildPlayer() => new Container(
      padding: new EdgeInsets.all(1.0),
      child:
        new Row(mainAxisSize: MainAxisSize.min, children: [
          new IconButton(
              onPressed: isPlaying ? null : () => this.play(),
              iconSize: 40.0,
              icon: new Icon(Icons.play_arrow),
              color: Colors.cyan),

          new IconButton(
              onPressed: isPlaying ? () => pause() : null,
              iconSize: 40.0,
              icon: new Icon(Icons.pause),
              color: Colors.cyan),
          new IconButton(
              onPressed: isPlaying || isPaused ? () => stop() : null,
              iconSize: 40.0,
              icon: new Icon(Icons.stop),
              color: Colors.cyan),
        ]),
       /* duration == null
            ? new Container()
            : new Slider(
            value: position?.inMilliseconds?.toDouble() ?? 0.0,
            onChanged: (double value) =>
                audioPlayer.seek((value / 1000).roundToDouble()),
            min: 0.0,
            max: duration.inMilliseconds.toDouble()),  */


      );
}

