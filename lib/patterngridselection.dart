
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tll/datamodel/Category1_3.dart';
import 'package:tll/audio/playapplause.dart';
import 'package:tll/dialog/popupscore.dart';

var datam ;
var answer ;
var ch ;
//void main() => runApp(GridSelection(0));
void main() {
  runApp(MaterialApp(home: GridSelection(0)));
}

////Share variable from data model
var score = 0;
var quest ;
var corrN ;
var learningtopic = 1;
var buttonCenterColor = Colors.yellow;
class GridSelection extends StatefulWidget {
  //DataCategory1_3 datam;
   GridSelection(topic){

     datam  = new DataCategory1_3(topic);
     answer = datam.getAnswer();
     ch =  datam.getChoice();
     quest = datam.getQuestion();
     corrN = datam.getCorrectNumber();
   }
  @override
  State<StatefulWidget> createState() {
   return  _GridSelectionState();
  }
}

class  _GridSelectionState extends State<GridSelection> {

  Color  rightButton = new Color.fromARGB(155, 173, 213, 107) ;
  Color  wrongButton = new Color.fromARGB(155, 246, 95, 107);

  final  playButton = Colors.blue[100];
  var colorButton =  Colors.blue[200], colorButton1, colorButton2,colorButton3,colorButton4,colorButton5,colorButton6,colorButton7,colorButton8
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
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('เลือกคำที่มีสระตรงกับคำในสีเหลือง'),
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

                      DrawChoice(colorButton,ch[0], answer[0],0),
                      DrawChoice(colorButton,ch[1], answer[1],1),
                      DrawChoice(colorButton,ch[2], answer[2],2),
                      DrawChoice(colorButton,ch[3], answer[3],3),
                      DrawChoice(colorButton,ch[4], answer[4],4),
                      DrawChoice(colorButton,ch[5], answer[5],5),
                      DrawChoice(colorButton,ch[6], answer[6],6),


                      RaisedButton(
                        child: Text(quest, style: new TextStyle(

                            fontSize: 30  ) ),
                          color: Colors.yellow,
                          onPressed: () {
                            //Navigator.push(context, new MaterialPageRoute(builder: (context)=> new GridSelection(1)));

                            _showMaterialDialog();
                            //new NextLevel();
                          }),
                      DrawChoice(colorButton,ch[7], answer[7],10),
                      DrawChoice(colorButton,ch[8], answer[8],10),
                      DrawChoice(colorButton,ch[9], answer[9],10),
                      DrawChoice(colorButton,ch[10], answer[10],10),
                      DrawChoice(colorButton,ch[11], answer[11],10),
                      DrawChoice(colorButton,ch[12], answer[12],10),
                      DrawChoice(colorButton,ch[13], answer[13],10),

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
  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ฝึกฝนในระดับที่สูงขึ้น'),
            content: Text('หากต้องการฝึกในระดับที่สูงขึ้นให้เลือก ไประดับถัดไป'),
            actions: <Widget>[
              FlatButton(

                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('ปิด')),
              FlatButton(
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context)=> new GridSelection(1)));
                  _dismissDialog();
                },
                child: Text('ไประดับถัดไป'),
              )
            ],
          );
        });
  }
  void startAlphabet(){
    setState(() {
      //Navigator.push(context, new MaterialPageRoute(builder: (context)=> new WordTone(TERM)));
    });
  }
  _dismissDialog() {
    Navigator.pop(context);
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
      if (score == 5){
        print("Next Level ");//Go to next level
          new NextLevel();
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
         color: colorb,
        //backgroundColor: colorb,
        onPressed: () => setState(() =>
            _doCheck()
          //    colorb = chtext == answer ? Colors.green: Colors.red

        ),

        child: new Text(chtext, style: new TextStyle(
            color: Colors.black,
            fontSize: 30  ) )

    );
  }
}

class NextLevel extends StatelessWidget {
  // a property on this class

  // a constructor for this class


  Widget build(context) {

    return SimpleDialog(
      title: const Text('ลองฝึกฝนขั้นที่ยากขึ้นไหม ?'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            //Navigator.push(context, );
      },
          child: const Text('ไปกันเลย'),
        ),
        SimpleDialogOption(
          onPressed: () { //Navigator.pop(context, );
            },
          child: const Text('เอาไว้ก่อน'),
        ),
      ],
    );

  }
}


