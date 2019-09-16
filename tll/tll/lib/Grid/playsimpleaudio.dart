import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


typedef void OnError(Exception exception);

//const kUrl = "http://www.inspireadviser.com/gamethai/audio/sal1.m4a";
const kUrl2 = "http://www.inspireadviser.com/gamethai/audio/sal1.m4a";
String kUrl = "";
void main() {
  runApp(new MaterialApp(home: new Scaffold(body: new AudioApp("http://www.inspireadviser.com/gamethai/audio/sal1.m4a"))));
}

enum PlayerState { stopped, playing, paused }

class AudioApp extends StatefulWidget {
  //String kUrl = "";
  String soundau;
  AudioApp(String  audio){
     soundau = audio;
     kUrl = audio;
     print(' link '+kUrl);

   }

  @override
  _AudioAppState createState() => new _AudioAppState(soundau);
}

class _AudioAppState extends State<AudioApp> {
  Duration duration;
  Duration position;

  AudioPlayer audioPlayer;

  String localFilePath;
  String thissound;
  _AudioAppState(String ao){
       thissound = ao;
  }

  PlayerState playerState = PlayerState.stopped;

  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;


   bool isMuted = false;

  StreamSubscription _positionSubscription;
  StreamSubscription _audioPlayerStateSubscription;

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _audioPlayerStateSubscription.cancel();
    audioPlayer.stop();
    super.dispose();
  }

  void initAudioPlayer() {
    audioPlayer = new AudioPlayer();
    _positionSubscription = audioPlayer.onAudioPositionChanged
        .listen((p) => setState(() => position = p));
    _audioPlayerStateSubscription =
        audioPlayer.onPlayerStateChanged.listen((s) {
          if (s == AudioPlayerState.PLAYING) {
            setState(() => duration = audioPlayer.duration);
          } else if (s == AudioPlayerState.STOPPED) {
            onComplete();
            setState(() {
              position = duration;
            });
          }
        }, onError: (msg) {
          setState(() {
            playerState = PlayerState.stopped;
            duration = new Duration(seconds: 0);
            position = new Duration(seconds: 0);
          });
        });
  }

  Future play() async {
  //  print(kUrl);
    //await audioPlayer.play(kUrl);
    await audioPlayer.play(thissound);
    setState(() {
      playerState = PlayerState.playing;
    });
  }

  Future _playLocal() async {
    await audioPlayer.play(localFilePath, isLocal: true);
    setState(() => playerState = PlayerState.playing);
  }

  Future pause() async {
    await audioPlayer.pause();
    setState(() => playerState = PlayerState.paused);
  }

  Future stop() async {
    await audioPlayer.stop();
    setState(() {
      playerState = PlayerState.stopped;
      position = new Duration();
    });
  }

  Future mute(bool muted) async {
    await audioPlayer.mute(muted);
    setState(() {
      isMuted = muted;
    });
  }

  void onComplete() {
    setState(() => playerState = PlayerState.stopped);
  }

  Future<Uint8List> _loadFileBytes(String url, {OnError onError}) async {
    Uint8List bytes;
    try {
      bytes = await readBytes(url);
    } on ClientException {
      rethrow;
    }
    return bytes;
  }

  Future _loadFile() async {
    final bytes = await _loadFileBytes(kUrl,
        onError: (Exception exception) =>
            print('_loadFile => exception $exception'));

   // final dir = await getApplicationDocumentsDirectory();
    //final file = new File('${dir.path}/audio.mp3');
    final file = new File('audio/audio.mp3');
    await file.writeAsBytes(bytes);
    if (await file.exists())
      setState(() {
        localFilePath = file.path;
      });
  }

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
              onPressed: isPlaying ? null : () => play(),
              iconSize: 40.0,
              icon: new Icon(Icons.play_arrow),
              color: Colors.cyan),
          /*
          new IconButton(
              onPressed: isPlaying ? () => pause() : null,
              iconSize: 64.0,
              icon: new Icon(Icons.pause),
              color: Colors.cyan),
          new IconButton(
              onPressed: isPlaying || isPaused ? () => stop() : null,
              iconSize: 64.0,
              icon: new Icon(Icons.stop),
              color: Colors.cyan),*/
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