import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tll/audio/playtone.dart';
import 'package:flutter/widgets.dart';
import 'package:tll/progress/intervalprogressbar.dart';

void main() => runApp(new ToneMarkPractise());
var scoreNumber=0;
var questionNumber  = 0;
var ptone = new PractiseTone();
var Levelind = 0;
var leveltext;
double percentage;
var colorLevel = Colors.black12;
var toneau =ptone.audioTone[questionNumber][0];

int w = 0 ;
List<int> l0 = [0];
List<int> l1 = [1];
List<int> l2 = [2];
List<int> l3 = [3];
List<int> l4 = [4];
List<int> l5 = [5];
List<int> Lprogress;
class PractiseTone{
  var wleveltext=[["กา", "กา - เสียงสามัญ","ก่า - เสียงตรี","ก้า - เสียงโท","ก๊า - - เสียงเอก","ก๋า - เสียงจัตวา" ],
    ["ขา","- - เสียงสามัญ","ข่า - เสียงตรี","ข้า - เสียงโท","ข๊า - เสียงเอก","ขา - เสียงจัตวา" ]];
  var audioTone = [
  ["audio/tone/tal1_1.m4a", "audio/tone/tal1_1.m4a", "audio/tone/tal1_2.m4a", "audio/tone/tal1_3.m4a", "audio/tone/tal1_4.m4a","audio/tone/tal1_5.m4a"],
    [ "audio/tone/tal2_5.m4a", "", "audio/tone/tal2_2.m4a", "audio/tone/tal2_3.m4a", "audio/tone/tal2_4.m4a","audio/tone/tal2_5.m4a"]
  ];
  var img = ["pic/game/animal4.png","pic/game/body11.png"];

}

class ToneMarkPractise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Experiments',
      theme: new ThemeData(
      ),
      home: new Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Home extends StatelessWidget {
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
        body:new HomeContent(),
      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.deepOrange,
        onPressed: () {

              //setState(() {
                Navigator.pop(context);
             // });
            },
        child: Icon(
          Icons.exit_to_app,
        ),

      ),

    );
  }
}
class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>{

  @override
  void initState() {
    super.initState();
    setState(() {
      percentage = 0.0;
       Lprogress = l0;
    });

  }
  Widget buildProgressBars() {
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Lprogress.map<Widget>((i) {
            return Padding(
                padding: EdgeInsets.only(right: 10),
                child: IntervalProgressBar(
                    direction: IntervalProgressDirection.vertical,
                    max: 5,
                    progress: i,
                    intervalSize: 2,
                    size: Size(12, 200),
                    highlightColor: Colors.red,
                    defaultColor: Colors.black12,
                    intervalColor: Colors.transparent,
                    intervalHighlightColor: Colors.transparent,
                    reverse: true,
                    radius: 0));
          }).toList()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(

        height: 700.0,
        width: 700.0,
        child:
        Column(
          children: <Widget>[

            new   Image.network("http://www.kidlovescode.com/gamethai/"+ptone.img[questionNumber], width:200, height:200),
            Text(ptone.wleveltext[questionNumber][Levelind], style: new TextStyle(

              fontSize: 40,

            ),


            ),
           new AudioTone("http://www.kidlovescode.com/gamethai/"+toneau),


            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            new Container(

                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(20.0),
                  color: Colors.blueAccent[100],
                ),
            child:    Row(

              children: <Widget>[

                Padding(
                 padding: const EdgeInsets.all(30.0)),
                buildProgressBars(),
                Padding(
                    padding: const EdgeInsets.all(20.0)),
                FittedBox(
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
                      padding: const EdgeInsets.all(10.0),
                      child: new RaisedButton(color: Colors.white,
                          shape: new CircleBorder( ),
                          child: new Image.asset("images/handpress.jpg", width: 100, height: 100,),
                          onPressed: (){

                            //if (level== 5 )

                            setState(() {

                            if(percentage==100.0){
                                percentage=0.0;
                                Levelind = 0;
                                leveltext = '';
                                 Lprogress = l0;
                            }
                              var level = (percentage.toDouble() + 20) /20;

                              if (level == 1){      leveltext  =  "สามัญ"; Lprogress = l1;}
                              if (level == 2) {     leveltext  =  "โท";Lprogress = l2;}
                              if (level == 3)  {    leveltext  =  "ตรี";Lprogress = l3;}
                              if (level == 4) {     leveltext  =  "เอก";Lprogress = l4;}
                              if (level == 5) {     leveltext  =  "จัตวา";Lprogress = l5;}
                              Levelind = level.toInt() ;

                              //l = l.add(Levelind.toInt());
                              toneau = ptone.audioTone[questionNumber][Levelind];
                              print(toneau);
                              percentage += 20.0;
                              if(percentage<=100.0){
                                 var audi =   new AudioTone("http://www.kidlovescode.com/gamethai/"+toneau);
                                 audi.play();
                              }
                            });
                          }),
                    ),
                  ),

                ),
                Padding(
                    padding: const EdgeInsets.all(10.0)),
                RaisedButton(


                  onPressed: (){
                    setState(() {
                      updateQuestion();
                    });

                  },
                  child: new
                  /*BoxDecoration(
               image: Image.network("http://www.kidlovecodes.com/gamethai/pic/menu/next.gif"),

              )*/
                  Text("คำถัดไป"),
                  color: Colors.blueAccent,
                  textColor: Colors.white,

                  padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                  splashColor: Colors.grey,
                ),
              ],

            ))



          ]))


    );
  }
  void updateQuestion(){
    setState(() {

      if(questionNumber ==  ptone.wleveltext.length - 1){
        Levelind = 0;
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Practise(score: scoreNumber,)));

      }else{
        questionNumber++;
        percentage=0.0;
        Levelind = 0;
        leveltext = '';
        Lprogress = l0;
        toneau = ptone.audioTone[questionNumber][Levelind];
      }
    });
  }

}


class Practise extends StatelessWidget{
  final int score;
  Practise({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

          body:

          new Container(
            margin: const EdgeInsets.all(15.0),
            child: new Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new MaterialButton(
                  height: 150.0,
                  color: Colors.lightBlue,
                  //  onPressed: startQuiz,
                  child:   new Text("ลองฝึกอีกรอบไหม ? ",
                    style: new TextStyle(
                        fontSize: 35.0
                    ),),

                ),
                new Padding(padding: EdgeInsets.all(30.0)),

                new MaterialButton(
                  color: Colors.green,
                  onPressed: (){
                    questionNumber = 0;
                    scoreNumber = 0;
                    Navigator.pop(context);
                  },
                  child: new Text("เริ่มใหม่",
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                    ),),)

              ],
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: (){
              questionNumber = 0;
              scoreNumber = 0;

              Navigator.pop(context);
            },
            backgroundColor: Colors.deepOrange,
            /*onPressed: () {

              setState(() {

              });
            },*/

            child: Icon(
              Icons.exit_to_app,
            ),

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
