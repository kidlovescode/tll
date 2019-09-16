
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tll/audio/playapplause.dart';
//import 'package:flutter/gestures.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:tll/dialog/popupscore.dart';

void main() => runApp(CombineWordPtr());
String TERM;
var score = 0;
var MatchCombineWord="";
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
  var exp = ["exp/combine1.html","exp/combine2.html","exp/combine3.html","exp/combine4.html","exp/combine5.html","exp/combine6.html",];
  var ch =     ["ม้า","ดำ","กา","ไฟ","บ้าน","แมว","น้ำ","","ฟ้า","เข็ม","แม่","ทิศ","เร็ว","คอ","ห่าน"];  //the last one is center
  var img = ["pic/game/animal1.jpg","pic/game/color1.jpg","pic/game/object1.jpg","pic/game/event1.jpg","pic/game/object2.jpg","pic/game/animal2.png","pic/game/event2.png","","pic/game/env1.png",
    "pic/game/object2.png", "pic/game/people1.png","pic/game/other1.png","pic/game/action1.png","pic/game/body1.png","pic/game/animal3.png"];
  var color =[Colors.black12,Colors.green,Colors.green,
             Colors.deepOrangeAccent,Colors.indigo,Colors.lime,
              Colors.lime,Colors.blue,Colors.deepOrangeAccent,
    Colors.blue[100],Colors.indigo, Colors.blue[100],
  Colors.black12,  Colors.indigo[100], Colors.indigo[100]];
  var quest =["คำประสม"];

}
class CombineWordPtr extends StatefulWidget {

  @override
  _MatchCombineWordState createState() => _MatchCombineWordState();
}

class  _MatchCombineWordState extends State<CombineWordPtr> {

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
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.chrome_reader_mode),
              onPressed: () {
                // _select(choices[0]);

              },
            ),
            // action button

            // overflow menu
            /*    PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(2).map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            ),
            */
          ],
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
                        color: answer.color[0],
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
                        color: answer.color[1],
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
                        color: answer.color[2],
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
                        color: answer.color[3],
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
                        color: answer.color[4],
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
                        color: answer.color[5],
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
                        color: answer.color[6],
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
                  new Material(
                    child: new RaisedButton(
                      color:  answer.color[7],
                      elevation: 4.0,
                      splashColor: Colors.amberAccent,
                      textColor: const Color(0xFFFFFFFF),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildAboutDialog(context),
                        );
                        // Perform some action
                      },
                      child: Container(
                        child: new Text(MatchCombineWord, style: TextStyle(fontSize: 20,color: Colors.white ),textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                      /*
                      new FlatButton(
                        color: answer.color[7],
                        onPressed:()=>{
                            showDialog(
                            context: context,
                            builder: (BuildContext context) => _buildAboutDialog(context),
                        )

                        },

                        child: Container(
                          child: new Text(MatchCombineWord, style: TextStyle(fontSize: 20,color: Colors.white ),textAlign: TextAlign.center),
                        ),

                        //    colorb = chtext == answer ? Colors.green: Colors.red

                      ),
                       */
                      new RaisedButton(
                        color: answer.color[8],
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
                        color: answer.color[9],
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
                        color: answer.color[10],
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
                        color: answer.color[11],
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
                        color: answer.color[12],
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
                        color: answer.color[13],
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
                        color: answer.color[14],
                        onPressed: () =>
                            setState(() =>
                                _doCheck(14,answer.ch[14])
                              //    colorb = chtext == answer ? Colors.green: Colors.red

                            ),
                        child: Container(
                          child: new Image.network(
                            "http://www.kidlovescode.com/gamethai/" + answer.img[14], ),
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
  _doCheck(gridid, chtext){
    turn++;
    print(MatchCombineWord);

    if (turn == 1 ){

      MatchCombineWord = "";
      MatchCombineWord = MatchCombineWord+""+chtext; whichw1= gridid;

    }
    if (turn == 2 ){
      MatchCombineWord = MatchCombineWord+""+chtext; whichw2= gridid;

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
      if (MatchCombineWord == ans.comword[i]) {

        var audioApplause = new AudioApplause();
        audioApplause.play();

      //  upDateColorCorrect();
        return;
      }


    }
    //exit loop because not match
   // upDateColorWrong();

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

  Widget _buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('คะแนน'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAboutText(),
          _buildLogoAttribution(),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('ทราบแล้ว'),
        ),
      ],
    );
  }

  Widget _buildAboutText() {
    return new RichText(
      text: new TextSpan(
        text: 'คะแนนที่ได้คือ\n\n',
        style: const TextStyle(color: Colors.black87),
        children: <TextSpan>[
          const TextSpan(text: 'The app was developed with '),
          new TextSpan(
            text: 'Flutter',

          ),
          const TextSpan(
            text: ' and it\'s open source; check out the source '
                'code yourself from ',
          ),
          new TextSpan(
            text: 'Word',

          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }

  Widget _buildLogoAttribution() {
    return new Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: new Row(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: new Image.asset(
              "assets/flutter.png",
              width: 32.0,
            ),
          ),
          const Expanded(
            child: const Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: const Text(
                'Popup window is like a dialog box that gains complete focus when it appears on screen.',
                style: const TextStyle(fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class CreateDialogWord extends StatelessWidget {
  var Score;
  var Total;
  var Cword;
  /*
  CreateDialogScore(score,total) {
    Score = score;
    Total = total;
  }
  */
  CreateDialogWord(cword, context) {
    Cword =cword;
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
