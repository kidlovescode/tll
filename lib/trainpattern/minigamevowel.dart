import 'package:flutter/material.dart';
//import 'package:tll/Quiz/alphabetquiz.dart';
import 'package:tll/audio/playsimpleaudio2.dart';
import 'package:tll/audio/playapplause.dart';
import 'package:tll/audio/playtryagain.dart';
void main() {
  runApp(new MaterialApp(home: new SelectPatternVowel()));
}

var finalScore = 0;
var questionNumber = 0;
var quiz = new SelectData();

class  SelectData{
  var images = [
    "pic/question/qal1.jpg", "pic/question/qal2.jpg", "pic/question/qal4.jpg", "pic/question/qal8.jpg","pic/question/qal10.jpg"
  ];


  var questions = [
    "เลือกคกที่มีพยัญชนะนำที่เหมือนกับพยัญชนะที่อยู่ตรงกลาง",
    "เลือกคกที่มีพยัญชนะนำที่เหมือนกับพยัญชนะที่อยู่ตรงกลาง",
    "เลือกคกที่มีพยัญชนะนำที่เหมือนกับพยัญชนะที่อยู่ตรงกลาง",
    "เลือกคกที่มีพยัญชนะนำที่เหมือนกับพยัญชนะที่อยู่ตรงกลาง",
    "เลือกคกที่มีพยัญชนะนำที่เหมือนกับพยัญชนะที่อยู่ตรงกลาง",
  ];


  var choices = [
    ["ก", "ขา", "คา","กา","ขา"],
    ["ข", "ขา", "ควาย","กา","จาน"],
    ["ค", "ขาย", "ควาย","หนู","ขวด"],
    ["ง", "ฉํน", "ชา","งู","จับ"],
    ["จ", "ฉาย", "ชา","งาน","จาน"],
  ];


  var correctAnswers = [
    "กา", "ขา", "ควาย", "งู","จาน"
  ];
  var audioQuiz = [
    "audio/qal1.m4a", "audio/qal2.m4a", "audio/qal4.m4a", "audio/qal8.m4a","audio/qal10.m4a"
  ];

}

class SelectPatternVowel extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new SelectState();
  }


}

class SelectState extends State<SelectPatternVowel> {
  @override
  Widget build(BuildContext context) {
    Widget bigCircle = new Container(
      padding: EdgeInsets.all(25.0),

      width: 500.0,
      height: 800.0,
     // new Container(
        alignment: Alignment.centerRight,

      decoration: new BoxDecoration(
        color: Colors.green[300],
        shape: BoxShape.circle,
      ),



     // ),
/*


      */
    );
    /*
    void startQuiz1(){
      // setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz1()));
      //   });
    }*/
    return new Material(
      color: Colors.black,
      child: new Center(
        child: new Stack(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                // new Image.asset("images/speech.gif",width:100,height:100),
                new Text("คำถามที่ ${questionNumber + 1} จาก ${quiz.questions.length}",
                  style: new TextStyle(
                    fontSize: 22.0, color: Colors.white,

                  ),),

                new Text("คะแนน: $finalScore",
                  style: new TextStyle(
                    fontSize: 22.0, color: Colors.white,
                  ),),

                new Padding(padding: EdgeInsets.all(50.0)),

              ],
            ),

            bigCircle,
            new Positioned(
              child: new CircleButton(
                  onTap: () {
                    if (quiz.choices[questionNumber][1] == quiz.correctAnswers[questionNumber])
                    {
                      new AudioApplause();
                      finalScore++;
                    }else{  new AudioTryagain();
                    }
                    updateQuestion();
                  }               ,
                  iconData: Icons.chrome_reader_mode,
                  textt: Text(quiz.choices[questionNumber][1],textAlign: TextAlign.center,     style: new TextStyle(
                    fontSize: 50.0,
                    color: Colors.black,))
              ),
              top: 180.0,
              left: 170.0,

            ),
            new Positioned(
              child: new CircleButton(onTap: ()=>{}      , iconData: Icons.satellite, textt: Text(quiz.choices[questionNumber][0],textAlign: TextAlign.center,style: new TextStyle(
                fontSize: 50.0,
                color: Colors.red,
              )) ),
              top: 320.0,
              left: 170.0,
            ),

            new Positioned(
              child: new CircleButton(onTap: ()  {
                if (quiz.choices[questionNumber][4] == quiz.correctAnswers[questionNumber])
                {
                  new AudioApplause();
                  finalScore++;
                }else{  new AudioTryagain();
                }
                updateQuestion();
              }              , iconData: Icons.timer, textt: Text(quiz.choices[questionNumber][4],textAlign: TextAlign.center, style: new TextStyle(
                fontSize: 50.0,
                color: Colors.black,)) ),
              top: 320.0,
              left: 10.0,
            ),
            new Positioned(
              child: new CircleButton(onTap: ()  {
                if (quiz.choices[questionNumber][2] == quiz.correctAnswers[questionNumber])
                {
                  new AudioApplause();
                  finalScore++;
                }else{  new AudioTryagain();
                }
                updateQuestion();
              }              , iconData: Icons.place, textt: Text(quiz.choices[questionNumber][2],textAlign: TextAlign.center,style: new TextStyle(
                fontSize: 50.0,
                color: Colors.black,)) ),
              top: 320.0,
              right: 10.0,
            ),
            new Positioned(
              child: new CircleButton(onTap: ()  {
                if (quiz.choices[questionNumber][3] == quiz.correctAnswers[questionNumber])
                {
                  new AudioApplause();
                  finalScore++;
                }else{  new AudioTryagain();
                }
                updateQuestion();
              }              , iconData: Icons.local_pizza,textt: Text(quiz.choices[questionNumber][3],textAlign: TextAlign.center,style: new TextStyle(
                fontSize: 50.0,
                color: Colors.black,)) ),
              top: 470.0,
              left: 170.0,
            ),

          ],
        ),
      ),
    );
  }
  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore,)));

      }else{
        questionNumber++;
      }
    });
  }
  void resetQuiz(){
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }
  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('คำแนะนำ'),
            content: Text('เลือกตัวเลือกที่อยู่ล้อมรอบ คำ สระ หรือพยัญชนะที่อยู่ตรงกลาง  \n'
                'ตัวเลือกนั้นจะต้องเหมือนคำ สระ หรือ พยัญชนะ ที่อยู่ตรงกลาง  \n'
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('ปิด')),

            ],
          );
        });
  }


  _dismissDialog() {
    Navigator.pop(context);
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;
  final Text textt;
  const CircleButton({Key key, this.onTap, this.iconData, this.textt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 80.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,

        decoration:
        new BoxDecoration(
          //border: new Border.all(color: Colors.white),
          //color: questionNumber==1 ?Colors.red : Colors.white, // you can use ternary operator here
          color:Colors.white,
          shape: BoxShape.circle,

        )
        ,

        child:

        Column(
          children: <Widget>[
           // new Icon(  iconData,   color: Colors.black),
            textt,
          ],
        ),


      ),


    );
  }

}
class Summary extends StatelessWidget{
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

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
              new Image(image: new AssetImage("images/kidjump.gif")),
              new MaterialButton(

                color: Colors.lightBlue,
                //  onPressed: startQuiz,
                child:   new Text("คะแนนรวม: $score",
                  style: new TextStyle(
                      fontSize: 35.0
                  ),),

              ),
              new Padding(padding: EdgeInsets.all(30.0)),

              new MaterialButton(
                color: Colors.green,
                onPressed: (){
                  questionNumber = 0;
                  finalScore = 0;
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
        /*
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        questionNumber = 0;
        finalScore = 0;
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
          */
        /*
        new Container(

          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Text("คะแนนรวม: $score",
                style: new TextStyle(
                    fontSize: 35.0
                ),),

              new Padding(padding: EdgeInsets.all(30.0)),

              new MaterialButton(
                color: Colors.red,
                onPressed: (){
                  questionNumber = 0;
                  finalScore = 0;
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
         */

      ),
    );
  }


}
