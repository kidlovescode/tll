import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fluttery_audio/fluttery_audio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new ExampleApp()));
}

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => new _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  final String url ="https://api.soundcloud.com/tracks/260578593/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P";
  Audio audio;

  @override
  initState() {
    super.initState();
    audio = new Audio(
      audioUrl: url,
      playerBuilder: (BuildContext context, AudioPlayer player, Widget child) {
        return audioPlayer(player);
      },
    );
  }

  @override
  void dispose() {
    audio = null;
  }

  Audio fetchMusicPlayer() {
    return audio;
  }

  Widget audioPlayer(AudioPlayer player) {
    player.loadMedia(Uri.parse(url));
    player.play();
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          child: fetchMusicPlayer(),
        ),
      ),
    );
  }
}