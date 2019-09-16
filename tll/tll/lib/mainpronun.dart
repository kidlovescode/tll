import 'package:flutter/material.dart';
import 'package:tll/alphabet.dart';
import 'package:tll/vowel.dart';


void main(){
  runApp(
      new MaterialApp(
        home: new NavigateMenu(),
      )
  );
}

class NavigateMenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new NavigateMenuState();
  }
}

class NavigateMenuState extends State<NavigateMenu>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("เรียนภาษาไทยแสนสนุก"),
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
                  //onPressed: startQuiz,
                  child: new Text("หมวดการเรียนรู้ฝึกอ่านออกเสียง",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),)
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new MaterialButton(
                  height: 100.0,
                  color: Colors.lightBlue[800],
                  onPressed: startAlphabet,
                  child: new Text("ฝึกอ่านพยัญชนะ",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),)
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new MaterialButton(
                  height: 100.0,
                  color: Colors.lightBlue[800],
                  onPressed: startVowel,
                  child: new Text("ฝึกอ่านสระ",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),)
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new MaterialButton(
                  height: 100.0,
                  color: Colors.lightBlue[800],
                  onPressed: startVowel,
                  child: new Text("ฝึกอ่านคำ",
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

  void startAlphabet(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Alphabet()));
    });
  }
  void startVowel(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Vowel()));
    });
  }
}
