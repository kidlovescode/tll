
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tll/audio/playapplause.dart';

void main() => runApp(playTone());
String TERM;
var score = 0;
var combineword="";
var whichw1;
var whichw2;
var turn=0;
var playButton = Colors.blue[100];
var colorButton0 = playButton;
var colorButton1 = playButton;
var colorButton2 = playButton;
var colorButton3 = playButton;
var colorButton4 = playButton;
var colorButton5 = playButton;
var colorButton6 = playButton;
var colorButton7 = playButton;
var colorButton8 = playButton;
var colorButton9 = playButton;
var colorButton10 = playButton;
var colorButton11 = playButton;
var colorButton12 = playButton;
var colorButton13 = playButton;
var colorButton14 = playButton;
var answer = new Answer();
class Answer{
  var comword = ["แมวน้ำ","ไฟฟ้า","กาดำ","คอห่าน","แม่บ้าน","เข็มทิศ","ม้าเร็ว"];
  var ch =     ["ม้า","ดำ","กา","ไฟ","บ้าน","แมว","น้ำ","ฟ้า","เข็ม","แม่","ทิศ","เร็ว","ห่าน","คอ",""];  //the last one is center
  var img = ["pic/game/animal1.jpg","pic/game/color1.jpg","pic/game/object1.jpg","pic/game/event1.jpg","pic/game/object2.jpg","pic/game/animal2.png","pic/game/event2.png","pic/game/env1.png",
    "pic/game/object2.png", "pic/game/people1.png","pic/game/other1.png","pic/game/action1.png","pic/game/animal3.png","pic/game/body1.png",""];

  var quest =["คำประสม"];

}
class playTone extends StatefulWidget {

  @override
  _playToneState createState() => _playToneState();
}

class  _playToneState extends State<playTone> {

  Color  rightButton = new Color.fromARGB(155, 173, 213, 107) ;
  Color  wrongButton = new Color.fromARGB(155, 246, 95, 107);

  final  playButton = new Color.fromARGB(155,116, 108, 244);

  void initState() {
    super.initState();
    setState(() {
      //colorButton = playButton;
    });

  }
  void _setColorButton() {
    super.initState();
    setState(() {
      //colorButton = rightButton;

    });

  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('คำประสม'),

        ),
        body: Center(

            child: CustomScrollView(

              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20.0),

                  sliver: SliverGrid.count(
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: <Widget>[
                  new RaisedButton(
                  color: colorButton0,
                    onPressed: () =>
                        setState(() =>
                            _doCheck(0,answer.ch[0])
                          //    colorb = chtext == answer ? Colors.green: Colors.red

                        ),
                    child: Container(
                      child: new Image.network(
                        "http://www.kidlovescode.com/gamethai/" + answer.img[0], ),
                    ),

                    //    colorb = chtext == answer ? Colors.green: Colors.red

                  ),
          new RaisedButton(
          color: colorButton1,
          onPressed: () =>
              setState(() =>
                  _doCheck(1,answer.ch[1])
                //    colorb = chtext == answer ? Colors.green: Colors.red

              ),
          child: Container(
            child: new Image.network(
              "http://www.kidlovescode.com/gamethai/" + answer.img[1], ),
          ),

          //    colorb = chtext == answer ? Colors.green: Colors.red

        ),
                    new RaisedButton(
                      color: colorButton2,
                      onPressed: () =>
                          setState(() =>
                              _doCheck(2,answer.ch[2])
                            //    colorb = chtext == answer ? Colors.green: Colors.red

                          ),
                      child: Container(
                        child: new Image.network(
                          "http://www.kidlovescode.com/gamethai/" + answer.img[2], ),
                      ),

                      //    colorb = chtext == answer ? Colors.green: Colors.red

                    )                      ,
                    new RaisedButton(
                      color: colorButton3,
                      onPressed: () =>
                          setState(() =>
                              _doCheck(3,answer.ch[3])
                            //    colorb = chtext == answer ? Colors.green: Colors.red

                          ),
                      child: Container(
                        child: new Image.network(
                          "http://www.kidlovescode.com/gamethai/" + answer.img[3], ),
                      ),

                      //    colorb = chtext == answer ? Colors.green: Colors.red

                    ),
                    new RaisedButton(
                      color: colorButton4,
                      onPressed: () =>
                          setState(() =>
                              _doCheck(4,answer.ch[4])
                            //    colorb = chtext == answer ? Colors.green: Colors.red

                          ),
                      child: Container(
                        child: new Image.network(
                          "http://www.kidlovescode.com/gamethai/" + answer.img[4], ),
                      ),

                      //    colorb = chtext == answer ? Colors.green: Colors.red

                    ),
                    new RaisedButton(
                      color: colorButton5,
                      onPressed: () =>
                          setState(() =>
                              _doCheck(5,answer.ch[5])
                            //    colorb = chtext == answer ? Colors.green: Colors.red

                          ),
                      child: Container(
                        child: new Image.network(
                          "http://www.kidlovescode.com/gamethai/" + answer.img[5], ),
                      ),

                      //    colorb = chtext == answer ? Colors.green: Colors.red

                    ),
                    new RaisedButton(
                      color: colorButton6,
                      onPressed: () =>
                          setState(() =>
                              _doCheck(6,answer.ch[6])
                            //    colorb = chtext == answer ? Colors.green: Colors.red

                          ),
                      child: Container(
                        child: new Image.network(
                          "http://www.kidlovescode.com/gamethai/" + answer.img[6], ),
                      ),

                      //    colorb = chtext == answer ? Colors.green: Colors.red

                    ),
          new RaisedButton(
          color: colorButton7,
          onPressed:null,

          child: Container(
            child: new Text(combineword, style: TextStyle(fontSize: 20,color: Colors.white ),textAlign: TextAlign.center),
          ),

          //    colorb = chtext == answer ? Colors.green: Colors.red

        ),

                    new RaisedButton(
                      color: colorButton8,
                      onPressed: () =>
                          setState(() =>
                              _doCheck(8,answer.ch[8])
                            //    colorb = chtext == answer ? Colors.green: Colors.red

                          ),
                      child: Container(
                        child: new Image.network(
                          "http://www.kidlovescode.com/gamethai/" + answer.img[8], ),
                      ),

                      //    colorb = chtext == answer ? Colors.green: Colors.red

                    ),
                    new RaisedButton(
                      color: colorButton9,
                      onPressed: () =>
                          setState(() =>
                              _doCheck(9,answer.ch[9])
                            //    colorb = chtext == answer ? Colors.green: Colors.red

                          ),
                      child: Container(
                        child: new Image.network(
                          "http://www.kidlovescode.com/gamethai/" + answer.img[9], ),
                      ),

                      //    colorb = chtext == answer ? Colors.green: Colors.red

                    ),
                    new RaisedButton(
                      color: colorButton10,
                      onPressed: () =>
                          setState(() =>
                              _doCheck(10,answer.ch[10])
                            //    colorb = chtext == answer ? Colors.green: Colors.red

                          ),
                      child: Container(
                        child: new Image.network(
                          "http://www.kidlovescode.com/gamethai/" + answer.img[10], ),
                      ),

                      //    colorb = chtext == answer ? Colors.green: Colors.red

                    ),
                    new RaisedButton(
                      color: colorButton11,
                      onPressed: () =>
                          setState(() =>
                              _doCheck(11,answer.ch[11])
                            //    colorb = chtext == answer ? Colors.green: Colors.red

                          ),
                      child: Container(
                        child: new Image.network(
                          "http://www.kidlovescode.com/gamethai/" + answer.img[11], ),
                      ),

                      //    colorb = chtext == answer ? Colors.green: Colors.red

                    ),
                    new RaisedButton(
                      color: colorButton12,
                      onPressed: () =>
                          setState(() =>
                              _doCheck(12,answer.ch[12])
                            //    colorb = chtext == answer ? Colors.green: Colors.red

                          ),
                      child: Container(
                        child: new Image.network(
                          "http://www.kidlovescode.com/gamethai/" + answer.img[12], ),
                      ),

                      //    colorb = chtext == answer ? Colors.green: Colors.red

                    ),
                    new RaisedButton(
                      color: colorButton13,
                      onPressed: () =>
                          setState(() =>
                              _doCheck(13,answer.ch[13])
                            //    colorb = chtext == answer ? Colors.green: Colors.red

                          ),
                      child: Container(
                        child: new Image.network(
                          "http://www.kidlovescode.com/gamethai/" + answer.img[13], ),
                      ),

                      //    colorb = chtext == answer ? Colors.green: Colors.red

                    ),
                      new RaisedButton(
                        color: colorButton7,
                        onPressed: () =>
                            setState(() =>
                                _doCheck(7,answer.ch[7])
                              //    colorb = chtext == answer ? Colors.green: Colors.red

                            ),
                        child: Container(
                          child: new Image.network(
                            "http://www.kidlovescode.com/gamethai/" + answer.img[7], ),
                        ),

                        //    colorb = chtext == answer ? Colors.green: Colors.red

                      )



                      /*                  new FloatingActionButton(
                      backgroundColor: colorButton13,
                      onPressed: () => {},
                      child: new Text(answer.ch[11], style: new TextStyle(
                          color: Colors.white,
                          fontSize: 30

                      )),
                    ),
*/
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
  void startAlphabet(){
    setState(() {
      //  Navigator.push(context, new MaterialPageRoute(builder: (context)=> new WordTone(TERM)));
    });
  }
  _doCheck(gridid, chtext){
    turn++;
    print(combineword);

    if (turn == 1 ){

      combineword = "";
      combineword = combineword+""+chtext; whichw1= gridid;

    }
    if (turn == 2 ){
      combineword = combineword+""+chtext; whichw2= gridid;

      _doCheckAns();
      turn = 0;

      whichw1=-1;
      whichw2=-1;

    }


    //_doCheckCurrColor();
  }

  _doCheckAns(){
    print("check");
    Answer ans = new Answer();

    for (var i = 0; i <= ans.comword.length-1; i++) {
      if (combineword == ans.comword[i]) {

        var audioApplause = new AudioApplause();
        audioApplause.play();

       upDateColorCorrect();
       return;
      }


    }
    //exit loop because not match
    upDateColorWrong();

  }
  upDateColorCorrect(){
    if (whichw1 == 0) colorButton0 = Colors.green;
    if (whichw1 == 1) colorButton1 = Colors.green;
    if (whichw1 == 2) colorButton2 = Colors.green;
    if (whichw1 == 3) colorButton3 = Colors.green;
    if (whichw1 == 4) colorButton4 = Colors.green;
    if (whichw1 == 5) colorButton5 = Colors.green;
    if (whichw1 == 6) colorButton6 = Colors.green;
    if (whichw1 == 7) colorButton7 = Colors.green;
    if (whichw1 == 8) colorButton8 = Colors.green;
    if (whichw1 == 9) colorButton9 = Colors.green;
    if (whichw1 == 10) colorButton10 = Colors.green;
    if (whichw1 == 11) colorButton11 = Colors.green;
    if (whichw1 == 12) colorButton12 = Colors.green;
    if (whichw1 == 13) colorButton13 = Colors.green;
    if (whichw2 == 0) colorButton0 = Colors.green;
    if (whichw2 == 1) colorButton1 = Colors.green;
    if (whichw2 == 2) colorButton2 = Colors.green;
    if (whichw2 == 3) colorButton3 = Colors.green;
    if (whichw2 == 4) colorButton4 = Colors.green;
    if (whichw2 == 5) colorButton5 = Colors.green;
    if (whichw2 == 6) colorButton6 = Colors.green;
    if (whichw2 == 7) colorButton7 = Colors.green;
    if (whichw2 == 8) colorButton8 = Colors.green;
    if (whichw2 == 9) colorButton9 = Colors.green;
    if (whichw2 == 10) colorButton10 = Colors.green;
    if (whichw2 == 11) colorButton11 = Colors.green;
    if (whichw2 == 12) colorButton12 = Colors.green;
    if (whichw2 == 13) colorButton13 = Colors.green;

  }
  upDateColorWrong(){
    if (whichw1 == 0) colorButton0 = Colors.red;
    if (whichw1 == 1) colorButton1 = Colors.red;
    if (whichw1 == 2) colorButton2 = Colors.red;
    if (whichw1 == 3) colorButton3 = Colors.red;
    if (whichw1 == 4) colorButton4 = Colors.red;
    if (whichw1 == 5) colorButton5 = Colors.red;
    if (whichw1 == 6) colorButton6 = Colors.red;
    if (whichw1 == 7) colorButton7 = Colors.red;
    if (whichw1 == 8) colorButton8 = Colors.red;
    if (whichw1 == 9) colorButton9 = Colors.red;
    if (whichw1 == 10) colorButton10 = Colors.red;
    if (whichw1 == 11) colorButton11 = Colors.red;
    if (whichw1 == 12) colorButton12 = Colors.red;
    if (whichw1 == 13) colorButton13 = Colors.red;
    if (whichw2 == 0) colorButton0 = Colors.red;
    if (whichw2 == 1) colorButton1 = Colors.red;
    if (whichw2 == 2) colorButton2 = Colors.red;
    if (whichw2 == 3) colorButton3 = Colors.red;
    if (whichw2 == 4) colorButton4 = Colors.red;
    if (whichw2 == 5) colorButton5 = Colors.red;
    if (whichw2 == 6) colorButton6 = Colors.red;
    if (whichw2 == 7) colorButton7 = Colors.red;
    if (whichw2 == 8) colorButton8 = Colors.red;
    if (whichw2 == 9) colorButton9 = Colors.red;
    if (whichw2 == 10) colorButton10 = Colors.red;
    if (whichw2 == 11) colorButton11 = Colors.red;
    if (whichw2 == 12) colorButton12 = Colors.red;
    if (whichw2 == 13) colorButton13 = Colors.red;

  }
}



class DrawChoice extends StatefulWidget
{
  var colorb;
  var answ;
  var chtext;
  var howManyAns;
  var stringpic;
  var cword="";
  //how is which grid number
  DrawChoice(colorbut,  cht,how, pic){
    colorb = colorbut;

    chtext = cht;
    howManyAns = how;
    stringpic  = pic;
  }
  @override
  DrawChoiceState createState() =>  new DrawChoiceState(colorb, chtext,howManyAns,stringpic);

}

class CreateDialogScore extends StatelessWidget {
  var Score;
  var Total;

  CreateDialogScore(score,total) {
    Score = score;
    Total = total;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  CupertinoAlertDialog(
      title: Text('คะแนน'),
      content: Text('คุณทำได้ '+Score+" จาก "+Total+ " คะแนน"),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close')),
        FlatButton(
          onPressed: () {
            print('HelloWorld!');
            Navigator.pop(context);
          },
          child: Text('Print HelloWorld!'),
        )
      ],
    );
  }



  _dismissDialog() {
    //   Navigator.pop(context);
  }
}


class DrawChoiceState extends State<DrawChoice> {

  Color colorb;
  String chtext,chanswer;
  bool choosen;
  int timechoose;
  var howMany =0 ;
  String pic;

  //howM which gruid
  var Currcolor;
  DrawChoiceState( colorbut, ch,  howM,imagepic){
    colorb = playButton;

    chtext  = ch;
    howMany = howM;  //grid id

    pic = imagepic;
    //_doUpdateColor();
  }
  _doUpdateColor(){
    if (howMany == 0) colorButton0 = colorb;
    if (howMany == 1) colorButton1 = colorb;
    if (howMany == 2) colorButton2 = colorb;
    if (howMany == 3) colorButton3 = colorb;
    if (howMany == 4) colorButton4 = colorb;
    if (howMany == 5) colorButton5 = colorb;
    if (howMany == 6) colorButton6 = colorb;
    if (howMany == 7) colorButton7 = colorb;
    if (howMany == 8) colorButton8 = colorb;
    if (howMany == 9) colorButton9 = colorb;
    if (howMany == 10) colorButton10 = colorb;
    if (howMany == 11) colorButton11 = colorb;
    if (howMany == 12) colorButton12 = colorb;
    if (howMany == 13) colorButton13 = colorb;

  }
  _doCheck(){
    turn++;
    print(combineword);
    colorb= Colors.green;
    if (turn == 1 ){combineword = combineword+""+chtext; whichw1= howMany;

    }
    if (turn == 2 ){
      combineword = combineword+""+chtext; whichw2= howMany;

      _doCheckAns();
      turn = 0;
      combineword="";
      whichw1=-1;
      whichw2=-1;

    }


    //_doCheckCurrColor();
  }

  _doCheckAns(){
    print("check");
    Answer ans = new Answer();

    for (var i = 0; i <= ans.comword.length-1; i++) {
      if (combineword == ans.comword[i]) {
        chtext = combineword;

        var audioApplause = new AudioApplause();
        audioApplause.play();
        colorb = Colors.green;

      }
      else {
        colorb = Colors.red;

      }

    }

  }

  upDateColor(){
    if (whichw1 == 0) colorButton0 = Colors.green;
    if (whichw1 == 1) colorButton1 = Colors.green;
    if (whichw1 == 2) colorButton2 = Colors.green;
    if (whichw1 == 3) colorButton3 = Colors.green;
    if (whichw1 == 4) colorButton4 = Colors.green;
    if (whichw1 == 5) colorButton5 = Colors.green;
    if (whichw1 == 6) colorButton6 = Colors.green;
    if (whichw1 == 7) colorButton7 = Colors.green;
    if (whichw1 == 8) colorButton8 = Colors.green;
    if (whichw1 == 9) colorButton9 = Colors.green;
    if (whichw1 == 10) colorButton10 = Colors.green;
    if (whichw1 == 11) colorButton11 = Colors.green;
    if (whichw1 == 12) colorButton12 = Colors.green;
    if (whichw1 == 13) colorButton13 = Colors.green;
    if (whichw2 == 0) colorButton0 = Colors.green;
    if (whichw2 == 1) colorButton1 = Colors.green;
    if (whichw2 == 2) colorButton2 = Colors.green;
    if (whichw2 == 3) colorButton3 = Colors.green;
    if (whichw2 == 4) colorButton4 = Colors.green;
    if (whichw2 == 5) colorButton5 = Colors.green;
    if (whichw2 == 6) colorButton6 = Colors.green;
    if (whichw2 == 7) colorButton7 = Colors.green;
    if (whichw2 == 8) colorButton8 = Colors.green;
    if (whichw2 == 9) colorButton9 = Colors.green;
    if (whichw2 == 10) colorButton10 = Colors.green;
    if (whichw2 == 11) colorButton11 = Colors.green;
    if (whichw2 == 12) colorButton12 = Colors.green;
    if (whichw2 == 13) colorButton13 = Colors.green;



  }
  getColor(whichcolor){
    if (whichcolor == 0 ) return colorButton0;
    if (whichcolor == 1 ) return colorButton1;
    if (whichcolor == 2 ) return colorButton2;
    if (whichcolor == 3 ) return colorButton3;
    if (whichcolor == 4 ) return colorButton4;
    if (whichcolor == 5 ) return colorButton5;
    if (whichcolor == 6 ) return colorButton6;
    if (whichcolor == 7 ) return colorButton7;
    if (whichcolor == 8 ) return colorButton8;
    if (whichcolor == 9 ) return colorButton9;
    if (whichcolor == 10 ) return colorButton10;
    if (whichcolor == 11 ) return colorButton11;
    if (whichcolor == 12 ) return colorButton12;
    if (whichcolor == 13 ) return colorButton13;



  }

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      color: colorb,
      onPressed: () =>
          setState(() =>
              _doCheck()
            //    colorb = chtext == answer ? Colors.green: Colors.red

          ),
      child: Container(
        child: new Image.network(
          "http://www.kidlovescode.com/gamethai/" + pic, semanticLabel: chtext,),
      ),

      //    colorb = chtext == answer ? Colors.green: Colors.red

    );
  }
}


