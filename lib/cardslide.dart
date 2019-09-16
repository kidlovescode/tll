import 'package:flutter/material.dart';
import 'dart:async';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}var lesson = Lesson();

class Lesson{

  var lessontopic = [{"title","topic,topic2, topic3, topic4,topic5"},
                    {{"title","topic,topic2, topic3, topic4,topic5","topic6"}},
                    {{"title","topic,topic2, topic3, topic4,topic5"}},
                    {{"title","topic,topic2, topic3, topic4,topic5"}},{{"title","topic,topic2, topic3, topic4,topic5"}}];
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('เรียนรู้คำ'),
        backgroundColor: Colors.red,
      ),
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new CustomScrollView(
        //width: 2000,
          slivers: <Widget>[
            SliverPadding(
                padding: EdgeInsets.all(16.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    // To convert this infinite list to a list with three items,
                    // uncomment the following line:
                    // if (index > 3) return null;
                    //return Container(color: Colors.green, height: 150.0);
                    return new DrawTopic(index);
                  },
                    // Or, uncomment the following line:
                    childCount: lesson.lessontopic.length,

                  ),
                ))
          ]


          child: new Column(
          children:[
          new Row(
            children: <Widget>[
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      new Text('Hello World'),
                      new Text('How are you?')
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      new Text('Hello World'),
                      new Text('How are you?')
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      new Text('Hello World'),
                      new Text('How are you?')
                    ],
                  ),
                ),
              )
            ],
          ),
            new Row(
              children: <Widget>[
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                )
              ],
            ),
            new Row(
              children: <Widget>[
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                )
              ],
            ),
            new Row(
              children: <Widget>[
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                )
              ],
            ),
            new Row(
              children: <Widget>[
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                )
              ],
            ),

          ]
        ),
      ),
    );
  }
}
