import 'package:flutter/material.dart';
import 'package:tll/Quiz/alphabetquiz.dart';

void main(){
  runApp(
      new MaterialApp(
        home: new AnimalQuiz3Ch(),
      )
  );
}

class AnimalQuiz3Ch extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new AnimalQuizState();
  }
}

class AnimalQuizState extends State<AnimalQuiz3Ch>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("เพลินๆกับเกม"),
        backgroundColor: Colors.blue,
      ),


      body: new Container(
        margin: const EdgeInsets.all(15.0),
        child: new Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new MaterialButton(
                height: 500.0,
                color: Colors.blue[200],
                onPressed: startQuiz,

                child:
                new Container(
                    constraints: new BoxConstraints.expand(
                      height: 180.0,
                    ),
                    padding: new EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage('images/kidjump.gif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: new Stack(
                      children: <Widget>[
                        new Positioned(
                          left: 43.0,
                          top: 0.0,
                          child: new Text('เรียนเพลินกับเกมกันเถอะ',
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )
                          ),
                        ),
                        new Positioned(
                          right: 0.0,
                          bottom: 0.0,
                          child: new Icon(Icons.arrow_forward_ios),

                        ),
                        new Positioned(
                          left: 38.0,
                          bottom: 0.0,
                          child: new Text('www.kidlovescode.com',
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )
                          ),
                        ),

                      ],
                    )
                /*new Text("แบบทดสอบ",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  ),)
                */
            )
            ) ],
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

    );
  }

  void startQuiz(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz1()));
    });
  }
}
