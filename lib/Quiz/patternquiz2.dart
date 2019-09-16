import 'package:flutter/material.dart';
import 'package:tll/Quiz/quiz2.dart';

void main(){
  runApp(
      new MaterialApp(
        home: new AnimalQuiz2(),
      )
  );
}

class AnimalQuiz2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new AnimalQuizState();
  }
}

class AnimalQuizState extends State<AnimalQuiz2>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("ทดสอบ"),
          backgroundColor: Colors.blue,
        ),


        body: new Container(
          margin: const EdgeInsets.all(15.0),
          child: new Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new MaterialButton(
                  height: 150.0,
                  color: Colors.green,
                  onPressed: startQuiz,
                  child: new Text("เริ่มทดสอบเลยไหม",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),)
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          //onPressed: startQuiz,
          backgroundColor: Colors.deepOrange,
          /*onPressed: () {

              setState(() {

              });
            },*/
          child: Icon(
            Icons.exit_to_app,
          ),

        )
    );
  }

  void startQuiz(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz2()));
    });
  }
}
