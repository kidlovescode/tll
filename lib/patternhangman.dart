import 'package:flutter/material.dart';

import 'dart:math';

import 'dart:ui';

import 'package:tll/audio/playtone.dart';
import 'package:tll/audio/playapplause.dart';
import 'package:flutter/widgets.dart';


void main() => runApp(new Quessing());
var scoreNumber=0;
var questionNumber  = 0;
var ptone = new PractiseTone();
var Levelind = 0;
var leveltext;
double percentage;
var whichpart = 0;
var colorLevel = Colors.black12;
var toneau =ptone.audioTone[questionNumber][0];
var dataalvo= new DataAlphabetVowel();
var replaceQuess =ptone.wquess[questionNumber];

class DataAlphabetVowel{
  var letter = ["ก","ข","ฃ","ค","ฅ","ฆ","ง","จ","ฉ","ช","ซ","ฌ","ญ","ฎ","ฏ","ฐ","ฑ","ฒ",
    "ณ","ด","ต","ถ","ท","ธ","น","บ","ป","ผ","ฝ","พ","ฟ","ภ",
    "ม","ย","ร","ล","ว","ศ","ษ","ส","ห","ฬ","อ","ฮ"];
  var vowel = ["ะ","า","   ิ","  ี ","   ึ","  ื","  ุ ","  ู ","เ","แ"," โ ","  ั ", " ำ "," ใ ", " ไ "," ' ","  ้ ","  ๊ ","  ๋","  ็ ","  ์ "];


}

class PractiseTone{
  //wquess = number of corrects
  var wquess=[4,4];
  var posquess = [['ส',13,'อ',14,'ผ',15,'า',16],
                  ['ป',12,'า',13,'ก',14,'า',16]   ];
  var quessr =[["","", "","   ื้ " ,"", "   ้ ","","", "","",
               "","", "เ","_","_","_","_","", "","",
               "","", "","","", "","","", "",""]

   ];
  var wanswer = ["เสื้อผ้า","ปากกา"];
  var audioTone = ["audio/game/hg1.m4a", "audio/game/hg2.m4a"

  ];
  var img = ["pic/game/animal4.png","pic/game/body11.png"];

}

class Quessing extends StatelessWidget {
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
          title: new Text("ทายคำ",
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
  /*    floatingActionButton: FloatingActionButton(

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
*/
    );
  }
}

  class DrawHead extends CustomPainter {
  var Whichp;
     DrawHead(whichpart){
       Whichp = whichpart;
     }
    @override
    void paint(Canvas canvas, Size size) {
      final p1 = Offset(size.width/2, size.height/5+35);
      final p11 = Offset(size.width/2, size.height/5+50);

      final p2 = Offset(size.width/2, 170);
      final p3 = Offset(size.width/2 -30 , 190);
      final p4 = Offset(size.width/2 +30 , 190);
      final p5 = Offset(size.width/2 - 30 , size.height/5+65);
      final p6 = Offset(size.width/2 + 30 , size.height/5+65);

      final p7 = Offset(size.width/2 - 50 , size.height/5+50);
      final p8 = Offset(size.width/2 + 50 , size.height/5+50);





      if (Whichp == 0)
        return;
      final paint = Paint();
      paint.color = Colors.black;
      paint.strokeWidth = 10;

      var center = Offset(size.width / 2, size.height / 9 + 30);


      if (Whichp == 1)
      canvas.drawCircle(center, 30.0, paint);
      if (Whichp == 2){
        canvas.drawCircle(center, 30.0, paint);  //draw head
        canvas.drawLine(p1, p2, paint);
      }
      if (Whichp == 3){
        canvas.drawCircle(center, 30.0, paint);  //draw head
        canvas.drawLine(p1, p2, paint);
        canvas.drawLine(p2, p3, paint);

      }
      if (Whichp == 4){
        canvas.drawCircle(center, 30.0, paint);  //draw head
        canvas.drawLine(p1, p2, paint);
        canvas.drawLine(p2, p3, paint);
        canvas.drawLine(p2, p4, paint);
      }
      if (Whichp == 5){
        canvas.drawCircle(center, 30.0, paint);  //draw head
        canvas.drawLine(p1, p2, paint);
        canvas.drawLine(p2, p3, paint);
        canvas.drawLine(p2, p4, paint);
        canvas.drawLine(p1, p5, paint);

      }
      if (Whichp == 6){
        canvas.drawCircle(center, 30.0, paint);  //draw head
        canvas.drawLine(p1, p2, paint);
        canvas.drawLine(p2, p3, paint);
        canvas.drawLine(p2, p4, paint);
        canvas.drawLine(p11, p5, paint);
        canvas.drawLine(p11, p6, paint);

      }
      if (Whichp == 7){
        canvas.drawCircle(center, 30.0, paint);  //draw head
        canvas.drawLine(p1, p2, paint);
        canvas.drawLine(p2, p3, paint);
        canvas.drawLine(p2, p4, paint);
        canvas.drawLine(p11, p5, paint);
        canvas.drawLine(p11, p6, paint);
        paint.color = Colors.red;
        canvas.drawLine(p11, p7, paint);
        canvas.drawLine(p11, p8, paint);


      }
      //Winner
      if (Whichp == 99){
        var ncenter = Offset(size.width / 2, size.height / 9 + 110);
        paint.color = Colors.yellow;
        var eyel = Offset(size.width / 2 - 30 , size.height / 9 + 80);
        var eyer = Offset(size.width / 2 + 30 , size.height / 9 + 80);

        canvas.drawCircle(ncenter, 100.0, paint);  //draw head
        paint.color = Colors.black;
        canvas.drawCircle(eyel , 5.0, paint);  //draw head
        canvas.drawCircle(eyer , 5.0, paint);  //draw head

        final p22 = Offset(size.width/2 - 60 , 140);
        final p23 = Offset(size.width/2 + 60, 140);
        final rect = Rect.fromLTRB(160, 100, 250, 200);
        final startAngle = 0.0;
        final sweepAngle = 3.14;
        final useCenter = false;
        canvas.drawArc(rect, startAngle , sweepAngle, useCenter, paint);
        //canvas.drawArc( 90,1,true, paint);
       //canvas.drawLine(p22, p23, paint);
      }


      bool shouldRepaint(CustomPainter oldDelegate) => true;
    }
    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
      // TODO: implement shouldRepaint
      return true;
    }
  }

class DrawBody extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final p01 = Offset(size.width/2 , size.height/5 - 25);
    final p02 = Offset(size.width/2 , size.height/5 -20);

    final p1 = Offset(size.width/2 - 50, size.height/5 - 30);
    final p2 = Offset(size.width/2 +150, size.height/5 - 30);
    final p3 = Offset(size.width/2 +150, size.height/5+200);
    final p4 = Offset(size.width/2 +130, size.height/5+200);
    final p5 = Offset(size.width/2 +170, size.height/5+200);


    paint.color = Colors.blue;
    paint.strokeWidth = 10;
    canvas.drawLine(p01, p02, paint);
    canvas.drawLine(p1, p2, paint);
    canvas.drawLine(p2, p3, paint);
    canvas.drawLine(p2, p3, paint);
    canvas.drawLine(p4, p5, paint);


    bool shouldRepaint(CustomPainter oldDelegate) => true;
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}



class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>{
 var answerword = "";
 var manyCorrect=0;
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
               height:800,
            child:
            Column(
                children: <Widget>[


            CustomPaint(

            painter: DrawHead(whichpart),
            foregroundPainter: DrawBody(),

          child: Center(

            child: Container(

              width:400, height: 220,


          ),

        ),),
                 Center(
                    child: Row(
                     children:<Widget>[
                        // drawLetter(ptone.wquess[questionNumber]),


                    Container(
                         width: 50,
                        color: Colors.yellow,
                        child: RaisedButton(
                          color: Colors.yellow,
                         onPressed: () => new AudioTone("http://www.kidlovescode.com/gamethai/"+ptone.audioTone[questionNumber]),
                         child: new Icon(Icons.help),
         //                color: Colors.yellow,
                       ))
                     ]
                    )
                  ),





                  createWord(),
      Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        height: 100.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
               creatBut(0),creatBut(1),creatBut(2),creatBut(3),creatBut(4),creatBut(5),creatBut(6),creatBut(7),
            creatBut(8),creatBut(9),creatBut(10),creatBut(11),creatBut(12),creatBut(13),creatBut(14),creatBut(15),
            creatBut(16),creatBut(17),creatBut(18),creatBut(19),creatBut(20),creatBut(21),creatBut(22),creatBut(23),
            creatBut(24),creatBut(25),creatBut(26),creatBut(27),creatBut(28),creatBut(29),creatBut(30),creatBut(31),
            creatBut(32),creatBut(33),creatBut(34),creatBut(35),creatBut(36),creatBut(37),creatBut(38),creatBut(39),
            creatBut(40),creatBut(41),creatBut(42),creatBut(43)


                ])),
       Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      height: 100.0,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            creatButt(0),creatButt(1),creatButt(2),creatButt(3),creatButt(4),creatButt(5),creatButt(6),creatButt(7),
                            creatButt(8),creatButt(9),creatButt(10),creatButt(11),creatButt(12),creatButt(13),creatButt(14),creatButt(15),
                            creatButt(16),creatButt(17),creatButt(18),creatButt(19)

                          ])),


                ])))
    ;
  }

  drawLetter(wordq){
      for (int i = 0; i< wordq.length;i++){
        drawEachLetter(wordq[i]);
      }
  }
  drawEachLetter(eletter){
    return new Text(eletter, style: TextStyle(fontSize: 40,backgroundColor: Colors.black26),);
  }
  searchInWord(letter){

    if (answerword.contains(letter,0)){return;}
    if (ptone.wanswer[questionNumber].contains(letter,0)){
       replaceInWord(letter);
        answerword =answerword+""+letter;
        manyCorrect++;
        if (manyCorrect == ptone.wquess[questionNumber]){
            whichpart = 99;
        }
      //ptone.wquess[questionNumber] = ptone.wquess[questionNumber].replaceRange(5, 6, letter);
       //ptone.wquess[questionNumber][ptone.wanswer[questionNumber].contains(letter,0)+1 ] = letter ;
         new AudioApplause();
    }else
      {
        whichpart++;
        if (whichpart == 7){
          //End
        }
      }

  }
  replaceInWord(letter){


    for (int i = 0 ; i< ptone.posquess[questionNumber].length;i++, ) {
         if (letter == ptone.posquess[questionNumber][i]){
             ptone.quessr[questionNumber][ptone.posquess[questionNumber][i+1]]  = letter;
         }
    }



  }

  creatBut(index){

    return             Container(
        width: 100.0,
      //  color:  Colors.teal[100 * (index % 9)],
        child:Card(
            shape: RoundedRectangleBorder(side: BorderSide(color:
            Colors.lightGreenAccent[200], width: 5, style: BorderStyle.solid)),
            child:  Container(
                width:100, height:70,
               // color:  Colors.teal[100 * (index % 9)],
                child: RaisedButton(
                //  color: Colors.teal[100 * (index % 9)],
                  onPressed:() =>
                    setState(() =>

                      searchInWord(dataalvo.letter[index])),
                    child:
                      Text(dataalvo.letter[index], style: TextStyle(fontSize: 40), textAlign: TextAlign.center,),
                    )
            )
        )

    );
  }

  creatButt(index){
    return             Container(
        width: 100.0,
      //  color:  Colors.deepOrange[100 * (index % 9)],
        child:Card(
            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blueAccent, width: 5, style: BorderStyle.solid)
            ),
            child:  Container(
                width:100, height:70,

                child: RaisedButton(
                //  color:  Colors.blue,
                  onPressed:() =>
                      setState(() =>
                          searchInWord(dataalvo.vowel[index])),
                    child:
                      Text(dataalvo.vowel[index], style: TextStyle(fontSize: 40), textAlign: TextAlign.center,),

                    )
            )
        )

    );
  }

  createWord(){
    return             Container(
        width: 1200.0,
        height:150,

        child:Column(
             children: <Widget>[
               Row(
                 children: <Widget>[
                   new Container(
                     width:50,height:40,
                     child: ptone.quessr[questionNumber][0]!=""?
                      new Card(
                          color:  Colors.white,
                             child: new Text(ptone.quessr[questionNumber][0],style: TextStyle(fontSize: 40),
                               ),borderOnForeground: true,
                             ): new Container(),


                     decoration: new BoxDecoration(boxShadow: [
                       new BoxShadow(
                       color: Colors.black12,
                       blurRadius: 20.0,
                     )])
                   ),
        new Container(
            width:50,height:40,
            child: ptone.quessr[questionNumber][1]!=""?
            new Card(
              color:  Colors.white,
              child: new Text(ptone.quessr[questionNumber][1],style: TextStyle(fontSize: 40),
              ),borderOnForeground: true,
            ): new Container(),

          decoration: new BoxDecoration(boxShadow: [
              new BoxShadow(
                color: Colors.black12,
                blurRadius: 20.0,
              )]),
        ),
                   new Container(
                       width:50,height:40,
                       child:ptone.quessr[questionNumber][2]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][2],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:40,
                       child:ptone.quessr[questionNumber][3]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][3],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:40,
                       child:ptone.quessr[questionNumber][4]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][4],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:40,
                       child:ptone.quessr[questionNumber][5]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][5],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:40,
                       child:ptone.quessr[questionNumber][6]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][6],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:40,
                       child:ptone.quessr[questionNumber][7]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][7],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   )



                 ],
               ),
               Row(
                 children: <Widget>[
                   new Container(
                       width:50,height:60,
                       child:ptone.quessr[questionNumber][10]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][10],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:60,
                       child:ptone.quessr[questionNumber][11]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][11],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:60,
                       child:ptone.quessr[questionNumber][12]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][12],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:60,
                       child:ptone.quessr[questionNumber][13]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][13],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:60,
                       child:ptone.quessr[questionNumber][14]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][14],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:60,
                       child:ptone.quessr[questionNumber][15]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][15],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:60,
                       child:ptone.quessr[questionNumber][16]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][16],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:60,
                       child:ptone.quessr[questionNumber][17]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][17],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   )

                 ],

               ),
               Row(
                 children: <Widget>[
                   new Container(
                       width:50,height:40,
                       child:ptone.quessr[questionNumber][20]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][20],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:40,
                       child:ptone.quessr[questionNumber][21]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][21],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:40,
                       child:ptone.quessr[questionNumber][22]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][22],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:40,
                       child:ptone.quessr[questionNumber][23]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][23],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:40,
                       child:ptone.quessr[questionNumber][24]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][24],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:40,
                       child:ptone.quessr[questionNumber][25]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][25],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:40,
                       child:ptone.quessr[questionNumber][26]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][26],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   ),
                   new Container(
                       width:50,height:40,
                       child:ptone.quessr[questionNumber][27]!=""?
                       new Card(
                         color:  Colors.white,
                         child: new Text(ptone.quessr[questionNumber][27],style: TextStyle(fontSize: 40),
                         ),borderOnForeground: true,
                       ): new Container(),

                       decoration: new BoxDecoration(boxShadow: [
                         new BoxShadow(
                           color: Colors.black12,
                           blurRadius: 20.0,
                         )])
                   )


                 ],
               )

             ],
            )
         );
  }
  void updateQuestion(){
    setState(() {

      if(questionNumber ==  ptone.wquess.length - 1){
        Levelind = 0;
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Practise(score: scoreNumber,)));

      }else{
        questionNumber++;
        percentage=0.0;
        Levelind = 0;
        leveltext = '';

        //toneau = ptone.audioTone[questionNumber][Levelind];
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
