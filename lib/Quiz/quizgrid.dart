//No need, just chice list

import 'package:flutter/material.dart';
import 'package:tll/audio/playapplause.dart';
//Gridview มีข้อเดียวเท่านั้น  มีคำตอบถูก 4 คำตอบ

var finalScore = 0;
var questionNumber = 0;
var quiz = new Category2Quiz();

class  Category2Quiz{
  var images = [
    "q1c1.png", "q1c2.png", "q1c3.png", "q1c4.png","q1c1.png", "q1c2.png", "q1c3.png", "q1c4.png"
  ];


  var questions = [
    "คำที่มีอักษรนำ ก",

  ];


  var choices = [
    "กระเป๋า", "กระป๋อง", "นอน", "วิ่ง","เกลียด", "ก้อน", "นอน", "วิ่ง"

  ];

  var chimg = [
    "q1c1.png", "q1c2.png", "q1c3.png", "q1c4.png"
  ];


  var correctAnswers = [
    "กระเป๋า", "กระป๋อง","เกลียด","ก้อน"
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

                      new Text("เลือกคำตอบได้มากกว่า 1 คำตอบ",
                        style: new TextStyle(
                            fontSize: 22.0
                        ),),

                      new Text("คะแนน: $finalScore /4",
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
                      new Image.network("http://www.kidlovescode.com/gamethai/pic/game/{quiz.images[0]}",width:70,height:70),
                    new MaterialButton(
                      minWidth: 100.0,
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


                      new Text(quiz.choices[0],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),



                    ),
                  ]
                    ),
                    new Column (
                        children: <Widget>[
                          new Image.network("http://www.kidlovescode.com/gamethai/pic/game/{quiz.images[1]}",width:70,height:70),
                          new MaterialButton(
                            minWidth: 100.0,
                            height: 50,
                            color: Colors.lightBlue[800],
                            onPressed: (){
                              if(quiz.choices[1] == quiz.correctAnswers[0] || quiz.choices[1] == quiz.correctAnswers[1] ||
                                  quiz.choices[1] == quiz.correctAnswers[2] || quiz.choices[1] == quiz.correctAnswers[3]  ){
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
                    new Column (
                        children: <Widget>[
                          new Image.network("http://www.kidlovescode.com/gamethai/pic/game/{quiz.images[2]}",width:70,height:70),
                          new MaterialButton(
                            minWidth: 100.0,
                            height: 50,
                            color: Colors.lightBlue[800],
                            onPressed: (){
                              if(quiz.choices[3] == quiz.correctAnswers[questionNumber]){
                                debugPrint("ตอบถูก");
                                new AudioApplause();
                                finalScore++;
                              }else{
                                debugPrint("ตอบผิด");
                              }
                              updateQuestion();
                            },
                            child:


                            new Text(quiz.choices[3],
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white
                              ),),



                          ),
                        ]
                    ),

                  ],
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    new Column (
                        children: <Widget>[
                          new Image.network("http://www.kidlovescode.com/gamethai/pic/game/{quiz.images[3]}",width:70,height:70),
                          new MaterialButton(
                            minWidth: 100.0,
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
                          new Image.network("http://www.kidlovescode.com/gamethai/pic/game/{quiz.images[4]}",width:70,height:70),
                          new MaterialButton(
                            minWidth: 100.0,
                            height: 50,
                            color: Colors.lightBlue[800],
                            onPressed: (){
                              if(quiz.choices[3] == quiz.correctAnswers[questionNumber]){
                                debugPrint("ตอบถูก");
                                finalScore++;
                              }else{
                                debugPrint("ตอบผิด");
                              }
                              updateQuestion();
                            },
                            child:


                            new Text(quiz.choices[3],
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white
                              ),),



                          ),
                        ]
                    ),
                    new Column (
                        children: <Widget>[
                          new Image.network("http://www.kidlovescode.com/gamethai/pic/game/{quiz.images[5]}",width:70,height:70),
                          new MaterialButton(
                            minWidth: 100.0,
                            height: 50,
                            color: Colors.lightBlue[800],
                            onPressed: (){
                              if(quiz.choices[3] == quiz.correctAnswers[questionNumber]){
                                debugPrint("ตอบถูก");
                                finalScore++;
                              }else{
                                debugPrint("ตอบผิด");
                              }
                              updateQuestion();
                            },
                            child:


                            new Text(quiz.choices[3],
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white
                              ),),



                          ),
                        ]
                    ),
                  ],
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    new Column (
                        children: <Widget>[
                          new Image.network("http://www.kidlovescode.com/gamethai/pic/game/{quiz.images[6]}",width:70,height:70),
                          new MaterialButton(
                            minWidth: 100.0,
                            height: 50,
                            color: Colors.lightBlue[800],
                            onPressed: (){
                              if(quiz.choices[questionNumber][2] == quiz.correctAnswers[questionNumber]){
                                debugPrint("ตอบถูก");
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
                          new Image.network("http://www.kidlovescode.com/gamethai/pic/game/{quiz.images[7]}",width:70,height:70),
                          new MaterialButton(
                            minWidth: 100.0,
                            height: 50,
                            color: Colors.lightBlue[800],
                            onPressed: (){
                              if(quiz.choices[3] == quiz.correctAnswers[questionNumber]){
                                debugPrint("ตอบถูก");
                                finalScore++;
                              }else{
                                debugPrint("ตอบผิด");
                              }
                              updateQuestion();
                            },
                            child:


                            new Text(quiz.choices[3],
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white
                              ),),



                          ),
                        ]
                    ),
                    new Column (
                        children: <Widget>[
                          new Image.network("http://www.kidlovescode.com/gamethai/pic/game/{quiz.images[8]}",width:70,height:70),
                          new MaterialButton(
                            minWidth: 100.0,
                            height: 50,
                            color: Colors.lightBlue[800],
                            onPressed: (){
                              if(quiz.choices[3] == quiz.correctAnswers[questionNumber]){
                                debugPrint("ตอบถูก");
                                finalScore++;
                              }else{
                                debugPrint("ตอบผิด");
                              }
                              updateQuestion();
                            },
                            child:


                            new Text(quiz.choices[3],
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