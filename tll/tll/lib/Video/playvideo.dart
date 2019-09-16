import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

void main() => runApp(VideoApp());

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        "http://www.inspireadviser.com/gamethai/video/raspberry.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body:
        Column(
          children: <Widget>[
            Expanded(

              child: _controller.value.initialized
                  ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,

                child: VideoPlayer(_controller),
              )
                  : Container(

                  ),

              ),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),
            Text('Deliver features faster'),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),
            Text('ส่วนของการอธิบายการเรียนรู้และวัตถุประสงค์'),

            Text('Craft beautiful UIs'),

                IconButton(
              icon: Icon(Icons.assessment),

              tooltip: 'Increase volume by 10',
              onPressed: () {
                setState(() {
                   // _volume += 10;
                });
              },

            ),
            IconButton(
              icon: Icon(Icons.volume_up),

              tooltip: 'Increase volume by 10',
              onPressed: () {
                setState(() {
                  // _volume += 10;
                });
              },

            ),
          ]),



      /*  Center(

          child: _controller.value.initialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,

            child: VideoPlayer(_controller),

          )
              : Container(




          ),

        ),*/
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),

        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}