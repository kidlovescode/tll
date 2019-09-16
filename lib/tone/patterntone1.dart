import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tll/audio/playtone.dart';
void main() => runApp(new WordTone());

class WordTone extends StatelessWidget {
  String wordterm;
  WordTone(){
    wordterm = "";
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Experiments',
      theme: new ThemeData(
      ),
      home: new WordToneHome(wordterm),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WordToneHome extends StatelessWidget {
  String term;
  WordToneHome(word){
    term = word;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            elevation: 0.0,
            title: new Text("ผันวรรณยุกต์",
              style: new TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  letterSpacing: 1.0
              ),
            ),
            backgroundColor: new Color(0xFF2979FF),
            centerTitle: true
        ),
        body:new HomeContent()
    );
  }
}
class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}
class _HomeContentState extends State<HomeContent>{
  double percentage;
  String leveltext="แตะ";
  var wleveltext=["กา - เสียงสามัญ","ก่า - เสียงตรี","ก้า - เสียงโท","ก๊า - - เสียงเอก","ก๋า - เสียงจัตวา" ];
  int w = 0 ;
  @override
  void initState() {
    super.initState();
    setState(() {
      percentage = 0.0;
    });

  }
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
          height: 400.0,
          width: 400.0,
          child:
          Column(
            children: <Widget>[
              Text(wleveltext[w], style: new TextStyle(

                fontSize: 40,

              ),),

              Expanded(
                child: FittedBox(
                  fit: BoxFit.contain, // otherwise the logo will be tiny
                  child:
                  new CustomPaint(
                    foregroundPainter: new MyPainter(
                        lineColor: Colors.amber,
                        completeColor: Colors.blueAccent,
                        completePercent: percentage,
                        width: 8.0
                    ),
                    child: new Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: new RaisedButton(color: Colors.white,
                          shape: new CircleBorder(),
                          child: new Image.asset("images/handpress.jpg", width: 50, height: 100,),
                          onPressed: (){



                            setState(() {
                              var level = (percentage.toDouble() + 20) /20;

                              if (level == 1)      leveltext  =  "สามัญ";
                              if (level == 2)      leveltext  =  "โท";
                              if (level == 3)      leveltext  =  "ตรี";
                              if (level == 4)      leveltext  =  "เอก";
                              if (level == 5)      leveltext  =  "จัตวา";

                              percentage += 20.0;
                              if(percentage>100.0){
                                percentage=0.0;
                                w = 0;
                                leveltext = 'แตะ';

                              }else{
                                w = level.toInt() - 1 ;
                                //new AudioTone(level.toInt());
                              }
                            });
                          }),
                    ),
                  ),

                ),
              ),
            ],
          )

      ),
    );
  }
}
class MyPainter extends CustomPainter{
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  MyPainter({this.lineColor,this.completeColor,this.completePercent,this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center  = new Offset(size.width/2, size.height/2);
    double radius  = min(size.width/2,size.height/2);
    canvas.drawCircle(
        center,
        radius,
        line
    );
    double arcAngle = 2*pi* (completePercent/100);
    canvas.drawArc(
        new Rect.fromCircle(center: center,radius: radius),
        -pi/2,
        arcAngle,
        false,
        complete
    );
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
