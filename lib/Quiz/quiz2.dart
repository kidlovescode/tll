import 'package:flutter/material.dart';
import 'package:tll/audio/playapplause.dart';

var finalScore = 0;
var questionNumber = 0;
var quiz = new Category2Quiz();

class  Category2Quiz{
  var images = [
    ["q1c1.png", "q1c2.png", "q1c3.png", "q1c4.png"],
    ["q1c1.png", "q1c2.png", "q1c3.png", "q1c4.png"],
    ["q3c1.jpg", "q3c2.jpg", "q4c3.jpg", "q3c4.jpg"],
    ["q4c1.jpg", "q3c4.jpg", "q4c3.jpg", "q4c4.jpeg"],
  ];


  var questions = [
    "อะไรคือคำนาม",
    "อะไรคือคำกิริยา",
    "อะไรคือคำวิเศษณ์",
    "อะไรคือคำสรรพนาม",
  ];


  var choices = [
    ["กระเป๋า", "กิน", "นอน", "วิ่ง"],
    ["กระเป๋า", "กิน", "นอน", "วิ่ง"],
    ["วิ่งเร็ว", "ผอม", "นอนนิ่ง", "น้องชาย"],
    ["ขายาว", "น้อง", "เธอ", "ฉัน"]
  ];




  var correctAnswers = [
    "กระเป๋า", "กิน", "ผอม", "ฉัน"
  ];
}

class Quiz2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new Quiz2State();
  }
}

class Quiz2State extends State<Quiz2> {
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
                new Padding(padding: EdgeInsets.all(20.0)),

                new Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

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
                new Padding(padding: EdgeInsets.all(10.0)),
             ///Image on top of question

           //     new Image.asset(
           //       "images/${quiz.images[questionNumber]}.png",
           //     ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Text(quiz.questions[questionNumber],
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Column (
                    children: <Widget>[
                      new Image.network(
                          "http://www.kidlovescode.com/gamethai/pic/game/${quiz.images[questionNumber][0]}", width: 150,height: 150),

                    new MaterialButton(
                      minWidth: 150.0,
                      height: 50,
                      color: Colors.lightBlue[800],
                      onPressed: (){
                        if(quiz.choices[questionNumber][0] == quiz.correctAnswers[questionNumber]){
                          debugPrint("ตอบถูก");
                          new AudioApplause();
                          finalScore++;
                        }else{
                          debugPrint("ตอบผิด");
                        }
                        updateQuestion();
                      },
                      child:


                      new Text(quiz.choices[questionNumber][0],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),



                    ),
                  ]
                    ),
                    new Column (
                        children: <Widget>[
                          new Image.network(
                              "http://www.kidlovescode.com/gamethai/pic/game/${quiz.images[questionNumber][1]}", width: 150,height: 150),
                          new MaterialButton(
                            minWidth: 150.0,
                            height: 50,
                            color: Colors.lightBlue[800],
                            onPressed: (){
                              if(quiz.choices[questionNumber][1] == quiz.correctAnswers[questionNumber]){
                                debugPrint("ตอบถูก");
                                new AudioApplause();
                                finalScore++;
                              }else{
                                debugPrint("ตอบผิด");
                              }
                              updateQuestion();
                            },
                            child:


                            new Text(quiz.choices[questionNumber][1],
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white
                              ),),



                          ),
                        ]
                    ),
                    //button 2


                  ],
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    new Column (
                        children: <Widget>[
                          new Image.network(
                              "http://www.kidlovescode.com/gamethai/pic/game/${quiz.images[questionNumber][2]}", width: 150,height: 150),

                          new MaterialButton(
                            minWidth: 150.0,
                            height: 50,
                            color: Colors.lightBlue[800],
                            onPressed: (){
                              if(quiz.choices[questionNumber][2] == quiz.correctAnswers[questionNumber]){
                                debugPrint("ตอบถูก");
                                new AudioApplause();
                                finalScore++;
                              }else{
                                debugPrint("ตอบผิด");
                              }
                              updateQuestion();
                            },
                            child:


                            new Text(quiz.choices[questionNumber][2],
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white
                              ),),



                          ),
                        ]
                    ),
                    new Column (
                        children: <Widget>[
                          new Image.network(
                              "http://www.kidlovescode.com/gamethai/pic/game/${quiz.images[questionNumber][3]}", width: 150,height: 150),

                          new MaterialButton(
                            minWidth: 150.0,
                            height: 50,
                            color: Colors.lightBlue[800],
                            onPressed: (){
                              if(quiz.choices[questionNumber][3] == quiz.correctAnswers[questionNumber]){
                                debugPrint("ตอบถูก");
                                new AudioApplause();
                                finalScore++;
                              }else{
                                debugPrint("ตอบผิด");
                              }
                              updateQuestion();
                            },
                            child:


                            new Text(quiz.choices[questionNumber][3],
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white
                              ),),



                          ),
                        ]
                    ),

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

                new MaterialButton(
                  height: 150.0,
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


      ),
    );
  }


}