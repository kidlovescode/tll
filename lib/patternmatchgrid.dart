
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:tll/audio/playapplause.dart';
import 'package:tll/dialog/popupscore.dart';

void main() => runApp(playTone());
String TERM;
var score = 0;
var answer = new Answer();
class Answer{
  var answer = ["กา","ขา","คา","","ปา","","","","งา","มา","คา","งา","จา","","อา"];
  var ch =     ["กา","ขา","คา","งู","ปา","แห","แม","งา","งา","มา","คา","งา","จา","ปี","อา","หนู"];
  var quest =["งา"];
}
class playTone extends StatefulWidget {

  @override
  _playToneState createState() => _playToneState();
}

class  _playToneState extends State<playTone> {

Color  rightButton = new Color.fromARGB(155, 173, 213, 107) ;
Color  wrongButton = new Color.fromARGB(155, 246, 95, 107);

final  playButton = new Color.fromARGB(155,116, 108, 244);
var colorButton, colorButton1, colorButton2,colorButton3,colorButton4,colorButton5,colorButton6,colorButton7,colorButton8
,colorButton9,colorButton10,colorButton11,colorButton12,colorButton13,colorButton14 ;



void initState() {
  super.initState();
  setState(() {
  });

}
void _setColorButton() {
  super.initState();
  setState(() {
    colorButton = rightButton;
    print ("yes");
  });

}

@override
  Widget build(BuildContext context) {
  colorButton1 = playButton;colorButton2 = playButton;colorButton3 = playButton;
  colorButton4 = playButton;colorButton5 = playButton;colorButton6 = playButton;
  colorButton7 = playButton;colorButton8 = playButton;colorButton9 = playButton;
  colorButton10 = playButton;colorButton11 = playButton;colorButton12 = playButton;
  colorButton13 = playButton;colorButton14 = playButton;
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('เลือกคำที่มีสระตรงกับคำในวงกลมสีเหลือง'),
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

                    DrawChoice(colorButton,answer.ch[0], answer.answer[0],10),
                    DrawChoice(colorButton,answer.ch[1], answer.answer[1],10),
                    DrawChoice(colorButton,answer.ch[2], answer.answer[2],10),
                    DrawChoice(colorButton,answer.ch[3], answer.answer[3],10),
                    DrawChoice(colorButton,answer.ch[4], answer.answer[4],10),
                    DrawChoice(colorButton,answer.ch[5], answer.answer[5],10),
                    DrawChoice(colorButton,answer.ch[6], answer.answer[6],10),


                    new FloatingActionButton(
                      backgroundColor: Colors.amber,

                      child: new Text(answer.quest[0], style: new TextStyle(
    color: Colors.white,
    fontSize: 30

    )),
                    ),

                    DrawChoice(colorButton,answer.ch[8], answer.answer[8],10),
                    DrawChoice(colorButton,answer.ch[9], answer.answer[9],10),
                    DrawChoice(colorButton,answer.ch[10], answer.answer[10],10),
                    DrawChoice(colorButton,answer.ch[11], answer.answer[11],10),
                    DrawChoice(colorButton,answer.ch[12], answer.answer[12],10),
                    DrawChoice(colorButton,answer.ch[13], answer.answer[13],10),
                    DrawChoice(colorButton,answer.ch[14], answer.answer[14],10),
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
      //Navigator.push(context, new MaterialPageRoute(builder: (context)=> new WordTone(TERM)));
    });
  }
}



class DrawChoice extends StatefulWidget
{
  var colorb;
  var answ;
  var chtext;
  var howManyAns;
   DrawChoice(colorbut,  cht,anw, how){
     colorb = colorbut;
      answ = anw;
      chtext = cht;
      howManyAns = how;
   }
  @override
  DrawChoiceState createState() =>  new DrawChoiceState(colorb, chtext, answ,false,0,howManyAns);

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
   String chtext,answer;
   bool choosen;
   int timechoose;
   int howMany ;
  DrawChoiceState(Color colorbut, ch,answ, choose, tchoose, howMany){
    colorb = colorbut;
    answer = answ;
    chtext  = ch;
    choosen = choose;
    timechoose = tchoose;
  }
_doCheck(){
  if (choosen==false) {
    timechoose++;
    colorb = chtext == answer ? Colors.green : Colors.red;
    if (colorb == Colors.green) {
      new AudioApplause();
      //new CreateDialogScore (score,howMany);
      new PopupScore();
      score++;
    }
    choosen = true;
    if (timechoose == howMany){
        new CreateDialogScore (score,howMany);
    }

  }
  }


   @override
   Widget build(BuildContext context) {
     return new FloatingActionButton(
         backgroundColor: colorb,
         onPressed: () => setState(() =>
         _doCheck()
     //    colorb = chtext == answer ? Colors.green: Colors.red

         ),

         child: new Text(chtext, style: new TextStyle(
             color: Colors.white,
             fontSize: 30  ) )

     );
   }
}


