import 'package:flutter/material.dart';
import 'package:tll/audio/playsimpleaudio2.dart';
//import 'package:tll/audio/playapplause.dart';
import 'package:tll/audio/playtryagain.dart';
import 'package:audioplayer/audioplayer.dart';
var finalScore = 0;
var questionNumber = 0;
var quiz = new Category1Quiz();
var audioapp ;
var audioapplause ;
var correct = "http://www.kidlovescode.com/gamethai/audio/correct.mp4";
class  Category1Quiz{
  var images = [
    "pic/question/qal1.jpg", "pic/question/qal2.jpg", "pic/question/qal4.jpg", "pic/question/qal8.jpg"
  ];


  var questions = [
    "พยัญชนะอะไรเอ่ย?",
    "พยัญชนะอะไรเอ่ย?",
    "พยัญชนะอะไรเอ่ย?",
    "พยัญชนะอะไรเอ่ย?",
  ];


  var choices = [
    ["ก", "ข", "ค"],
    ["ก", "ข", "ค"],
    ["ก", "ข", "ค"],
    ["จ", "ฉ", "ช"],
  ];


  var correctAnswers = [
    "ก", "ข", "ค", "จ"
  ];
  var audioQuiz = [
    "audio/qal1.m4a", "audio/qal2.m4a", "audio/qal4.m4a", "audio/qal6.m4a"
  ];

}

class Quiz1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }


}


class Quiz1State extends State<Quiz1> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(

          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(5.0)),

                new Container(
                  alignment: Alignment.centerRight,
                  color: Colors.deepOrangeAccent,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                     // new Image.asset("images/speech.gif",width:100,height:100),
                      new Text("คำถามที่ ${questionNumber + 1} จาก ${quiz.questions.length}",
                        style: new TextStyle(
                            fontSize: 22.0
                        ),),

                      new Text("คะแนน: $finalScore",
                        style: new TextStyle(
                            fontSize: 22.0
                        ),)
                    ],
                  ),
                ),


                //image
                new Padding(padding: EdgeInsets.all(2.0)),
                new Image.network("http://www.kidlovescode.com/gamethai/"+quiz.images[questionNumber],width:150,height:150),
                //AssetImage(quiz.images[questionNumber])),
   //             new Image.asset(
    //              "images/${quiz.images[questionNumber]}.jpg",
     //           ),
                new Padding(padding: EdgeInsets.all(1.0)),
                  audioapp = new AudioApp('http://www.kidlovescode.com/gamethai/'+quiz.audioQuiz[questionNumber]),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Text(quiz.questions[questionNumber],
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),),

                new Padding(padding: EdgeInsets.all(4.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 1
                    new MaterialButton(
                      minWidth: 120.0,
                      height: 90,
                      color: Colors.lightBlue,
                      splashColor: Colors.amber,
                      onPressed: (){

                        if(quiz.choices[questionNumber][0] == quiz.correctAnswers[questionNumber]){
                            new AudioPlayer().play(correct);
                           //new AudioApplause();
                          finalScore++;
                        }else{

                          new AudioTryagain();
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][0],
                        style: new TextStyle(
                            fontSize: 100.0,
                            color: Colors.white
                        ),),
                    ),

                    //button 2
                    new MaterialButton(
                      minWidth: 120.0,
                      height: 90,
                      color: Colors.lightBlue,
                      onPressed: (){

                        if(quiz.choices[questionNumber][1] == quiz.correctAnswers[questionNumber]){
                          debugPrint("ตอบถูก");
                           //new AudioApplause();
                          new AudioPlayer().play(correct);
                          finalScore++;
                        }else{
                          new AudioTryagain();
                          debugPrint("ตอบผิด");

                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][1],
                        style: new TextStyle(
                            fontSize: 100.0,
                            color: Colors.white
                        ),),
                    ),

                  ],
                ),

                new Padding(padding: EdgeInsets.all(5.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 3
                    new MaterialButton(
                      minWidth: 120.0,
                      height: 90,
                      color: Colors.lightBlue,
                      onPressed: (){

                        if(quiz.choices[questionNumber][2] == quiz.correctAnswers[questionNumber]){
                          debugPrint("ตอบถูก");
                          //  new AudioApplause();
                          new AudioPlayer().play(correct);
                          finalScore++;
                        }else{
                          new AudioTryagain();
                          debugPrint("ตอบผิด");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][2],
                        style: new TextStyle(
                            fontSize: 100.0,
                            color: Colors.white
                        ),),
                    ),

                    //button 4
          /*
                    new MaterialButton(
                      minWidth: 150.0,
                      height: 150,
                      color: Colors.lightBlue,
                      onPressed: (){

                        if(quiz.choices[questionNumber][3] == quiz.correctAnswers[questionNumber]){
                          debugPrint("ตอบถูก");
                          finalScore++;
                        }else{
                          debugPrint("ตอบผิด");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][3],
                        style: new TextStyle(
                            fontSize: 100.0,
                            color: Colors.white
                        ),),
                    ),
                   */
                  ],
                ),




              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: resetQuiz,
            backgroundColor: Colors.deepOrange,
            /*onPressed: () {

              setState(() {

              });
            },*/
            child: Icon(
              Icons.exit_to_app,
            ),

          ),
        )
    );

  }

  void resetQuiz(){
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }



  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore,)));

      }else{
        questionNumber++;
        audioapp.stopPlay();


      }
    });
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
