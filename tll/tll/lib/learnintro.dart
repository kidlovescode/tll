import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:tll/Category/ListCategory.dart';
//Display video for learning.
const int topiclau = 1;
void main() => runApp(VideoApp(topiclau));
class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState(topiclau);
  VideoApp(int topic){



  }


  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _VideoAppState extends State<VideoApp> {
  int topic;
   _VideoAppState(int topic){
       this.topic = topic;
   }
  VideoPlayerController _controller;
  int intro;
  String filename;
  @override
  void initState() {
    super.initState();
    if (topic == 1)
         filename = "http://www.inspireadviser.com/gamethai/video/vcat1_1.mp4";
    else
         filename = "http://www.inspireadviser.com/gamethai/video/vcat1_1.mp4";
    _controller = VideoPlayerController.network(filename)
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
                    ? AspectRatio( aspectRatio: _controller.value.aspectRatio,
                 child: VideoPlayer(_controller),
                )
                : Container(
                width:300, height: 250,

                ),

              ),

              Row(children: <Widget>[

                IconButton(
                  icon: Icon(Icons.home),
                  iconSize:80,
                  tooltip: 'กลับเมนู',
                  onPressed: () {
                    setState(() {
                      // _volume += 10;
                      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new ListCategory1()));


                    });
                  },

                ),
                IconButton(
                  icon: Icon(Icons.assignment),
                  iconSize:80,
                  tooltip: 'เรียนรู้',
                  onPressed: () {
                    setState(() {
                      // _volume += 10;
                    });
                  },

                ),
                IconButton(
                  icon: Icon(Icons.assessment),
                  iconSize:80,
                  tooltip: 'ทดสอบ',
                  onPressed: () {
                    setState(() {
                      // _volume += 10;
                    });
                  },

                ),
              ]),
       Container(
    width: 300,
    height: 350,

     child:  Text('หมายถึง  คำที่ใช้เรียกชื่อ  คน  สัตว์  พืช  สิ่งของ  สถานที่  ใช้เรียกสิ่งมีชีวิต  และสิ่งไม่มีชีวิต  ทั้งที่เป็นรูปธรรมที่สามารถจับต้องได้  และนามธรรมที่ไม่สามารถจับต้องได้  ตัวอย่างคำนามเช่น  คน   ปลา มะม่วง ไก่  ประเทศไทย  จังหวัดนนทบุรี  การออกกำลังกาย  การศึกษา  ความดี  ความงาม   เป็นต้น   '),

    ),





        /*  Center(

          child: _controller.value.initialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,

            child: VideoPlayer(_controller),

          )
              : Container(




          ),

        ),*/
            ]),
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