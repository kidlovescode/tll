import 'package:flutter/material.dart';
import 'package:tll/Category/ListCategory.dart';
import 'package:tll/Category/ListCategory2.dart';
import 'package:tll/Category/ListCategory3.dart';
import 'package:tll/Category/ListCategory4.dart';
import 'package:tll/Category/ListCategory5.dart';

/*
void main() => runApp(Entry());
class Logic {
  void doSomething() {
    print("doing something");
  }
}
class Entry extends StatelessWidget {
  final Logic logic=null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'เรียนภาษาไทยแสนสนุก',
      home: Scaffold(
        appBar: AppBar(
          title: Text('เรียนภาษาไทยแสนสนุก'),
        ),
        body:

        Center(
        child: Column(
          children: <Widget>[

            const FlatButton(
              child: Text('หมวดการอ่านออกเสียง', semanticsLabel: 'DISABLED BUTTON 3',),
              onPressed: null,

            ),
            const FlatButton(
              child: Text('หมวดการเรียนรู้คำ 1 ', semanticsLabel: 'DISABLED BUTTON 3',),
              onPressed: null,
            ),
            const FlatButton(
              child: Text('หมวดการเรียนรู้คำ 2', semanticsLabel: 'DISABLED BUTTON 3',),
              onPressed: null,
            ),
            const FlatButton(
              child: Text('หมวดการอ่านจับใจความ', semanticsLabel: 'DISABLED BUTTON 3',),
              onPressed: null,
            ),
            const FlatButton(
              child: Text('หมวดการเขียน', semanticsLabel: 'DISABLED BUTTON 3',),
              onPressed: null,
            ),

          ],


    ),

              ),
      ),

        );

    }
}
*/


void main(){
  runApp(
      new MaterialApp(
        home: new Entry(),
      )
  );
}

class Entry extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new EntryState();
  }
}

class EntryState extends State<Entry>{
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
                height: 50.0,
                color: Colors.green,
                onPressed: startQuiz1,
                child: new Text("หมวดหมู่การอ่านออกเสียง",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  ),)
            ),
            new MaterialButton(
                height: 50.0,
                color: Colors.lightBlue,
                onPressed: startQuiz2,
                child: new Text("หมวดหมู่การเรียนรู้คำ 1 ",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  ),)
            ),
            new MaterialButton(
                height: 50.0,
                color: Colors.amber,
                onPressed: startQuiz3,
                child: new Text("หมวดหมู่การเรียนรู้คำ 2 ",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  ),)
            ),
            new MaterialButton(
                height: 50.0,
                color: Colors.deepPurple,
                onPressed: startQuiz4,
                child: new Text("หมวดหมู่การอ่านจับใจความ ",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  ),)
            ),
            new MaterialButton(
                height: 50.0,
                color: Colors.deepOrangeAccent,
                onPressed: startQuiz5,
                child: new Text("หมวดหมู่การเขียน ",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  ),)
            ),
            new Image.network("http://www.inspireadviser.com/gamethai/pic/logo.png")
          ],
        ),
      ),


    );
  }

  void startQuiz1(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new ListCategory2()));
    });
  }
  void startQuiz2(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new ListCategory1()));
    });
  }
  void startQuiz3(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new ListCategory3()));
    });
  }
  void startQuiz4(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new ListCategory4()));
    });
  }
  void startQuiz5(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new ListCategory5()));
    });
  }
}

